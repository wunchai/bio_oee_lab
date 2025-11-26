// lib/data/database/daos/user_dao.dart
import 'package:drift/drift.dart';
import 'package:bio_oee_lab/data/database/app_database.dart'; // Import your main database
import 'package:bio_oee_lab/data/database/tables/user_table.dart'; // Import your table

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  /*
  // Equivalent to suspend fun insertUser(user: DbUser) in DaoUser.kt
  Future<int> insertUser(UsersCompanion entry) => into(users).insert(entry);
*/

  // Equivalent to suspend fun insertAll(users: List<DbUser>)
  Future<void> insertAllUsers(List<UsersCompanion> entries) async {
    await batch((batch) {
      batch.insertAll(users, entries);
    });
  }

  Future<void> batchInsertUsers(List<DbUser> userList) {
    final companions = userList.map((user) {
      // เราใช้ "Companion" เพื่อระบุเฉพาะ field ที่เราต้องการ insert
      // และ "เว้นว่าง" field 'uid' ไว้
      return UsersCompanion(
        userId: Value(user.userId),
        userCode: Value(user.userCode),
        userName: Value(user.userName),
        position: Value(user.position),
        status: Value(user.status),
      );
    }).toList();

    return db.batch((batch) {
      batch.insertAll(
        users, // ตาราง 'Users'
        companions,
        mode: InsertMode.insert, // ใส่ทับถ้ามี
      );
    });
  }

  /// NEW: Updates an existing user record.
  Future<bool> updateUser(UsersCompanion entry) {
    return update(users).replace(entry);
  }

  Future<DbUser?> findUserByUserId(String userId) {
    return (select(
      users,
    )..where((tbl) => tbl.userId.equals(userId))).getSingleOrNull();
  }

  /// NEW: Gets a single user record by its userId.
  Future<DbUser?> getUserByUserId(String userId) {
    return (select(
      users,
    )..where((tbl) => tbl.userId.equals(userId))).getSingleOrNull();
  }

  /// NEW: Gets the latest lastSync timestamp from the users table.
  Future<String?> getLastSync() async {
    final result = await customSelect(
      'SELECT MAX(lastSync) FROM users', // Raw SQL to get max lastSync
    ).getSingleOrNull();

    return result?.data.values.first
        ?.toString(); // Safely extract and convert to String
  }

  // Equivalent to suspend fun getUser(userId: String): DbUser?
  Future<DbUser?> getUser(String userId) {
    return (select(
      users,
    )..where((tbl) => tbl.userId.equals(userId))).getSingleOrNull();
  }

  // Equivalent to suspend fun getLogin(userCode: String, password: String): DbUser?
  Future<DbUser?> getLogin(String userId, String password) {
    print(
      'Attempting login with userId: $userId, password: $password',
    ); // <<< Add this
    final query = (select(users)
      ..where(
        (tbl) => tbl.userId.equals(userId) & tbl.password.equals(password),
      ));
    print(
      'Generated SQL for getLogin: ${query.toString()}',
    ); // Useful for debugging raw SQL
    return query.getSingleOrNull().then((dbUser) {
      if (dbUser == null) {
        print('No user found for given credentials.');
      } else {
        print('User found: ${dbUser.userName}, UserID: ${dbUser.userId}');
      }
      return dbUser;
    });
  }

  // Equivalent to suspend fun getAllUser(): List<DbUser>
  Stream<List<DbUser>> watchAllUsers() => select(users).watch();
  Future<List<DbUser>> getAllUsers() => select(users).get();

  // Equivalent to suspend fun deleteUser(user: DbUser)
  Future<int> deleteUser(DbUser entry) => delete(users).delete(entry);

  // Equivalent to suspend fun deleteAll()
  Future<int> deleteAllUsers() => delete(users).go();

  //// 1. ดึงผู้ใช้ที่ Login อยู่ (เฉพาะที่มีสถานะ Active)
  Future<DbUser?> getLoggedInUser() {
    return (select(users)
          ..where((tbl) => tbl.isLocalSessionActive.equals(true))
          ..limit(1))
        .getSingleOrNull();
  }

  /// 2. ลบผู้ใช้ทั้งหมด
  // ⬇️ สั่งลบจากตาราง 'users'
  Future<int> clearAllUsers() => delete(users).go();

  /// 3. บันทึกผู้ใช้ (ถ้ามีอยู่แล้วจะทับที่)
  Future<void> insertUser(DbUser user) =>
      into(users).insert(user, mode: InsertMode.replace);

  /// 4. อัปเดตสถานะ Session ของ User
  Future<void> updateUserSessionStatus(String userId, bool isActive) async {
    // update statement
    await (update(users)..where((t) => t.userId.equals(userId))).write(
      UsersCompanion(isLocalSessionActive: Value(isActive)),
    );
  }

  // --- ⬆️⬆️⬆️ สิ้นสุดส่วนที่แก้ไข ⬆️⬆️⬆️ ---
}
