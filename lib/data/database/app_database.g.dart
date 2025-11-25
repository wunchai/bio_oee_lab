// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $JobsTable extends Jobs with TableInfo<$JobsTable, DbJob> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<String> jobId = GeneratedColumn<String>(
    'jobId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobNameMeta = const VerificationMeta(
    'jobName',
  );
  @override
  late final GeneratedColumn<String> jobName = GeneratedColumn<String>(
    'JobName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineNameMeta = const VerificationMeta(
    'machineName',
  );
  @override
  late final GeneratedColumn<String> machineName = GeneratedColumn<String>(
    'MachineName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'DocumentId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'Location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobStatusMeta = const VerificationMeta(
    'jobStatus',
  );
  @override
  late final GeneratedColumn<int> jobStatus = GeneratedColumn<int>(
    'JobStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createDateMeta = const VerificationMeta(
    'createDate',
  );
  @override
  late final GeneratedColumn<String> createDate = GeneratedColumn<String>(
    'CreateDate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createByMeta = const VerificationMeta(
    'createBy',
  );
  @override
  late final GeneratedColumn<String> createBy = GeneratedColumn<String>(
    'CreateBy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    jobId,
    jobName,
    machineName,
    documentId,
    location,
    jobStatus,
    lastSync,
    createDate,
    createBy,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'jobs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbJob> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('jobId')) {
      context.handle(
        _jobIdMeta,
        jobId.isAcceptableOrUnknown(data['jobId']!, _jobIdMeta),
      );
    }
    if (data.containsKey('JobName')) {
      context.handle(
        _jobNameMeta,
        jobName.isAcceptableOrUnknown(data['JobName']!, _jobNameMeta),
      );
    }
    if (data.containsKey('MachineName')) {
      context.handle(
        _machineNameMeta,
        machineName.isAcceptableOrUnknown(
          data['MachineName']!,
          _machineNameMeta,
        ),
      );
    }
    if (data.containsKey('DocumentId')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['DocumentId']!, _documentIdMeta),
      );
    }
    if (data.containsKey('Location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['Location']!, _locationMeta),
      );
    }
    if (data.containsKey('JobStatus')) {
      context.handle(
        _jobStatusMeta,
        jobStatus.isAcceptableOrUnknown(data['JobStatus']!, _jobStatusMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('CreateDate')) {
      context.handle(
        _createDateMeta,
        createDate.isAcceptableOrUnknown(data['CreateDate']!, _createDateMeta),
      );
    }
    if (data.containsKey('CreateBy')) {
      context.handle(
        _createByMeta,
        createBy.isAcceptableOrUnknown(data['CreateBy']!, _createByMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbJob map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbJob(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      jobId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jobId'],
      ),
      jobName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}JobName'],
      ),
      machineName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineName'],
      ),
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}DocumentId'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Location'],
      ),
      jobStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}JobStatus'],
      )!,
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      createDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CreateDate'],
      ),
      createBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CreateBy'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
    );
  }

  @override
  $JobsTable createAlias(String alias) {
    return $JobsTable(attachedDatabase, alias);
  }
}

class DbJob extends DataClass implements Insertable<DbJob> {
  final int uid;
  final String? jobId;
  final String? jobName;
  final String? machineName;
  final String? documentId;
  final String? location;
  final int jobStatus;
  final String? lastSync;
  final String? createDate;
  final String? createBy;
  final String? updatedAt;
  const DbJob({
    required this.uid,
    this.jobId,
    this.jobName,
    this.machineName,
    this.documentId,
    this.location,
    required this.jobStatus,
    this.lastSync,
    this.createDate,
    this.createBy,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || jobId != null) {
      map['jobId'] = Variable<String>(jobId);
    }
    if (!nullToAbsent || jobName != null) {
      map['JobName'] = Variable<String>(jobName);
    }
    if (!nullToAbsent || machineName != null) {
      map['MachineName'] = Variable<String>(machineName);
    }
    if (!nullToAbsent || documentId != null) {
      map['DocumentId'] = Variable<String>(documentId);
    }
    if (!nullToAbsent || location != null) {
      map['Location'] = Variable<String>(location);
    }
    map['JobStatus'] = Variable<int>(jobStatus);
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    if (!nullToAbsent || createDate != null) {
      map['CreateDate'] = Variable<String>(createDate);
    }
    if (!nullToAbsent || createBy != null) {
      map['CreateBy'] = Variable<String>(createBy);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    return map;
  }

  JobsCompanion toCompanion(bool nullToAbsent) {
    return JobsCompanion(
      uid: Value(uid),
      jobId: jobId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobId),
      jobName: jobName == null && nullToAbsent
          ? const Value.absent()
          : Value(jobName),
      machineName: machineName == null && nullToAbsent
          ? const Value.absent()
          : Value(machineName),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      jobStatus: Value(jobStatus),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      createDate: createDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createDate),
      createBy: createBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createBy),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbJob.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbJob(
      uid: serializer.fromJson<int>(json['uid']),
      jobId: serializer.fromJson<String?>(json['jobId']),
      jobName: serializer.fromJson<String?>(json['jobName']),
      machineName: serializer.fromJson<String?>(json['machineName']),
      documentId: serializer.fromJson<String?>(json['documentId']),
      location: serializer.fromJson<String?>(json['location']),
      jobStatus: serializer.fromJson<int>(json['jobStatus']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      createDate: serializer.fromJson<String?>(json['createDate']),
      createBy: serializer.fromJson<String?>(json['createBy']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'jobId': serializer.toJson<String?>(jobId),
      'jobName': serializer.toJson<String?>(jobName),
      'machineName': serializer.toJson<String?>(machineName),
      'documentId': serializer.toJson<String?>(documentId),
      'location': serializer.toJson<String?>(location),
      'jobStatus': serializer.toJson<int>(jobStatus),
      'lastSync': serializer.toJson<String?>(lastSync),
      'createDate': serializer.toJson<String?>(createDate),
      'createBy': serializer.toJson<String?>(createBy),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  DbJob copyWith({
    int? uid,
    Value<String?> jobId = const Value.absent(),
    Value<String?> jobName = const Value.absent(),
    Value<String?> machineName = const Value.absent(),
    Value<String?> documentId = const Value.absent(),
    Value<String?> location = const Value.absent(),
    int? jobStatus,
    Value<String?> lastSync = const Value.absent(),
    Value<String?> createDate = const Value.absent(),
    Value<String?> createBy = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
  }) => DbJob(
    uid: uid ?? this.uid,
    jobId: jobId.present ? jobId.value : this.jobId,
    jobName: jobName.present ? jobName.value : this.jobName,
    machineName: machineName.present ? machineName.value : this.machineName,
    documentId: documentId.present ? documentId.value : this.documentId,
    location: location.present ? location.value : this.location,
    jobStatus: jobStatus ?? this.jobStatus,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    createDate: createDate.present ? createDate.value : this.createDate,
    createBy: createBy.present ? createBy.value : this.createBy,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbJob copyWithCompanion(JobsCompanion data) {
    return DbJob(
      uid: data.uid.present ? data.uid.value : this.uid,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      jobName: data.jobName.present ? data.jobName.value : this.jobName,
      machineName: data.machineName.present
          ? data.machineName.value
          : this.machineName,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      location: data.location.present ? data.location.value : this.location,
      jobStatus: data.jobStatus.present ? data.jobStatus.value : this.jobStatus,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      createDate: data.createDate.present
          ? data.createDate.value
          : this.createDate,
      createBy: data.createBy.present ? data.createBy.value : this.createBy,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbJob(')
          ..write('uid: $uid, ')
          ..write('jobId: $jobId, ')
          ..write('jobName: $jobName, ')
          ..write('machineName: $machineName, ')
          ..write('documentId: $documentId, ')
          ..write('location: $location, ')
          ..write('jobStatus: $jobStatus, ')
          ..write('lastSync: $lastSync, ')
          ..write('createDate: $createDate, ')
          ..write('createBy: $createBy, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    jobId,
    jobName,
    machineName,
    documentId,
    location,
    jobStatus,
    lastSync,
    createDate,
    createBy,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbJob &&
          other.uid == this.uid &&
          other.jobId == this.jobId &&
          other.jobName == this.jobName &&
          other.machineName == this.machineName &&
          other.documentId == this.documentId &&
          other.location == this.location &&
          other.jobStatus == this.jobStatus &&
          other.lastSync == this.lastSync &&
          other.createDate == this.createDate &&
          other.createBy == this.createBy &&
          other.updatedAt == this.updatedAt);
}

class JobsCompanion extends UpdateCompanion<DbJob> {
  final Value<int> uid;
  final Value<String?> jobId;
  final Value<String?> jobName;
  final Value<String?> machineName;
  final Value<String?> documentId;
  final Value<String?> location;
  final Value<int> jobStatus;
  final Value<String?> lastSync;
  final Value<String?> createDate;
  final Value<String?> createBy;
  final Value<String?> updatedAt;
  const JobsCompanion({
    this.uid = const Value.absent(),
    this.jobId = const Value.absent(),
    this.jobName = const Value.absent(),
    this.machineName = const Value.absent(),
    this.documentId = const Value.absent(),
    this.location = const Value.absent(),
    this.jobStatus = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.createDate = const Value.absent(),
    this.createBy = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  JobsCompanion.insert({
    this.uid = const Value.absent(),
    this.jobId = const Value.absent(),
    this.jobName = const Value.absent(),
    this.machineName = const Value.absent(),
    this.documentId = const Value.absent(),
    this.location = const Value.absent(),
    this.jobStatus = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.createDate = const Value.absent(),
    this.createBy = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<DbJob> custom({
    Expression<int>? uid,
    Expression<String>? jobId,
    Expression<String>? jobName,
    Expression<String>? machineName,
    Expression<String>? documentId,
    Expression<String>? location,
    Expression<int>? jobStatus,
    Expression<String>? lastSync,
    Expression<String>? createDate,
    Expression<String>? createBy,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (jobId != null) 'jobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (machineName != null) 'MachineName': machineName,
      if (documentId != null) 'DocumentId': documentId,
      if (location != null) 'Location': location,
      if (jobStatus != null) 'JobStatus': jobStatus,
      if (lastSync != null) 'lastSync': lastSync,
      if (createDate != null) 'CreateDate': createDate,
      if (createBy != null) 'CreateBy': createBy,
      if (updatedAt != null) 'updatedAt': updatedAt,
    });
  }

  JobsCompanion copyWith({
    Value<int>? uid,
    Value<String?>? jobId,
    Value<String?>? jobName,
    Value<String?>? machineName,
    Value<String?>? documentId,
    Value<String?>? location,
    Value<int>? jobStatus,
    Value<String?>? lastSync,
    Value<String?>? createDate,
    Value<String?>? createBy,
    Value<String?>? updatedAt,
  }) {
    return JobsCompanion(
      uid: uid ?? this.uid,
      jobId: jobId ?? this.jobId,
      jobName: jobName ?? this.jobName,
      machineName: machineName ?? this.machineName,
      documentId: documentId ?? this.documentId,
      location: location ?? this.location,
      jobStatus: jobStatus ?? this.jobStatus,
      lastSync: lastSync ?? this.lastSync,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (jobId.present) {
      map['jobId'] = Variable<String>(jobId.value);
    }
    if (jobName.present) {
      map['JobName'] = Variable<String>(jobName.value);
    }
    if (machineName.present) {
      map['MachineName'] = Variable<String>(machineName.value);
    }
    if (documentId.present) {
      map['DocumentId'] = Variable<String>(documentId.value);
    }
    if (location.present) {
      map['Location'] = Variable<String>(location.value);
    }
    if (jobStatus.present) {
      map['JobStatus'] = Variable<int>(jobStatus.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (createDate.present) {
      map['CreateDate'] = Variable<String>(createDate.value);
    }
    if (createBy.present) {
      map['CreateBy'] = Variable<String>(createBy.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobsCompanion(')
          ..write('uid: $uid, ')
          ..write('jobId: $jobId, ')
          ..write('jobName: $jobName, ')
          ..write('machineName: $machineName, ')
          ..write('documentId: $documentId, ')
          ..write('location: $location, ')
          ..write('jobStatus: $jobStatus, ')
          ..write('lastSync: $lastSync, ')
          ..write('createDate: $createDate, ')
          ..write('createBy: $createBy, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DocumentsTable extends Documents
    with TableInfo<$DocumentsTable, DbDocument> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'documentId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<String> jobId = GeneratedColumn<String>(
    'jobId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _documentNameMeta = const VerificationMeta(
    'documentName',
  );
  @override
  late final GeneratedColumn<String> documentName = GeneratedColumn<String>(
    'documentName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'userId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createDateMeta = const VerificationMeta(
    'createDate',
  );
  @override
  late final GeneratedColumn<String> createDate = GeneratedColumn<String>(
    'createDate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'syncStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _runningDateMeta = const VerificationMeta(
    'runningDate',
  );
  @override
  late final GeneratedColumn<String> runningDate = GeneratedColumn<String>(
    'RunningDate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<String> endDate = GeneratedColumn<String>(
    'EndDate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deleteDateMeta = const VerificationMeta(
    'deleteDate',
  );
  @override
  late final GeneratedColumn<String> deleteDate = GeneratedColumn<String>(
    'DeleteDate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cancelDateMeta = const VerificationMeta(
    'cancelDate',
  );
  @override
  late final GeneratedColumn<String> cancelDate = GeneratedColumn<String>(
    'CancleDate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _postDateMeta = const VerificationMeta(
    'postDate',
  );
  @override
  late final GeneratedColumn<String> postDate = GeneratedColumn<String>(
    'PostDate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    documentId,
    jobId,
    documentName,
    userId,
    createDate,
    status,
    lastSync,
    updatedAt,
    syncStatus,
    runningDate,
    endDate,
    deleteDate,
    cancelDate,
    postDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbDocument> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('documentId')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['documentId']!, _documentIdMeta),
      );
    }
    if (data.containsKey('jobId')) {
      context.handle(
        _jobIdMeta,
        jobId.isAcceptableOrUnknown(data['jobId']!, _jobIdMeta),
      );
    }
    if (data.containsKey('documentName')) {
      context.handle(
        _documentNameMeta,
        documentName.isAcceptableOrUnknown(
          data['documentName']!,
          _documentNameMeta,
        ),
      );
    }
    if (data.containsKey('userId')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['userId']!, _userIdMeta),
      );
    }
    if (data.containsKey('createDate')) {
      context.handle(
        _createDateMeta,
        createDate.isAcceptableOrUnknown(data['createDate']!, _createDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('syncStatus')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['syncStatus']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('RunningDate')) {
      context.handle(
        _runningDateMeta,
        runningDate.isAcceptableOrUnknown(
          data['RunningDate']!,
          _runningDateMeta,
        ),
      );
    }
    if (data.containsKey('EndDate')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['EndDate']!, _endDateMeta),
      );
    }
    if (data.containsKey('DeleteDate')) {
      context.handle(
        _deleteDateMeta,
        deleteDate.isAcceptableOrUnknown(data['DeleteDate']!, _deleteDateMeta),
      );
    }
    if (data.containsKey('CancleDate')) {
      context.handle(
        _cancelDateMeta,
        cancelDate.isAcceptableOrUnknown(data['CancleDate']!, _cancelDateMeta),
      );
    }
    if (data.containsKey('PostDate')) {
      context.handle(
        _postDateMeta,
        postDate.isAcceptableOrUnknown(data['PostDate']!, _postDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbDocument map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbDocument(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentId'],
      ),
      jobId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jobId'],
      ),
      documentName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentName'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}userId'],
      ),
      createDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}createDate'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}syncStatus'],
      )!,
      runningDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}RunningDate'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}EndDate'],
      ),
      deleteDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}DeleteDate'],
      ),
      cancelDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CancleDate'],
      ),
      postDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}PostDate'],
      ),
    );
  }

  @override
  $DocumentsTable createAlias(String alias) {
    return $DocumentsTable(attachedDatabase, alias);
  }
}

class DbDocument extends DataClass implements Insertable<DbDocument> {
  final int uid;
  final String? documentId;
  final String? jobId;
  final String? documentName;
  final String? userId;
  final String? createDate;
  final int status;
  final String? lastSync;
  final String? updatedAt;
  final int syncStatus;
  final String? runningDate;
  final String? endDate;
  final String? deleteDate;
  final String? cancelDate;
  final String? postDate;
  const DbDocument({
    required this.uid,
    this.documentId,
    this.jobId,
    this.documentName,
    this.userId,
    this.createDate,
    required this.status,
    this.lastSync,
    this.updatedAt,
    required this.syncStatus,
    this.runningDate,
    this.endDate,
    this.deleteDate,
    this.cancelDate,
    this.postDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || documentId != null) {
      map['documentId'] = Variable<String>(documentId);
    }
    if (!nullToAbsent || jobId != null) {
      map['jobId'] = Variable<String>(jobId);
    }
    if (!nullToAbsent || documentName != null) {
      map['documentName'] = Variable<String>(documentName);
    }
    if (!nullToAbsent || userId != null) {
      map['userId'] = Variable<String>(userId);
    }
    if (!nullToAbsent || createDate != null) {
      map['createDate'] = Variable<String>(createDate);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    map['syncStatus'] = Variable<int>(syncStatus);
    if (!nullToAbsent || runningDate != null) {
      map['RunningDate'] = Variable<String>(runningDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['EndDate'] = Variable<String>(endDate);
    }
    if (!nullToAbsent || deleteDate != null) {
      map['DeleteDate'] = Variable<String>(deleteDate);
    }
    if (!nullToAbsent || cancelDate != null) {
      map['CancleDate'] = Variable<String>(cancelDate);
    }
    if (!nullToAbsent || postDate != null) {
      map['PostDate'] = Variable<String>(postDate);
    }
    return map;
  }

  DocumentsCompanion toCompanion(bool nullToAbsent) {
    return DocumentsCompanion(
      uid: Value(uid),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      jobId: jobId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobId),
      documentName: documentName == null && nullToAbsent
          ? const Value.absent()
          : Value(documentName),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createDate: createDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createDate),
      status: Value(status),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      syncStatus: Value(syncStatus),
      runningDate: runningDate == null && nullToAbsent
          ? const Value.absent()
          : Value(runningDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      deleteDate: deleteDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deleteDate),
      cancelDate: cancelDate == null && nullToAbsent
          ? const Value.absent()
          : Value(cancelDate),
      postDate: postDate == null && nullToAbsent
          ? const Value.absent()
          : Value(postDate),
    );
  }

  factory DbDocument.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbDocument(
      uid: serializer.fromJson<int>(json['uid']),
      documentId: serializer.fromJson<String?>(json['documentId']),
      jobId: serializer.fromJson<String?>(json['jobId']),
      documentName: serializer.fromJson<String?>(json['documentName']),
      userId: serializer.fromJson<String?>(json['userId']),
      createDate: serializer.fromJson<String?>(json['createDate']),
      status: serializer.fromJson<int>(json['status']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
      runningDate: serializer.fromJson<String?>(json['runningDate']),
      endDate: serializer.fromJson<String?>(json['endDate']),
      deleteDate: serializer.fromJson<String?>(json['deleteDate']),
      cancelDate: serializer.fromJson<String?>(json['cancelDate']),
      postDate: serializer.fromJson<String?>(json['postDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'documentId': serializer.toJson<String?>(documentId),
      'jobId': serializer.toJson<String?>(jobId),
      'documentName': serializer.toJson<String?>(documentName),
      'userId': serializer.toJson<String?>(userId),
      'createDate': serializer.toJson<String?>(createDate),
      'status': serializer.toJson<int>(status),
      'lastSync': serializer.toJson<String?>(lastSync),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'syncStatus': serializer.toJson<int>(syncStatus),
      'runningDate': serializer.toJson<String?>(runningDate),
      'endDate': serializer.toJson<String?>(endDate),
      'deleteDate': serializer.toJson<String?>(deleteDate),
      'cancelDate': serializer.toJson<String?>(cancelDate),
      'postDate': serializer.toJson<String?>(postDate),
    };
  }

  DbDocument copyWith({
    int? uid,
    Value<String?> documentId = const Value.absent(),
    Value<String?> jobId = const Value.absent(),
    Value<String?> documentName = const Value.absent(),
    Value<String?> userId = const Value.absent(),
    Value<String?> createDate = const Value.absent(),
    int? status,
    Value<String?> lastSync = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
    int? syncStatus,
    Value<String?> runningDate = const Value.absent(),
    Value<String?> endDate = const Value.absent(),
    Value<String?> deleteDate = const Value.absent(),
    Value<String?> cancelDate = const Value.absent(),
    Value<String?> postDate = const Value.absent(),
  }) => DbDocument(
    uid: uid ?? this.uid,
    documentId: documentId.present ? documentId.value : this.documentId,
    jobId: jobId.present ? jobId.value : this.jobId,
    documentName: documentName.present ? documentName.value : this.documentName,
    userId: userId.present ? userId.value : this.userId,
    createDate: createDate.present ? createDate.value : this.createDate,
    status: status ?? this.status,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    runningDate: runningDate.present ? runningDate.value : this.runningDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    deleteDate: deleteDate.present ? deleteDate.value : this.deleteDate,
    cancelDate: cancelDate.present ? cancelDate.value : this.cancelDate,
    postDate: postDate.present ? postDate.value : this.postDate,
  );
  DbDocument copyWithCompanion(DocumentsCompanion data) {
    return DbDocument(
      uid: data.uid.present ? data.uid.value : this.uid,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      documentName: data.documentName.present
          ? data.documentName.value
          : this.documentName,
      userId: data.userId.present ? data.userId.value : this.userId,
      createDate: data.createDate.present
          ? data.createDate.value
          : this.createDate,
      status: data.status.present ? data.status.value : this.status,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      runningDate: data.runningDate.present
          ? data.runningDate.value
          : this.runningDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      deleteDate: data.deleteDate.present
          ? data.deleteDate.value
          : this.deleteDate,
      cancelDate: data.cancelDate.present
          ? data.cancelDate.value
          : this.cancelDate,
      postDate: data.postDate.present ? data.postDate.value : this.postDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbDocument(')
          ..write('uid: $uid, ')
          ..write('documentId: $documentId, ')
          ..write('jobId: $jobId, ')
          ..write('documentName: $documentName, ')
          ..write('userId: $userId, ')
          ..write('createDate: $createDate, ')
          ..write('status: $status, ')
          ..write('lastSync: $lastSync, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('runningDate: $runningDate, ')
          ..write('endDate: $endDate, ')
          ..write('deleteDate: $deleteDate, ')
          ..write('cancelDate: $cancelDate, ')
          ..write('postDate: $postDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    documentId,
    jobId,
    documentName,
    userId,
    createDate,
    status,
    lastSync,
    updatedAt,
    syncStatus,
    runningDate,
    endDate,
    deleteDate,
    cancelDate,
    postDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbDocument &&
          other.uid == this.uid &&
          other.documentId == this.documentId &&
          other.jobId == this.jobId &&
          other.documentName == this.documentName &&
          other.userId == this.userId &&
          other.createDate == this.createDate &&
          other.status == this.status &&
          other.lastSync == this.lastSync &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus &&
          other.runningDate == this.runningDate &&
          other.endDate == this.endDate &&
          other.deleteDate == this.deleteDate &&
          other.cancelDate == this.cancelDate &&
          other.postDate == this.postDate);
}

class DocumentsCompanion extends UpdateCompanion<DbDocument> {
  final Value<int> uid;
  final Value<String?> documentId;
  final Value<String?> jobId;
  final Value<String?> documentName;
  final Value<String?> userId;
  final Value<String?> createDate;
  final Value<int> status;
  final Value<String?> lastSync;
  final Value<String?> updatedAt;
  final Value<int> syncStatus;
  final Value<String?> runningDate;
  final Value<String?> endDate;
  final Value<String?> deleteDate;
  final Value<String?> cancelDate;
  final Value<String?> postDate;
  const DocumentsCompanion({
    this.uid = const Value.absent(),
    this.documentId = const Value.absent(),
    this.jobId = const Value.absent(),
    this.documentName = const Value.absent(),
    this.userId = const Value.absent(),
    this.createDate = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.runningDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.deleteDate = const Value.absent(),
    this.cancelDate = const Value.absent(),
    this.postDate = const Value.absent(),
  });
  DocumentsCompanion.insert({
    this.uid = const Value.absent(),
    this.documentId = const Value.absent(),
    this.jobId = const Value.absent(),
    this.documentName = const Value.absent(),
    this.userId = const Value.absent(),
    this.createDate = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.runningDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.deleteDate = const Value.absent(),
    this.cancelDate = const Value.absent(),
    this.postDate = const Value.absent(),
  });
  static Insertable<DbDocument> custom({
    Expression<int>? uid,
    Expression<String>? documentId,
    Expression<String>? jobId,
    Expression<String>? documentName,
    Expression<String>? userId,
    Expression<String>? createDate,
    Expression<int>? status,
    Expression<String>? lastSync,
    Expression<String>? updatedAt,
    Expression<int>? syncStatus,
    Expression<String>? runningDate,
    Expression<String>? endDate,
    Expression<String>? deleteDate,
    Expression<String>? cancelDate,
    Expression<String>? postDate,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (documentId != null) 'documentId': documentId,
      if (jobId != null) 'jobId': jobId,
      if (documentName != null) 'documentName': documentName,
      if (userId != null) 'userId': userId,
      if (createDate != null) 'createDate': createDate,
      if (status != null) 'status': status,
      if (lastSync != null) 'lastSync': lastSync,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (syncStatus != null) 'syncStatus': syncStatus,
      if (runningDate != null) 'RunningDate': runningDate,
      if (endDate != null) 'EndDate': endDate,
      if (deleteDate != null) 'DeleteDate': deleteDate,
      if (cancelDate != null) 'CancleDate': cancelDate,
      if (postDate != null) 'PostDate': postDate,
    });
  }

  DocumentsCompanion copyWith({
    Value<int>? uid,
    Value<String?>? documentId,
    Value<String?>? jobId,
    Value<String?>? documentName,
    Value<String?>? userId,
    Value<String?>? createDate,
    Value<int>? status,
    Value<String?>? lastSync,
    Value<String?>? updatedAt,
    Value<int>? syncStatus,
    Value<String?>? runningDate,
    Value<String?>? endDate,
    Value<String?>? deleteDate,
    Value<String?>? cancelDate,
    Value<String?>? postDate,
  }) {
    return DocumentsCompanion(
      uid: uid ?? this.uid,
      documentId: documentId ?? this.documentId,
      jobId: jobId ?? this.jobId,
      documentName: documentName ?? this.documentName,
      userId: userId ?? this.userId,
      createDate: createDate ?? this.createDate,
      status: status ?? this.status,
      lastSync: lastSync ?? this.lastSync,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      runningDate: runningDate ?? this.runningDate,
      endDate: endDate ?? this.endDate,
      deleteDate: deleteDate ?? this.deleteDate,
      cancelDate: cancelDate ?? this.cancelDate,
      postDate: postDate ?? this.postDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (documentId.present) {
      map['documentId'] = Variable<String>(documentId.value);
    }
    if (jobId.present) {
      map['jobId'] = Variable<String>(jobId.value);
    }
    if (documentName.present) {
      map['documentName'] = Variable<String>(documentName.value);
    }
    if (userId.present) {
      map['userId'] = Variable<String>(userId.value);
    }
    if (createDate.present) {
      map['createDate'] = Variable<String>(createDate.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['syncStatus'] = Variable<int>(syncStatus.value);
    }
    if (runningDate.present) {
      map['RunningDate'] = Variable<String>(runningDate.value);
    }
    if (endDate.present) {
      map['EndDate'] = Variable<String>(endDate.value);
    }
    if (deleteDate.present) {
      map['DeleteDate'] = Variable<String>(deleteDate.value);
    }
    if (cancelDate.present) {
      map['CancleDate'] = Variable<String>(cancelDate.value);
    }
    if (postDate.present) {
      map['PostDate'] = Variable<String>(postDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsCompanion(')
          ..write('uid: $uid, ')
          ..write('documentId: $documentId, ')
          ..write('jobId: $jobId, ')
          ..write('documentName: $documentName, ')
          ..write('userId: $userId, ')
          ..write('createDate: $createDate, ')
          ..write('status: $status, ')
          ..write('lastSync: $lastSync, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('runningDate: $runningDate, ')
          ..write('endDate: $endDate, ')
          ..write('deleteDate: $deleteDate, ')
          ..write('cancelDate: $cancelDate, ')
          ..write('postDate: $postDate')
          ..write(')'))
        .toString();
  }
}

class $DocumentMachinesTable extends DocumentMachines
    with TableInfo<$DocumentMachinesTable, DbDocumentMachine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentMachinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<String> jobId = GeneratedColumn<String>(
    'JobId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'documentId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineIdMeta = const VerificationMeta(
    'machineId',
  );
  @override
  late final GeneratedColumn<String> machineId = GeneratedColumn<String>(
    'MachineId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineNameMeta = const VerificationMeta(
    'machineName',
  );
  @override
  late final GeneratedColumn<String> machineName = GeneratedColumn<String>(
    'MachineName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineTypeMeta = const VerificationMeta(
    'machineType',
  );
  @override
  late final GeneratedColumn<String> machineType = GeneratedColumn<String>(
    'MachineType',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'Description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specificationMeta = const VerificationMeta(
    'specification',
  );
  @override
  late final GeneratedColumn<String> specification = GeneratedColumn<String>(
    'Specification',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'Status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _uiTypeMeta = const VerificationMeta('uiType');
  @override
  late final GeneratedColumn<int> uiType = GeneratedColumn<int>(
    'ui_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createDateMeta = const VerificationMeta(
    'createDate',
  );
  @override
  late final GeneratedColumn<String> createDate = GeneratedColumn<String>(
    'CreateDate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createByMeta = const VerificationMeta(
    'createBy',
  );
  @override
  late final GeneratedColumn<String> createBy = GeneratedColumn<String>(
    'CreateBy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    jobId,
    documentId,
    machineId,
    machineName,
    machineType,
    description,
    specification,
    status,
    lastSync,
    uiType,
    id,
    createDate,
    createBy,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_machines';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbDocumentMachine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('JobId')) {
      context.handle(
        _jobIdMeta,
        jobId.isAcceptableOrUnknown(data['JobId']!, _jobIdMeta),
      );
    }
    if (data.containsKey('documentId')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['documentId']!, _documentIdMeta),
      );
    }
    if (data.containsKey('MachineId')) {
      context.handle(
        _machineIdMeta,
        machineId.isAcceptableOrUnknown(data['MachineId']!, _machineIdMeta),
      );
    }
    if (data.containsKey('MachineName')) {
      context.handle(
        _machineNameMeta,
        machineName.isAcceptableOrUnknown(
          data['MachineName']!,
          _machineNameMeta,
        ),
      );
    }
    if (data.containsKey('MachineType')) {
      context.handle(
        _machineTypeMeta,
        machineType.isAcceptableOrUnknown(
          data['MachineType']!,
          _machineTypeMeta,
        ),
      );
    }
    if (data.containsKey('Description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['Description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('Specification')) {
      context.handle(
        _specificationMeta,
        specification.isAcceptableOrUnknown(
          data['Specification']!,
          _specificationMeta,
        ),
      );
    }
    if (data.containsKey('Status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['Status']!, _statusMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('ui_type')) {
      context.handle(
        _uiTypeMeta,
        uiType.isAcceptableOrUnknown(data['ui_type']!, _uiTypeMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('CreateDate')) {
      context.handle(
        _createDateMeta,
        createDate.isAcceptableOrUnknown(data['CreateDate']!, _createDateMeta),
      );
    }
    if (data.containsKey('CreateBy')) {
      context.handle(
        _createByMeta,
        createBy.isAcceptableOrUnknown(data['CreateBy']!, _createByMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbDocumentMachine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbDocumentMachine(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      jobId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}JobId'],
      ),
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentId'],
      ),
      machineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineId'],
      ),
      machineName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineName'],
      ),
      machineType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineType'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Description'],
      ),
      specification: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Specification'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}Status'],
      )!,
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      uiType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ui_type'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CreateDate'],
      ),
      createBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CreateBy'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
    );
  }

  @override
  $DocumentMachinesTable createAlias(String alias) {
    return $DocumentMachinesTable(attachedDatabase, alias);
  }
}

class DbDocumentMachine extends DataClass
    implements Insertable<DbDocumentMachine> {
  final int uid;
  final String? jobId;
  final String? documentId;
  final String? machineId;
  final String? machineName;
  final String? machineType;
  final String? description;
  final String? specification;
  final int status;
  final String? lastSync;
  final int uiType;
  final int id;
  final String? createDate;
  final String? createBy;
  final String? updatedAt;
  const DbDocumentMachine({
    required this.uid,
    this.jobId,
    this.documentId,
    this.machineId,
    this.machineName,
    this.machineType,
    this.description,
    this.specification,
    required this.status,
    this.lastSync,
    required this.uiType,
    required this.id,
    this.createDate,
    this.createBy,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || jobId != null) {
      map['JobId'] = Variable<String>(jobId);
    }
    if (!nullToAbsent || documentId != null) {
      map['documentId'] = Variable<String>(documentId);
    }
    if (!nullToAbsent || machineId != null) {
      map['MachineId'] = Variable<String>(machineId);
    }
    if (!nullToAbsent || machineName != null) {
      map['MachineName'] = Variable<String>(machineName);
    }
    if (!nullToAbsent || machineType != null) {
      map['MachineType'] = Variable<String>(machineType);
    }
    if (!nullToAbsent || description != null) {
      map['Description'] = Variable<String>(description);
    }
    if (!nullToAbsent || specification != null) {
      map['Specification'] = Variable<String>(specification);
    }
    map['Status'] = Variable<int>(status);
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    map['ui_type'] = Variable<int>(uiType);
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || createDate != null) {
      map['CreateDate'] = Variable<String>(createDate);
    }
    if (!nullToAbsent || createBy != null) {
      map['CreateBy'] = Variable<String>(createBy);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    return map;
  }

  DocumentMachinesCompanion toCompanion(bool nullToAbsent) {
    return DocumentMachinesCompanion(
      uid: Value(uid),
      jobId: jobId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobId),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      machineId: machineId == null && nullToAbsent
          ? const Value.absent()
          : Value(machineId),
      machineName: machineName == null && nullToAbsent
          ? const Value.absent()
          : Value(machineName),
      machineType: machineType == null && nullToAbsent
          ? const Value.absent()
          : Value(machineType),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      specification: specification == null && nullToAbsent
          ? const Value.absent()
          : Value(specification),
      status: Value(status),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      uiType: Value(uiType),
      id: Value(id),
      createDate: createDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createDate),
      createBy: createBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createBy),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbDocumentMachine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbDocumentMachine(
      uid: serializer.fromJson<int>(json['uid']),
      jobId: serializer.fromJson<String?>(json['jobId']),
      documentId: serializer.fromJson<String?>(json['documentId']),
      machineId: serializer.fromJson<String?>(json['machineId']),
      machineName: serializer.fromJson<String?>(json['machineName']),
      machineType: serializer.fromJson<String?>(json['machineType']),
      description: serializer.fromJson<String?>(json['description']),
      specification: serializer.fromJson<String?>(json['specification']),
      status: serializer.fromJson<int>(json['status']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      uiType: serializer.fromJson<int>(json['uiType']),
      id: serializer.fromJson<int>(json['id']),
      createDate: serializer.fromJson<String?>(json['createDate']),
      createBy: serializer.fromJson<String?>(json['createBy']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'jobId': serializer.toJson<String?>(jobId),
      'documentId': serializer.toJson<String?>(documentId),
      'machineId': serializer.toJson<String?>(machineId),
      'machineName': serializer.toJson<String?>(machineName),
      'machineType': serializer.toJson<String?>(machineType),
      'description': serializer.toJson<String?>(description),
      'specification': serializer.toJson<String?>(specification),
      'status': serializer.toJson<int>(status),
      'lastSync': serializer.toJson<String?>(lastSync),
      'uiType': serializer.toJson<int>(uiType),
      'id': serializer.toJson<int>(id),
      'createDate': serializer.toJson<String?>(createDate),
      'createBy': serializer.toJson<String?>(createBy),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  DbDocumentMachine copyWith({
    int? uid,
    Value<String?> jobId = const Value.absent(),
    Value<String?> documentId = const Value.absent(),
    Value<String?> machineId = const Value.absent(),
    Value<String?> machineName = const Value.absent(),
    Value<String?> machineType = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> specification = const Value.absent(),
    int? status,
    Value<String?> lastSync = const Value.absent(),
    int? uiType,
    int? id,
    Value<String?> createDate = const Value.absent(),
    Value<String?> createBy = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
  }) => DbDocumentMachine(
    uid: uid ?? this.uid,
    jobId: jobId.present ? jobId.value : this.jobId,
    documentId: documentId.present ? documentId.value : this.documentId,
    machineId: machineId.present ? machineId.value : this.machineId,
    machineName: machineName.present ? machineName.value : this.machineName,
    machineType: machineType.present ? machineType.value : this.machineType,
    description: description.present ? description.value : this.description,
    specification: specification.present
        ? specification.value
        : this.specification,
    status: status ?? this.status,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    uiType: uiType ?? this.uiType,
    id: id ?? this.id,
    createDate: createDate.present ? createDate.value : this.createDate,
    createBy: createBy.present ? createBy.value : this.createBy,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbDocumentMachine copyWithCompanion(DocumentMachinesCompanion data) {
    return DbDocumentMachine(
      uid: data.uid.present ? data.uid.value : this.uid,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      machineId: data.machineId.present ? data.machineId.value : this.machineId,
      machineName: data.machineName.present
          ? data.machineName.value
          : this.machineName,
      machineType: data.machineType.present
          ? data.machineType.value
          : this.machineType,
      description: data.description.present
          ? data.description.value
          : this.description,
      specification: data.specification.present
          ? data.specification.value
          : this.specification,
      status: data.status.present ? data.status.value : this.status,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      uiType: data.uiType.present ? data.uiType.value : this.uiType,
      id: data.id.present ? data.id.value : this.id,
      createDate: data.createDate.present
          ? data.createDate.value
          : this.createDate,
      createBy: data.createBy.present ? data.createBy.value : this.createBy,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbDocumentMachine(')
          ..write('uid: $uid, ')
          ..write('jobId: $jobId, ')
          ..write('documentId: $documentId, ')
          ..write('machineId: $machineId, ')
          ..write('machineName: $machineName, ')
          ..write('machineType: $machineType, ')
          ..write('description: $description, ')
          ..write('specification: $specification, ')
          ..write('status: $status, ')
          ..write('lastSync: $lastSync, ')
          ..write('uiType: $uiType, ')
          ..write('id: $id, ')
          ..write('createDate: $createDate, ')
          ..write('createBy: $createBy, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    jobId,
    documentId,
    machineId,
    machineName,
    machineType,
    description,
    specification,
    status,
    lastSync,
    uiType,
    id,
    createDate,
    createBy,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbDocumentMachine &&
          other.uid == this.uid &&
          other.jobId == this.jobId &&
          other.documentId == this.documentId &&
          other.machineId == this.machineId &&
          other.machineName == this.machineName &&
          other.machineType == this.machineType &&
          other.description == this.description &&
          other.specification == this.specification &&
          other.status == this.status &&
          other.lastSync == this.lastSync &&
          other.uiType == this.uiType &&
          other.id == this.id &&
          other.createDate == this.createDate &&
          other.createBy == this.createBy &&
          other.updatedAt == this.updatedAt);
}

class DocumentMachinesCompanion extends UpdateCompanion<DbDocumentMachine> {
  final Value<int> uid;
  final Value<String?> jobId;
  final Value<String?> documentId;
  final Value<String?> machineId;
  final Value<String?> machineName;
  final Value<String?> machineType;
  final Value<String?> description;
  final Value<String?> specification;
  final Value<int> status;
  final Value<String?> lastSync;
  final Value<int> uiType;
  final Value<int> id;
  final Value<String?> createDate;
  final Value<String?> createBy;
  final Value<String?> updatedAt;
  const DocumentMachinesCompanion({
    this.uid = const Value.absent(),
    this.jobId = const Value.absent(),
    this.documentId = const Value.absent(),
    this.machineId = const Value.absent(),
    this.machineName = const Value.absent(),
    this.machineType = const Value.absent(),
    this.description = const Value.absent(),
    this.specification = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.uiType = const Value.absent(),
    this.id = const Value.absent(),
    this.createDate = const Value.absent(),
    this.createBy = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DocumentMachinesCompanion.insert({
    this.uid = const Value.absent(),
    this.jobId = const Value.absent(),
    this.documentId = const Value.absent(),
    this.machineId = const Value.absent(),
    this.machineName = const Value.absent(),
    this.machineType = const Value.absent(),
    this.description = const Value.absent(),
    this.specification = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.uiType = const Value.absent(),
    required int id,
    this.createDate = const Value.absent(),
    this.createBy = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : id = Value(id);
  static Insertable<DbDocumentMachine> custom({
    Expression<int>? uid,
    Expression<String>? jobId,
    Expression<String>? documentId,
    Expression<String>? machineId,
    Expression<String>? machineName,
    Expression<String>? machineType,
    Expression<String>? description,
    Expression<String>? specification,
    Expression<int>? status,
    Expression<String>? lastSync,
    Expression<int>? uiType,
    Expression<int>? id,
    Expression<String>? createDate,
    Expression<String>? createBy,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (jobId != null) 'JobId': jobId,
      if (documentId != null) 'documentId': documentId,
      if (machineId != null) 'MachineId': machineId,
      if (machineName != null) 'MachineName': machineName,
      if (machineType != null) 'MachineType': machineType,
      if (description != null) 'Description': description,
      if (specification != null) 'Specification': specification,
      if (status != null) 'Status': status,
      if (lastSync != null) 'lastSync': lastSync,
      if (uiType != null) 'ui_type': uiType,
      if (id != null) 'id': id,
      if (createDate != null) 'CreateDate': createDate,
      if (createBy != null) 'CreateBy': createBy,
      if (updatedAt != null) 'updatedAt': updatedAt,
    });
  }

  DocumentMachinesCompanion copyWith({
    Value<int>? uid,
    Value<String?>? jobId,
    Value<String?>? documentId,
    Value<String?>? machineId,
    Value<String?>? machineName,
    Value<String?>? machineType,
    Value<String?>? description,
    Value<String?>? specification,
    Value<int>? status,
    Value<String?>? lastSync,
    Value<int>? uiType,
    Value<int>? id,
    Value<String?>? createDate,
    Value<String?>? createBy,
    Value<String?>? updatedAt,
  }) {
    return DocumentMachinesCompanion(
      uid: uid ?? this.uid,
      jobId: jobId ?? this.jobId,
      documentId: documentId ?? this.documentId,
      machineId: machineId ?? this.machineId,
      machineName: machineName ?? this.machineName,
      machineType: machineType ?? this.machineType,
      description: description ?? this.description,
      specification: specification ?? this.specification,
      status: status ?? this.status,
      lastSync: lastSync ?? this.lastSync,
      uiType: uiType ?? this.uiType,
      id: id ?? this.id,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (jobId.present) {
      map['JobId'] = Variable<String>(jobId.value);
    }
    if (documentId.present) {
      map['documentId'] = Variable<String>(documentId.value);
    }
    if (machineId.present) {
      map['MachineId'] = Variable<String>(machineId.value);
    }
    if (machineName.present) {
      map['MachineName'] = Variable<String>(machineName.value);
    }
    if (machineType.present) {
      map['MachineType'] = Variable<String>(machineType.value);
    }
    if (description.present) {
      map['Description'] = Variable<String>(description.value);
    }
    if (specification.present) {
      map['Specification'] = Variable<String>(specification.value);
    }
    if (status.present) {
      map['Status'] = Variable<int>(status.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (uiType.present) {
      map['ui_type'] = Variable<int>(uiType.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createDate.present) {
      map['CreateDate'] = Variable<String>(createDate.value);
    }
    if (createBy.present) {
      map['CreateBy'] = Variable<String>(createBy.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentMachinesCompanion(')
          ..write('uid: $uid, ')
          ..write('jobId: $jobId, ')
          ..write('documentId: $documentId, ')
          ..write('machineId: $machineId, ')
          ..write('machineName: $machineName, ')
          ..write('machineType: $machineType, ')
          ..write('description: $description, ')
          ..write('specification: $specification, ')
          ..write('status: $status, ')
          ..write('lastSync: $lastSync, ')
          ..write('uiType: $uiType, ')
          ..write('id: $id, ')
          ..write('createDate: $createDate, ')
          ..write('createBy: $createBy, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DocumentRecordsTable extends DocumentRecords
    with TableInfo<$DocumentRecordsTable, DbDocumentRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'documentId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineIdMeta = const VerificationMeta(
    'machineId',
  );
  @override
  late final GeneratedColumn<String> machineId = GeneratedColumn<String>(
    'machineId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<String> jobId = GeneratedColumn<String>(
    'jobId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tagId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagNameMeta = const VerificationMeta(
    'tagName',
  );
  @override
  late final GeneratedColumn<String> tagName = GeneratedColumn<String>(
    'tagName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagTypeMeta = const VerificationMeta(
    'tagType',
  );
  @override
  late final GeneratedColumn<String> tagType = GeneratedColumn<String>(
    'tagType',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagGroupIdMeta = const VerificationMeta(
    'tagGroupId',
  );
  @override
  late final GeneratedColumn<String> tagGroupId = GeneratedColumn<String>(
    'TagGroupId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagGroupNameMeta = const VerificationMeta(
    'tagGroupName',
  );
  @override
  late final GeneratedColumn<String> tagGroupName = GeneratedColumn<String>(
    'TagGroupName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagSelectionValueMeta = const VerificationMeta(
    'tagSelectionValue',
  );
  @override
  late final GeneratedColumn<String> tagSelectionValue =
      GeneratedColumn<String>(
        'tagSelectionValue',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'Note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specificationMeta = const VerificationMeta(
    'specification',
  );
  @override
  late final GeneratedColumn<String> specification = GeneratedColumn<String>(
    'specification',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specMinMeta = const VerificationMeta(
    'specMin',
  );
  @override
  late final GeneratedColumn<String> specMin = GeneratedColumn<String>(
    'specMin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specMaxMeta = const VerificationMeta(
    'specMax',
  );
  @override
  late final GeneratedColumn<String> specMax = GeneratedColumn<String>(
    'specMax',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _queryStrMeta = const VerificationMeta(
    'queryStr',
  );
  @override
  late final GeneratedColumn<String> queryStr = GeneratedColumn<String>(
    'queryStr',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueTypeMeta = const VerificationMeta(
    'valueType',
  );
  @override
  late final GeneratedColumn<String> valueType = GeneratedColumn<String>(
    'valueType',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _unReadableMeta = const VerificationMeta(
    'unReadable',
  );
  @override
  late final GeneratedColumn<String> unReadable = GeneratedColumn<String>(
    'unReadable',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('false'),
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createByMeta = const VerificationMeta(
    'createBy',
  );
  @override
  late final GeneratedColumn<String> createBy = GeneratedColumn<String>(
    'CreateBy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'syncStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    documentId,
    machineId,
    jobId,
    tagId,
    tagName,
    tagType,
    tagGroupId,
    tagGroupName,
    tagSelectionValue,
    description,
    note,
    specification,
    specMin,
    specMax,
    unit,
    queryStr,
    value,
    valueType,
    remark,
    status,
    unReadable,
    lastSync,
    createBy,
    syncStatus,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbDocumentRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('documentId')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['documentId']!, _documentIdMeta),
      );
    }
    if (data.containsKey('machineId')) {
      context.handle(
        _machineIdMeta,
        machineId.isAcceptableOrUnknown(data['machineId']!, _machineIdMeta),
      );
    }
    if (data.containsKey('jobId')) {
      context.handle(
        _jobIdMeta,
        jobId.isAcceptableOrUnknown(data['jobId']!, _jobIdMeta),
      );
    }
    if (data.containsKey('tagId')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tagId']!, _tagIdMeta),
      );
    }
    if (data.containsKey('tagName')) {
      context.handle(
        _tagNameMeta,
        tagName.isAcceptableOrUnknown(data['tagName']!, _tagNameMeta),
      );
    }
    if (data.containsKey('tagType')) {
      context.handle(
        _tagTypeMeta,
        tagType.isAcceptableOrUnknown(data['tagType']!, _tagTypeMeta),
      );
    }
    if (data.containsKey('TagGroupId')) {
      context.handle(
        _tagGroupIdMeta,
        tagGroupId.isAcceptableOrUnknown(data['TagGroupId']!, _tagGroupIdMeta),
      );
    }
    if (data.containsKey('TagGroupName')) {
      context.handle(
        _tagGroupNameMeta,
        tagGroupName.isAcceptableOrUnknown(
          data['TagGroupName']!,
          _tagGroupNameMeta,
        ),
      );
    }
    if (data.containsKey('tagSelectionValue')) {
      context.handle(
        _tagSelectionValueMeta,
        tagSelectionValue.isAcceptableOrUnknown(
          data['tagSelectionValue']!,
          _tagSelectionValueMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('Note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['Note']!, _noteMeta),
      );
    }
    if (data.containsKey('specification')) {
      context.handle(
        _specificationMeta,
        specification.isAcceptableOrUnknown(
          data['specification']!,
          _specificationMeta,
        ),
      );
    }
    if (data.containsKey('specMin')) {
      context.handle(
        _specMinMeta,
        specMin.isAcceptableOrUnknown(data['specMin']!, _specMinMeta),
      );
    }
    if (data.containsKey('specMax')) {
      context.handle(
        _specMaxMeta,
        specMax.isAcceptableOrUnknown(data['specMax']!, _specMaxMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('queryStr')) {
      context.handle(
        _queryStrMeta,
        queryStr.isAcceptableOrUnknown(data['queryStr']!, _queryStrMeta),
      );
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    if (data.containsKey('valueType')) {
      context.handle(
        _valueTypeMeta,
        valueType.isAcceptableOrUnknown(data['valueType']!, _valueTypeMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('unReadable')) {
      context.handle(
        _unReadableMeta,
        unReadable.isAcceptableOrUnknown(data['unReadable']!, _unReadableMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('CreateBy')) {
      context.handle(
        _createByMeta,
        createBy.isAcceptableOrUnknown(data['CreateBy']!, _createByMeta),
      );
    }
    if (data.containsKey('syncStatus')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['syncStatus']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbDocumentRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbDocumentRecord(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentId'],
      ),
      machineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}machineId'],
      ),
      jobId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jobId'],
      ),
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagId'],
      ),
      tagName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagName'],
      ),
      tagType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagType'],
      ),
      tagGroupId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}TagGroupId'],
      ),
      tagGroupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}TagGroupName'],
      ),
      tagSelectionValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagSelectionValue'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Note'],
      ),
      specification: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specification'],
      ),
      specMin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specMin'],
      ),
      specMax: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specMax'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      ),
      queryStr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}queryStr'],
      ),
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      ),
      valueType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}valueType'],
      ),
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      unReadable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unReadable'],
      )!,
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      createBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CreateBy'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}syncStatus'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
    );
  }

  @override
  $DocumentRecordsTable createAlias(String alias) {
    return $DocumentRecordsTable(attachedDatabase, alias);
  }
}

class DbDocumentRecord extends DataClass
    implements Insertable<DbDocumentRecord> {
  final int uid;
  final String? documentId;
  final String? machineId;
  final String? jobId;
  final String? tagId;
  final String? tagName;
  final String? tagType;
  final String? tagGroupId;
  final String? tagGroupName;
  final String? tagSelectionValue;
  final String? description;
  final String? note;
  final String? specification;
  final String? specMin;
  final String? specMax;
  final String? unit;
  final String? queryStr;
  final String? value;
  final String? valueType;
  final String? remark;
  final int status;
  final String unReadable;
  final String? lastSync;
  final String? createBy;
  final int syncStatus;
  final String? updatedAt;
  const DbDocumentRecord({
    required this.uid,
    this.documentId,
    this.machineId,
    this.jobId,
    this.tagId,
    this.tagName,
    this.tagType,
    this.tagGroupId,
    this.tagGroupName,
    this.tagSelectionValue,
    this.description,
    this.note,
    this.specification,
    this.specMin,
    this.specMax,
    this.unit,
    this.queryStr,
    this.value,
    this.valueType,
    this.remark,
    required this.status,
    required this.unReadable,
    this.lastSync,
    this.createBy,
    required this.syncStatus,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || documentId != null) {
      map['documentId'] = Variable<String>(documentId);
    }
    if (!nullToAbsent || machineId != null) {
      map['machineId'] = Variable<String>(machineId);
    }
    if (!nullToAbsent || jobId != null) {
      map['jobId'] = Variable<String>(jobId);
    }
    if (!nullToAbsent || tagId != null) {
      map['tagId'] = Variable<String>(tagId);
    }
    if (!nullToAbsent || tagName != null) {
      map['tagName'] = Variable<String>(tagName);
    }
    if (!nullToAbsent || tagType != null) {
      map['tagType'] = Variable<String>(tagType);
    }
    if (!nullToAbsent || tagGroupId != null) {
      map['TagGroupId'] = Variable<String>(tagGroupId);
    }
    if (!nullToAbsent || tagGroupName != null) {
      map['TagGroupName'] = Variable<String>(tagGroupName);
    }
    if (!nullToAbsent || tagSelectionValue != null) {
      map['tagSelectionValue'] = Variable<String>(tagSelectionValue);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || note != null) {
      map['Note'] = Variable<String>(note);
    }
    if (!nullToAbsent || specification != null) {
      map['specification'] = Variable<String>(specification);
    }
    if (!nullToAbsent || specMin != null) {
      map['specMin'] = Variable<String>(specMin);
    }
    if (!nullToAbsent || specMax != null) {
      map['specMax'] = Variable<String>(specMax);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || queryStr != null) {
      map['queryStr'] = Variable<String>(queryStr);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || valueType != null) {
      map['valueType'] = Variable<String>(valueType);
    }
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['status'] = Variable<int>(status);
    map['unReadable'] = Variable<String>(unReadable);
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    if (!nullToAbsent || createBy != null) {
      map['CreateBy'] = Variable<String>(createBy);
    }
    map['syncStatus'] = Variable<int>(syncStatus);
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    return map;
  }

  DocumentRecordsCompanion toCompanion(bool nullToAbsent) {
    return DocumentRecordsCompanion(
      uid: Value(uid),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      machineId: machineId == null && nullToAbsent
          ? const Value.absent()
          : Value(machineId),
      jobId: jobId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobId),
      tagId: tagId == null && nullToAbsent
          ? const Value.absent()
          : Value(tagId),
      tagName: tagName == null && nullToAbsent
          ? const Value.absent()
          : Value(tagName),
      tagType: tagType == null && nullToAbsent
          ? const Value.absent()
          : Value(tagType),
      tagGroupId: tagGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(tagGroupId),
      tagGroupName: tagGroupName == null && nullToAbsent
          ? const Value.absent()
          : Value(tagGroupName),
      tagSelectionValue: tagSelectionValue == null && nullToAbsent
          ? const Value.absent()
          : Value(tagSelectionValue),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      specification: specification == null && nullToAbsent
          ? const Value.absent()
          : Value(specification),
      specMin: specMin == null && nullToAbsent
          ? const Value.absent()
          : Value(specMin),
      specMax: specMax == null && nullToAbsent
          ? const Value.absent()
          : Value(specMax),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      queryStr: queryStr == null && nullToAbsent
          ? const Value.absent()
          : Value(queryStr),
      value: value == null && nullToAbsent
          ? const Value.absent()
          : Value(value),
      valueType: valueType == null && nullToAbsent
          ? const Value.absent()
          : Value(valueType),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      status: Value(status),
      unReadable: Value(unReadable),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      createBy: createBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createBy),
      syncStatus: Value(syncStatus),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbDocumentRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbDocumentRecord(
      uid: serializer.fromJson<int>(json['uid']),
      documentId: serializer.fromJson<String?>(json['documentId']),
      machineId: serializer.fromJson<String?>(json['machineId']),
      jobId: serializer.fromJson<String?>(json['jobId']),
      tagId: serializer.fromJson<String?>(json['tagId']),
      tagName: serializer.fromJson<String?>(json['tagName']),
      tagType: serializer.fromJson<String?>(json['tagType']),
      tagGroupId: serializer.fromJson<String?>(json['tagGroupId']),
      tagGroupName: serializer.fromJson<String?>(json['tagGroupName']),
      tagSelectionValue: serializer.fromJson<String?>(
        json['tagSelectionValue'],
      ),
      description: serializer.fromJson<String?>(json['description']),
      note: serializer.fromJson<String?>(json['note']),
      specification: serializer.fromJson<String?>(json['specification']),
      specMin: serializer.fromJson<String?>(json['specMin']),
      specMax: serializer.fromJson<String?>(json['specMax']),
      unit: serializer.fromJson<String?>(json['unit']),
      queryStr: serializer.fromJson<String?>(json['queryStr']),
      value: serializer.fromJson<String?>(json['value']),
      valueType: serializer.fromJson<String?>(json['valueType']),
      remark: serializer.fromJson<String?>(json['remark']),
      status: serializer.fromJson<int>(json['status']),
      unReadable: serializer.fromJson<String>(json['unReadable']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      createBy: serializer.fromJson<String?>(json['createBy']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'documentId': serializer.toJson<String?>(documentId),
      'machineId': serializer.toJson<String?>(machineId),
      'jobId': serializer.toJson<String?>(jobId),
      'tagId': serializer.toJson<String?>(tagId),
      'tagName': serializer.toJson<String?>(tagName),
      'tagType': serializer.toJson<String?>(tagType),
      'tagGroupId': serializer.toJson<String?>(tagGroupId),
      'tagGroupName': serializer.toJson<String?>(tagGroupName),
      'tagSelectionValue': serializer.toJson<String?>(tagSelectionValue),
      'description': serializer.toJson<String?>(description),
      'note': serializer.toJson<String?>(note),
      'specification': serializer.toJson<String?>(specification),
      'specMin': serializer.toJson<String?>(specMin),
      'specMax': serializer.toJson<String?>(specMax),
      'unit': serializer.toJson<String?>(unit),
      'queryStr': serializer.toJson<String?>(queryStr),
      'value': serializer.toJson<String?>(value),
      'valueType': serializer.toJson<String?>(valueType),
      'remark': serializer.toJson<String?>(remark),
      'status': serializer.toJson<int>(status),
      'unReadable': serializer.toJson<String>(unReadable),
      'lastSync': serializer.toJson<String?>(lastSync),
      'createBy': serializer.toJson<String?>(createBy),
      'syncStatus': serializer.toJson<int>(syncStatus),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  DbDocumentRecord copyWith({
    int? uid,
    Value<String?> documentId = const Value.absent(),
    Value<String?> machineId = const Value.absent(),
    Value<String?> jobId = const Value.absent(),
    Value<String?> tagId = const Value.absent(),
    Value<String?> tagName = const Value.absent(),
    Value<String?> tagType = const Value.absent(),
    Value<String?> tagGroupId = const Value.absent(),
    Value<String?> tagGroupName = const Value.absent(),
    Value<String?> tagSelectionValue = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<String?> specification = const Value.absent(),
    Value<String?> specMin = const Value.absent(),
    Value<String?> specMax = const Value.absent(),
    Value<String?> unit = const Value.absent(),
    Value<String?> queryStr = const Value.absent(),
    Value<String?> value = const Value.absent(),
    Value<String?> valueType = const Value.absent(),
    Value<String?> remark = const Value.absent(),
    int? status,
    String? unReadable,
    Value<String?> lastSync = const Value.absent(),
    Value<String?> createBy = const Value.absent(),
    int? syncStatus,
    Value<String?> updatedAt = const Value.absent(),
  }) => DbDocumentRecord(
    uid: uid ?? this.uid,
    documentId: documentId.present ? documentId.value : this.documentId,
    machineId: machineId.present ? machineId.value : this.machineId,
    jobId: jobId.present ? jobId.value : this.jobId,
    tagId: tagId.present ? tagId.value : this.tagId,
    tagName: tagName.present ? tagName.value : this.tagName,
    tagType: tagType.present ? tagType.value : this.tagType,
    tagGroupId: tagGroupId.present ? tagGroupId.value : this.tagGroupId,
    tagGroupName: tagGroupName.present ? tagGroupName.value : this.tagGroupName,
    tagSelectionValue: tagSelectionValue.present
        ? tagSelectionValue.value
        : this.tagSelectionValue,
    description: description.present ? description.value : this.description,
    note: note.present ? note.value : this.note,
    specification: specification.present
        ? specification.value
        : this.specification,
    specMin: specMin.present ? specMin.value : this.specMin,
    specMax: specMax.present ? specMax.value : this.specMax,
    unit: unit.present ? unit.value : this.unit,
    queryStr: queryStr.present ? queryStr.value : this.queryStr,
    value: value.present ? value.value : this.value,
    valueType: valueType.present ? valueType.value : this.valueType,
    remark: remark.present ? remark.value : this.remark,
    status: status ?? this.status,
    unReadable: unReadable ?? this.unReadable,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    createBy: createBy.present ? createBy.value : this.createBy,
    syncStatus: syncStatus ?? this.syncStatus,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbDocumentRecord copyWithCompanion(DocumentRecordsCompanion data) {
    return DbDocumentRecord(
      uid: data.uid.present ? data.uid.value : this.uid,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      machineId: data.machineId.present ? data.machineId.value : this.machineId,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
      tagType: data.tagType.present ? data.tagType.value : this.tagType,
      tagGroupId: data.tagGroupId.present
          ? data.tagGroupId.value
          : this.tagGroupId,
      tagGroupName: data.tagGroupName.present
          ? data.tagGroupName.value
          : this.tagGroupName,
      tagSelectionValue: data.tagSelectionValue.present
          ? data.tagSelectionValue.value
          : this.tagSelectionValue,
      description: data.description.present
          ? data.description.value
          : this.description,
      note: data.note.present ? data.note.value : this.note,
      specification: data.specification.present
          ? data.specification.value
          : this.specification,
      specMin: data.specMin.present ? data.specMin.value : this.specMin,
      specMax: data.specMax.present ? data.specMax.value : this.specMax,
      unit: data.unit.present ? data.unit.value : this.unit,
      queryStr: data.queryStr.present ? data.queryStr.value : this.queryStr,
      value: data.value.present ? data.value.value : this.value,
      valueType: data.valueType.present ? data.valueType.value : this.valueType,
      remark: data.remark.present ? data.remark.value : this.remark,
      status: data.status.present ? data.status.value : this.status,
      unReadable: data.unReadable.present
          ? data.unReadable.value
          : this.unReadable,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      createBy: data.createBy.present ? data.createBy.value : this.createBy,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbDocumentRecord(')
          ..write('uid: $uid, ')
          ..write('documentId: $documentId, ')
          ..write('machineId: $machineId, ')
          ..write('jobId: $jobId, ')
          ..write('tagId: $tagId, ')
          ..write('tagName: $tagName, ')
          ..write('tagType: $tagType, ')
          ..write('tagGroupId: $tagGroupId, ')
          ..write('tagGroupName: $tagGroupName, ')
          ..write('tagSelectionValue: $tagSelectionValue, ')
          ..write('description: $description, ')
          ..write('note: $note, ')
          ..write('specification: $specification, ')
          ..write('specMin: $specMin, ')
          ..write('specMax: $specMax, ')
          ..write('unit: $unit, ')
          ..write('queryStr: $queryStr, ')
          ..write('value: $value, ')
          ..write('valueType: $valueType, ')
          ..write('remark: $remark, ')
          ..write('status: $status, ')
          ..write('unReadable: $unReadable, ')
          ..write('lastSync: $lastSync, ')
          ..write('createBy: $createBy, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    uid,
    documentId,
    machineId,
    jobId,
    tagId,
    tagName,
    tagType,
    tagGroupId,
    tagGroupName,
    tagSelectionValue,
    description,
    note,
    specification,
    specMin,
    specMax,
    unit,
    queryStr,
    value,
    valueType,
    remark,
    status,
    unReadable,
    lastSync,
    createBy,
    syncStatus,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbDocumentRecord &&
          other.uid == this.uid &&
          other.documentId == this.documentId &&
          other.machineId == this.machineId &&
          other.jobId == this.jobId &&
          other.tagId == this.tagId &&
          other.tagName == this.tagName &&
          other.tagType == this.tagType &&
          other.tagGroupId == this.tagGroupId &&
          other.tagGroupName == this.tagGroupName &&
          other.tagSelectionValue == this.tagSelectionValue &&
          other.description == this.description &&
          other.note == this.note &&
          other.specification == this.specification &&
          other.specMin == this.specMin &&
          other.specMax == this.specMax &&
          other.unit == this.unit &&
          other.queryStr == this.queryStr &&
          other.value == this.value &&
          other.valueType == this.valueType &&
          other.remark == this.remark &&
          other.status == this.status &&
          other.unReadable == this.unReadable &&
          other.lastSync == this.lastSync &&
          other.createBy == this.createBy &&
          other.syncStatus == this.syncStatus &&
          other.updatedAt == this.updatedAt);
}

class DocumentRecordsCompanion extends UpdateCompanion<DbDocumentRecord> {
  final Value<int> uid;
  final Value<String?> documentId;
  final Value<String?> machineId;
  final Value<String?> jobId;
  final Value<String?> tagId;
  final Value<String?> tagName;
  final Value<String?> tagType;
  final Value<String?> tagGroupId;
  final Value<String?> tagGroupName;
  final Value<String?> tagSelectionValue;
  final Value<String?> description;
  final Value<String?> note;
  final Value<String?> specification;
  final Value<String?> specMin;
  final Value<String?> specMax;
  final Value<String?> unit;
  final Value<String?> queryStr;
  final Value<String?> value;
  final Value<String?> valueType;
  final Value<String?> remark;
  final Value<int> status;
  final Value<String> unReadable;
  final Value<String?> lastSync;
  final Value<String?> createBy;
  final Value<int> syncStatus;
  final Value<String?> updatedAt;
  const DocumentRecordsCompanion({
    this.uid = const Value.absent(),
    this.documentId = const Value.absent(),
    this.machineId = const Value.absent(),
    this.jobId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.tagType = const Value.absent(),
    this.tagGroupId = const Value.absent(),
    this.tagGroupName = const Value.absent(),
    this.tagSelectionValue = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
    this.specification = const Value.absent(),
    this.specMin = const Value.absent(),
    this.specMax = const Value.absent(),
    this.unit = const Value.absent(),
    this.queryStr = const Value.absent(),
    this.value = const Value.absent(),
    this.valueType = const Value.absent(),
    this.remark = const Value.absent(),
    this.status = const Value.absent(),
    this.unReadable = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.createBy = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DocumentRecordsCompanion.insert({
    this.uid = const Value.absent(),
    this.documentId = const Value.absent(),
    this.machineId = const Value.absent(),
    this.jobId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.tagType = const Value.absent(),
    this.tagGroupId = const Value.absent(),
    this.tagGroupName = const Value.absent(),
    this.tagSelectionValue = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
    this.specification = const Value.absent(),
    this.specMin = const Value.absent(),
    this.specMax = const Value.absent(),
    this.unit = const Value.absent(),
    this.queryStr = const Value.absent(),
    this.value = const Value.absent(),
    this.valueType = const Value.absent(),
    this.remark = const Value.absent(),
    this.status = const Value.absent(),
    this.unReadable = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.createBy = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<DbDocumentRecord> custom({
    Expression<int>? uid,
    Expression<String>? documentId,
    Expression<String>? machineId,
    Expression<String>? jobId,
    Expression<String>? tagId,
    Expression<String>? tagName,
    Expression<String>? tagType,
    Expression<String>? tagGroupId,
    Expression<String>? tagGroupName,
    Expression<String>? tagSelectionValue,
    Expression<String>? description,
    Expression<String>? note,
    Expression<String>? specification,
    Expression<String>? specMin,
    Expression<String>? specMax,
    Expression<String>? unit,
    Expression<String>? queryStr,
    Expression<String>? value,
    Expression<String>? valueType,
    Expression<String>? remark,
    Expression<int>? status,
    Expression<String>? unReadable,
    Expression<String>? lastSync,
    Expression<String>? createBy,
    Expression<int>? syncStatus,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (documentId != null) 'documentId': documentId,
      if (machineId != null) 'machineId': machineId,
      if (jobId != null) 'jobId': jobId,
      if (tagId != null) 'tagId': tagId,
      if (tagName != null) 'tagName': tagName,
      if (tagType != null) 'tagType': tagType,
      if (tagGroupId != null) 'TagGroupId': tagGroupId,
      if (tagGroupName != null) 'TagGroupName': tagGroupName,
      if (tagSelectionValue != null) 'tagSelectionValue': tagSelectionValue,
      if (description != null) 'description': description,
      if (note != null) 'Note': note,
      if (specification != null) 'specification': specification,
      if (specMin != null) 'specMin': specMin,
      if (specMax != null) 'specMax': specMax,
      if (unit != null) 'unit': unit,
      if (queryStr != null) 'queryStr': queryStr,
      if (value != null) 'value': value,
      if (valueType != null) 'valueType': valueType,
      if (remark != null) 'remark': remark,
      if (status != null) 'status': status,
      if (unReadable != null) 'unReadable': unReadable,
      if (lastSync != null) 'lastSync': lastSync,
      if (createBy != null) 'CreateBy': createBy,
      if (syncStatus != null) 'syncStatus': syncStatus,
      if (updatedAt != null) 'updatedAt': updatedAt,
    });
  }

  DocumentRecordsCompanion copyWith({
    Value<int>? uid,
    Value<String?>? documentId,
    Value<String?>? machineId,
    Value<String?>? jobId,
    Value<String?>? tagId,
    Value<String?>? tagName,
    Value<String?>? tagType,
    Value<String?>? tagGroupId,
    Value<String?>? tagGroupName,
    Value<String?>? tagSelectionValue,
    Value<String?>? description,
    Value<String?>? note,
    Value<String?>? specification,
    Value<String?>? specMin,
    Value<String?>? specMax,
    Value<String?>? unit,
    Value<String?>? queryStr,
    Value<String?>? value,
    Value<String?>? valueType,
    Value<String?>? remark,
    Value<int>? status,
    Value<String>? unReadable,
    Value<String?>? lastSync,
    Value<String?>? createBy,
    Value<int>? syncStatus,
    Value<String?>? updatedAt,
  }) {
    return DocumentRecordsCompanion(
      uid: uid ?? this.uid,
      documentId: documentId ?? this.documentId,
      machineId: machineId ?? this.machineId,
      jobId: jobId ?? this.jobId,
      tagId: tagId ?? this.tagId,
      tagName: tagName ?? this.tagName,
      tagType: tagType ?? this.tagType,
      tagGroupId: tagGroupId ?? this.tagGroupId,
      tagGroupName: tagGroupName ?? this.tagGroupName,
      tagSelectionValue: tagSelectionValue ?? this.tagSelectionValue,
      description: description ?? this.description,
      note: note ?? this.note,
      specification: specification ?? this.specification,
      specMin: specMin ?? this.specMin,
      specMax: specMax ?? this.specMax,
      unit: unit ?? this.unit,
      queryStr: queryStr ?? this.queryStr,
      value: value ?? this.value,
      valueType: valueType ?? this.valueType,
      remark: remark ?? this.remark,
      status: status ?? this.status,
      unReadable: unReadable ?? this.unReadable,
      lastSync: lastSync ?? this.lastSync,
      createBy: createBy ?? this.createBy,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (documentId.present) {
      map['documentId'] = Variable<String>(documentId.value);
    }
    if (machineId.present) {
      map['machineId'] = Variable<String>(machineId.value);
    }
    if (jobId.present) {
      map['jobId'] = Variable<String>(jobId.value);
    }
    if (tagId.present) {
      map['tagId'] = Variable<String>(tagId.value);
    }
    if (tagName.present) {
      map['tagName'] = Variable<String>(tagName.value);
    }
    if (tagType.present) {
      map['tagType'] = Variable<String>(tagType.value);
    }
    if (tagGroupId.present) {
      map['TagGroupId'] = Variable<String>(tagGroupId.value);
    }
    if (tagGroupName.present) {
      map['TagGroupName'] = Variable<String>(tagGroupName.value);
    }
    if (tagSelectionValue.present) {
      map['tagSelectionValue'] = Variable<String>(tagSelectionValue.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (note.present) {
      map['Note'] = Variable<String>(note.value);
    }
    if (specification.present) {
      map['specification'] = Variable<String>(specification.value);
    }
    if (specMin.present) {
      map['specMin'] = Variable<String>(specMin.value);
    }
    if (specMax.present) {
      map['specMax'] = Variable<String>(specMax.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (queryStr.present) {
      map['queryStr'] = Variable<String>(queryStr.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (valueType.present) {
      map['valueType'] = Variable<String>(valueType.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (unReadable.present) {
      map['unReadable'] = Variable<String>(unReadable.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (createBy.present) {
      map['CreateBy'] = Variable<String>(createBy.value);
    }
    if (syncStatus.present) {
      map['syncStatus'] = Variable<int>(syncStatus.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentRecordsCompanion(')
          ..write('uid: $uid, ')
          ..write('documentId: $documentId, ')
          ..write('machineId: $machineId, ')
          ..write('jobId: $jobId, ')
          ..write('tagId: $tagId, ')
          ..write('tagName: $tagName, ')
          ..write('tagType: $tagType, ')
          ..write('tagGroupId: $tagGroupId, ')
          ..write('tagGroupName: $tagGroupName, ')
          ..write('tagSelectionValue: $tagSelectionValue, ')
          ..write('description: $description, ')
          ..write('note: $note, ')
          ..write('specification: $specification, ')
          ..write('specMin: $specMin, ')
          ..write('specMax: $specMax, ')
          ..write('unit: $unit, ')
          ..write('queryStr: $queryStr, ')
          ..write('value: $value, ')
          ..write('valueType: $valueType, ')
          ..write('remark: $remark, ')
          ..write('status: $status, ')
          ..write('unReadable: $unReadable, ')
          ..write('lastSync: $lastSync, ')
          ..write('createBy: $createBy, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $JobMachinesTable extends JobMachines
    with TableInfo<$JobMachinesTable, DbJobMachine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobMachinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<String> jobId = GeneratedColumn<String>(
    'JobId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineIdMeta = const VerificationMeta(
    'machineId',
  );
  @override
  late final GeneratedColumn<String> machineId = GeneratedColumn<String>(
    'MachineId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineNameMeta = const VerificationMeta(
    'machineName',
  );
  @override
  late final GeneratedColumn<String> machineName = GeneratedColumn<String>(
    'MachineName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineTypeMeta = const VerificationMeta(
    'machineType',
  );
  @override
  late final GeneratedColumn<String> machineType = GeneratedColumn<String>(
    'MachineType',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'Description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specificationMeta = const VerificationMeta(
    'specification',
  );
  @override
  late final GeneratedColumn<String> specification = GeneratedColumn<String>(
    'Specification',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'Status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    jobId,
    machineId,
    machineName,
    machineType,
    description,
    specification,
    status,
    lastSync,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_machines';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbJobMachine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('JobId')) {
      context.handle(
        _jobIdMeta,
        jobId.isAcceptableOrUnknown(data['JobId']!, _jobIdMeta),
      );
    }
    if (data.containsKey('MachineId')) {
      context.handle(
        _machineIdMeta,
        machineId.isAcceptableOrUnknown(data['MachineId']!, _machineIdMeta),
      );
    }
    if (data.containsKey('MachineName')) {
      context.handle(
        _machineNameMeta,
        machineName.isAcceptableOrUnknown(
          data['MachineName']!,
          _machineNameMeta,
        ),
      );
    }
    if (data.containsKey('MachineType')) {
      context.handle(
        _machineTypeMeta,
        machineType.isAcceptableOrUnknown(
          data['MachineType']!,
          _machineTypeMeta,
        ),
      );
    }
    if (data.containsKey('Description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['Description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('Specification')) {
      context.handle(
        _specificationMeta,
        specification.isAcceptableOrUnknown(
          data['Specification']!,
          _specificationMeta,
        ),
      );
    }
    if (data.containsKey('Status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['Status']!, _statusMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbJobMachine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbJobMachine(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      jobId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}JobId'],
      ),
      machineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineId'],
      ),
      machineName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineName'],
      ),
      machineType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineType'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Description'],
      ),
      specification: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Specification'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}Status'],
      )!,
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
    );
  }

  @override
  $JobMachinesTable createAlias(String alias) {
    return $JobMachinesTable(attachedDatabase, alias);
  }
}

class DbJobMachine extends DataClass implements Insertable<DbJobMachine> {
  final int uid;
  final String? jobId;
  final String? machineId;
  final String? machineName;
  final String? machineType;
  final String? description;
  final String? specification;
  final int status;
  final String? lastSync;
  final String? updatedAt;
  const DbJobMachine({
    required this.uid,
    this.jobId,
    this.machineId,
    this.machineName,
    this.machineType,
    this.description,
    this.specification,
    required this.status,
    this.lastSync,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || jobId != null) {
      map['JobId'] = Variable<String>(jobId);
    }
    if (!nullToAbsent || machineId != null) {
      map['MachineId'] = Variable<String>(machineId);
    }
    if (!nullToAbsent || machineName != null) {
      map['MachineName'] = Variable<String>(machineName);
    }
    if (!nullToAbsent || machineType != null) {
      map['MachineType'] = Variable<String>(machineType);
    }
    if (!nullToAbsent || description != null) {
      map['Description'] = Variable<String>(description);
    }
    if (!nullToAbsent || specification != null) {
      map['Specification'] = Variable<String>(specification);
    }
    map['Status'] = Variable<int>(status);
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    return map;
  }

  JobMachinesCompanion toCompanion(bool nullToAbsent) {
    return JobMachinesCompanion(
      uid: Value(uid),
      jobId: jobId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobId),
      machineId: machineId == null && nullToAbsent
          ? const Value.absent()
          : Value(machineId),
      machineName: machineName == null && nullToAbsent
          ? const Value.absent()
          : Value(machineName),
      machineType: machineType == null && nullToAbsent
          ? const Value.absent()
          : Value(machineType),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      specification: specification == null && nullToAbsent
          ? const Value.absent()
          : Value(specification),
      status: Value(status),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbJobMachine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbJobMachine(
      uid: serializer.fromJson<int>(json['uid']),
      jobId: serializer.fromJson<String?>(json['jobId']),
      machineId: serializer.fromJson<String?>(json['machineId']),
      machineName: serializer.fromJson<String?>(json['machineName']),
      machineType: serializer.fromJson<String?>(json['machineType']),
      description: serializer.fromJson<String?>(json['description']),
      specification: serializer.fromJson<String?>(json['specification']),
      status: serializer.fromJson<int>(json['status']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'jobId': serializer.toJson<String?>(jobId),
      'machineId': serializer.toJson<String?>(machineId),
      'machineName': serializer.toJson<String?>(machineName),
      'machineType': serializer.toJson<String?>(machineType),
      'description': serializer.toJson<String?>(description),
      'specification': serializer.toJson<String?>(specification),
      'status': serializer.toJson<int>(status),
      'lastSync': serializer.toJson<String?>(lastSync),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  DbJobMachine copyWith({
    int? uid,
    Value<String?> jobId = const Value.absent(),
    Value<String?> machineId = const Value.absent(),
    Value<String?> machineName = const Value.absent(),
    Value<String?> machineType = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> specification = const Value.absent(),
    int? status,
    Value<String?> lastSync = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
  }) => DbJobMachine(
    uid: uid ?? this.uid,
    jobId: jobId.present ? jobId.value : this.jobId,
    machineId: machineId.present ? machineId.value : this.machineId,
    machineName: machineName.present ? machineName.value : this.machineName,
    machineType: machineType.present ? machineType.value : this.machineType,
    description: description.present ? description.value : this.description,
    specification: specification.present
        ? specification.value
        : this.specification,
    status: status ?? this.status,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbJobMachine copyWithCompanion(JobMachinesCompanion data) {
    return DbJobMachine(
      uid: data.uid.present ? data.uid.value : this.uid,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      machineId: data.machineId.present ? data.machineId.value : this.machineId,
      machineName: data.machineName.present
          ? data.machineName.value
          : this.machineName,
      machineType: data.machineType.present
          ? data.machineType.value
          : this.machineType,
      description: data.description.present
          ? data.description.value
          : this.description,
      specification: data.specification.present
          ? data.specification.value
          : this.specification,
      status: data.status.present ? data.status.value : this.status,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbJobMachine(')
          ..write('uid: $uid, ')
          ..write('jobId: $jobId, ')
          ..write('machineId: $machineId, ')
          ..write('machineName: $machineName, ')
          ..write('machineType: $machineType, ')
          ..write('description: $description, ')
          ..write('specification: $specification, ')
          ..write('status: $status, ')
          ..write('lastSync: $lastSync, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    jobId,
    machineId,
    machineName,
    machineType,
    description,
    specification,
    status,
    lastSync,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbJobMachine &&
          other.uid == this.uid &&
          other.jobId == this.jobId &&
          other.machineId == this.machineId &&
          other.machineName == this.machineName &&
          other.machineType == this.machineType &&
          other.description == this.description &&
          other.specification == this.specification &&
          other.status == this.status &&
          other.lastSync == this.lastSync &&
          other.updatedAt == this.updatedAt);
}

class JobMachinesCompanion extends UpdateCompanion<DbJobMachine> {
  final Value<int> uid;
  final Value<String?> jobId;
  final Value<String?> machineId;
  final Value<String?> machineName;
  final Value<String?> machineType;
  final Value<String?> description;
  final Value<String?> specification;
  final Value<int> status;
  final Value<String?> lastSync;
  final Value<String?> updatedAt;
  const JobMachinesCompanion({
    this.uid = const Value.absent(),
    this.jobId = const Value.absent(),
    this.machineId = const Value.absent(),
    this.machineName = const Value.absent(),
    this.machineType = const Value.absent(),
    this.description = const Value.absent(),
    this.specification = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  JobMachinesCompanion.insert({
    this.uid = const Value.absent(),
    this.jobId = const Value.absent(),
    this.machineId = const Value.absent(),
    this.machineName = const Value.absent(),
    this.machineType = const Value.absent(),
    this.description = const Value.absent(),
    this.specification = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<DbJobMachine> custom({
    Expression<int>? uid,
    Expression<String>? jobId,
    Expression<String>? machineId,
    Expression<String>? machineName,
    Expression<String>? machineType,
    Expression<String>? description,
    Expression<String>? specification,
    Expression<int>? status,
    Expression<String>? lastSync,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (jobId != null) 'JobId': jobId,
      if (machineId != null) 'MachineId': machineId,
      if (machineName != null) 'MachineName': machineName,
      if (machineType != null) 'MachineType': machineType,
      if (description != null) 'Description': description,
      if (specification != null) 'Specification': specification,
      if (status != null) 'Status': status,
      if (lastSync != null) 'lastSync': lastSync,
      if (updatedAt != null) 'updatedAt': updatedAt,
    });
  }

  JobMachinesCompanion copyWith({
    Value<int>? uid,
    Value<String?>? jobId,
    Value<String?>? machineId,
    Value<String?>? machineName,
    Value<String?>? machineType,
    Value<String?>? description,
    Value<String?>? specification,
    Value<int>? status,
    Value<String?>? lastSync,
    Value<String?>? updatedAt,
  }) {
    return JobMachinesCompanion(
      uid: uid ?? this.uid,
      jobId: jobId ?? this.jobId,
      machineId: machineId ?? this.machineId,
      machineName: machineName ?? this.machineName,
      machineType: machineType ?? this.machineType,
      description: description ?? this.description,
      specification: specification ?? this.specification,
      status: status ?? this.status,
      lastSync: lastSync ?? this.lastSync,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (jobId.present) {
      map['JobId'] = Variable<String>(jobId.value);
    }
    if (machineId.present) {
      map['MachineId'] = Variable<String>(machineId.value);
    }
    if (machineName.present) {
      map['MachineName'] = Variable<String>(machineName.value);
    }
    if (machineType.present) {
      map['MachineType'] = Variable<String>(machineType.value);
    }
    if (description.present) {
      map['Description'] = Variable<String>(description.value);
    }
    if (specification.present) {
      map['Specification'] = Variable<String>(specification.value);
    }
    if (status.present) {
      map['Status'] = Variable<int>(status.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobMachinesCompanion(')
          ..write('uid: $uid, ')
          ..write('jobId: $jobId, ')
          ..write('machineId: $machineId, ')
          ..write('machineName: $machineName, ')
          ..write('machineType: $machineType, ')
          ..write('description: $description, ')
          ..write('specification: $specification, ')
          ..write('status: $status, ')
          ..write('lastSync: $lastSync, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $JobTagsTable extends JobTags with TableInfo<$JobTagsTable, DbJobTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'TagId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<String> jobId = GeneratedColumn<String>(
    'JobId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineIdMeta = const VerificationMeta(
    'machineId',
  );
  @override
  late final GeneratedColumn<String> machineId = GeneratedColumn<String>(
    'MachineId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagNameMeta = const VerificationMeta(
    'tagName',
  );
  @override
  late final GeneratedColumn<String> tagName = GeneratedColumn<String>(
    'tagName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagTypeMeta = const VerificationMeta(
    'tagType',
  );
  @override
  late final GeneratedColumn<String> tagType = GeneratedColumn<String>(
    'tagType',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagGroupIdMeta = const VerificationMeta(
    'tagGroupId',
  );
  @override
  late final GeneratedColumn<String> tagGroupId = GeneratedColumn<String>(
    'TagGroupId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagGroupNameMeta = const VerificationMeta(
    'tagGroupName',
  );
  @override
  late final GeneratedColumn<String> tagGroupName = GeneratedColumn<String>(
    'TagGroupName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specificationMeta = const VerificationMeta(
    'specification',
  );
  @override
  late final GeneratedColumn<String> specification = GeneratedColumn<String>(
    'specification',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specMinMeta = const VerificationMeta(
    'specMin',
  );
  @override
  late final GeneratedColumn<String> specMin = GeneratedColumn<String>(
    'SpecMin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specMaxMeta = const VerificationMeta(
    'specMax',
  );
  @override
  late final GeneratedColumn<String> specMax = GeneratedColumn<String>(
    'SpecMax',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _queryStrMeta = const VerificationMeta(
    'queryStr',
  );
  @override
  late final GeneratedColumn<String> queryStr = GeneratedColumn<String>(
    'queryStr',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _driftQueryStrMeta = const VerificationMeta(
    'driftQueryStr',
  );
  @override
  late final GeneratedColumn<String> driftQueryStr = GeneratedColumn<String>(
    'driftQueryStr',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'Note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'Value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'Remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createDateMeta = const VerificationMeta(
    'createDate',
  );
  @override
  late final GeneratedColumn<String> createDate = GeneratedColumn<String>(
    'CreateDate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createByMeta = const VerificationMeta(
    'createBy',
  );
  @override
  late final GeneratedColumn<String> createBy = GeneratedColumn<String>(
    'CreateBy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueTypeMeta = const VerificationMeta(
    'valueType',
  );
  @override
  late final GeneratedColumn<String> valueType = GeneratedColumn<String>(
    'ValueType',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagSelectionValueMeta = const VerificationMeta(
    'tagSelectionValue',
  );
  @override
  late final GeneratedColumn<String> tagSelectionValue =
      GeneratedColumn<String>(
        'TagSelectionValue',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    tagId,
    jobId,
    machineId,
    tagName,
    tagType,
    tagGroupId,
    tagGroupName,
    description,
    specification,
    specMin,
    specMax,
    unit,
    queryStr,
    status,
    lastSync,
    driftQueryStr,
    note,
    value,
    remark,
    createDate,
    createBy,
    valueType,
    tagSelectionValue,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbJobTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('TagId')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['TagId']!, _tagIdMeta),
      );
    }
    if (data.containsKey('JobId')) {
      context.handle(
        _jobIdMeta,
        jobId.isAcceptableOrUnknown(data['JobId']!, _jobIdMeta),
      );
    }
    if (data.containsKey('MachineId')) {
      context.handle(
        _machineIdMeta,
        machineId.isAcceptableOrUnknown(data['MachineId']!, _machineIdMeta),
      );
    }
    if (data.containsKey('tagName')) {
      context.handle(
        _tagNameMeta,
        tagName.isAcceptableOrUnknown(data['tagName']!, _tagNameMeta),
      );
    }
    if (data.containsKey('tagType')) {
      context.handle(
        _tagTypeMeta,
        tagType.isAcceptableOrUnknown(data['tagType']!, _tagTypeMeta),
      );
    }
    if (data.containsKey('TagGroupId')) {
      context.handle(
        _tagGroupIdMeta,
        tagGroupId.isAcceptableOrUnknown(data['TagGroupId']!, _tagGroupIdMeta),
      );
    }
    if (data.containsKey('TagGroupName')) {
      context.handle(
        _tagGroupNameMeta,
        tagGroupName.isAcceptableOrUnknown(
          data['TagGroupName']!,
          _tagGroupNameMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('specification')) {
      context.handle(
        _specificationMeta,
        specification.isAcceptableOrUnknown(
          data['specification']!,
          _specificationMeta,
        ),
      );
    }
    if (data.containsKey('SpecMin')) {
      context.handle(
        _specMinMeta,
        specMin.isAcceptableOrUnknown(data['SpecMin']!, _specMinMeta),
      );
    }
    if (data.containsKey('SpecMax')) {
      context.handle(
        _specMaxMeta,
        specMax.isAcceptableOrUnknown(data['SpecMax']!, _specMaxMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('queryStr')) {
      context.handle(
        _queryStrMeta,
        queryStr.isAcceptableOrUnknown(data['queryStr']!, _queryStrMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('driftQueryStr')) {
      context.handle(
        _driftQueryStrMeta,
        driftQueryStr.isAcceptableOrUnknown(
          data['driftQueryStr']!,
          _driftQueryStrMeta,
        ),
      );
    }
    if (data.containsKey('Note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['Note']!, _noteMeta),
      );
    }
    if (data.containsKey('Value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['Value']!, _valueMeta),
      );
    }
    if (data.containsKey('Remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['Remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('CreateDate')) {
      context.handle(
        _createDateMeta,
        createDate.isAcceptableOrUnknown(data['CreateDate']!, _createDateMeta),
      );
    }
    if (data.containsKey('CreateBy')) {
      context.handle(
        _createByMeta,
        createBy.isAcceptableOrUnknown(data['CreateBy']!, _createByMeta),
      );
    }
    if (data.containsKey('ValueType')) {
      context.handle(
        _valueTypeMeta,
        valueType.isAcceptableOrUnknown(data['ValueType']!, _valueTypeMeta),
      );
    }
    if (data.containsKey('TagSelectionValue')) {
      context.handle(
        _tagSelectionValueMeta,
        tagSelectionValue.isAcceptableOrUnknown(
          data['TagSelectionValue']!,
          _tagSelectionValueMeta,
        ),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbJobTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbJobTag(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}TagId'],
      ),
      jobId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}JobId'],
      ),
      machineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineId'],
      ),
      tagName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagName'],
      ),
      tagType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagType'],
      ),
      tagGroupId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}TagGroupId'],
      ),
      tagGroupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}TagGroupName'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      specification: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specification'],
      ),
      specMin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}SpecMin'],
      ),
      specMax: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}SpecMax'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      ),
      queryStr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}queryStr'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      driftQueryStr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}driftQueryStr'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Note'],
      ),
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Value'],
      ),
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Remark'],
      ),
      createDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CreateDate'],
      ),
      createBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CreateBy'],
      ),
      valueType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ValueType'],
      ),
      tagSelectionValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}TagSelectionValue'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
    );
  }

  @override
  $JobTagsTable createAlias(String alias) {
    return $JobTagsTable(attachedDatabase, alias);
  }
}

class DbJobTag extends DataClass implements Insertable<DbJobTag> {
  final int uid;
  final String? tagId;
  final String? jobId;
  final String? machineId;
  final String? tagName;
  final String? tagType;
  final String? tagGroupId;
  final String? tagGroupName;
  final String? description;
  final String? specification;
  final String? specMin;
  final String? specMax;
  final String? unit;
  final String? queryStr;
  final int status;
  final String? lastSync;
  final String? driftQueryStr;
  final String? note;
  final String? value;
  final String? remark;
  final String? createDate;
  final String? createBy;
  final String? valueType;
  final String? tagSelectionValue;
  final String? updatedAt;
  const DbJobTag({
    required this.uid,
    this.tagId,
    this.jobId,
    this.machineId,
    this.tagName,
    this.tagType,
    this.tagGroupId,
    this.tagGroupName,
    this.description,
    this.specification,
    this.specMin,
    this.specMax,
    this.unit,
    this.queryStr,
    required this.status,
    this.lastSync,
    this.driftQueryStr,
    this.note,
    this.value,
    this.remark,
    this.createDate,
    this.createBy,
    this.valueType,
    this.tagSelectionValue,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || tagId != null) {
      map['TagId'] = Variable<String>(tagId);
    }
    if (!nullToAbsent || jobId != null) {
      map['JobId'] = Variable<String>(jobId);
    }
    if (!nullToAbsent || machineId != null) {
      map['MachineId'] = Variable<String>(machineId);
    }
    if (!nullToAbsent || tagName != null) {
      map['tagName'] = Variable<String>(tagName);
    }
    if (!nullToAbsent || tagType != null) {
      map['tagType'] = Variable<String>(tagType);
    }
    if (!nullToAbsent || tagGroupId != null) {
      map['TagGroupId'] = Variable<String>(tagGroupId);
    }
    if (!nullToAbsent || tagGroupName != null) {
      map['TagGroupName'] = Variable<String>(tagGroupName);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || specification != null) {
      map['specification'] = Variable<String>(specification);
    }
    if (!nullToAbsent || specMin != null) {
      map['SpecMin'] = Variable<String>(specMin);
    }
    if (!nullToAbsent || specMax != null) {
      map['SpecMax'] = Variable<String>(specMax);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || queryStr != null) {
      map['queryStr'] = Variable<String>(queryStr);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    if (!nullToAbsent || driftQueryStr != null) {
      map['driftQueryStr'] = Variable<String>(driftQueryStr);
    }
    if (!nullToAbsent || note != null) {
      map['Note'] = Variable<String>(note);
    }
    if (!nullToAbsent || value != null) {
      map['Value'] = Variable<String>(value);
    }
    if (!nullToAbsent || remark != null) {
      map['Remark'] = Variable<String>(remark);
    }
    if (!nullToAbsent || createDate != null) {
      map['CreateDate'] = Variable<String>(createDate);
    }
    if (!nullToAbsent || createBy != null) {
      map['CreateBy'] = Variable<String>(createBy);
    }
    if (!nullToAbsent || valueType != null) {
      map['ValueType'] = Variable<String>(valueType);
    }
    if (!nullToAbsent || tagSelectionValue != null) {
      map['TagSelectionValue'] = Variable<String>(tagSelectionValue);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    return map;
  }

  JobTagsCompanion toCompanion(bool nullToAbsent) {
    return JobTagsCompanion(
      uid: Value(uid),
      tagId: tagId == null && nullToAbsent
          ? const Value.absent()
          : Value(tagId),
      jobId: jobId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobId),
      machineId: machineId == null && nullToAbsent
          ? const Value.absent()
          : Value(machineId),
      tagName: tagName == null && nullToAbsent
          ? const Value.absent()
          : Value(tagName),
      tagType: tagType == null && nullToAbsent
          ? const Value.absent()
          : Value(tagType),
      tagGroupId: tagGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(tagGroupId),
      tagGroupName: tagGroupName == null && nullToAbsent
          ? const Value.absent()
          : Value(tagGroupName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      specification: specification == null && nullToAbsent
          ? const Value.absent()
          : Value(specification),
      specMin: specMin == null && nullToAbsent
          ? const Value.absent()
          : Value(specMin),
      specMax: specMax == null && nullToAbsent
          ? const Value.absent()
          : Value(specMax),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      queryStr: queryStr == null && nullToAbsent
          ? const Value.absent()
          : Value(queryStr),
      status: Value(status),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      driftQueryStr: driftQueryStr == null && nullToAbsent
          ? const Value.absent()
          : Value(driftQueryStr),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      value: value == null && nullToAbsent
          ? const Value.absent()
          : Value(value),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      createDate: createDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createDate),
      createBy: createBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createBy),
      valueType: valueType == null && nullToAbsent
          ? const Value.absent()
          : Value(valueType),
      tagSelectionValue: tagSelectionValue == null && nullToAbsent
          ? const Value.absent()
          : Value(tagSelectionValue),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbJobTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbJobTag(
      uid: serializer.fromJson<int>(json['uid']),
      tagId: serializer.fromJson<String?>(json['tagId']),
      jobId: serializer.fromJson<String?>(json['jobId']),
      machineId: serializer.fromJson<String?>(json['machineId']),
      tagName: serializer.fromJson<String?>(json['tagName']),
      tagType: serializer.fromJson<String?>(json['tagType']),
      tagGroupId: serializer.fromJson<String?>(json['tagGroupId']),
      tagGroupName: serializer.fromJson<String?>(json['tagGroupName']),
      description: serializer.fromJson<String?>(json['description']),
      specification: serializer.fromJson<String?>(json['specification']),
      specMin: serializer.fromJson<String?>(json['specMin']),
      specMax: serializer.fromJson<String?>(json['specMax']),
      unit: serializer.fromJson<String?>(json['unit']),
      queryStr: serializer.fromJson<String?>(json['queryStr']),
      status: serializer.fromJson<int>(json['status']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      driftQueryStr: serializer.fromJson<String?>(json['driftQueryStr']),
      note: serializer.fromJson<String?>(json['note']),
      value: serializer.fromJson<String?>(json['value']),
      remark: serializer.fromJson<String?>(json['remark']),
      createDate: serializer.fromJson<String?>(json['createDate']),
      createBy: serializer.fromJson<String?>(json['createBy']),
      valueType: serializer.fromJson<String?>(json['valueType']),
      tagSelectionValue: serializer.fromJson<String?>(
        json['tagSelectionValue'],
      ),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'tagId': serializer.toJson<String?>(tagId),
      'jobId': serializer.toJson<String?>(jobId),
      'machineId': serializer.toJson<String?>(machineId),
      'tagName': serializer.toJson<String?>(tagName),
      'tagType': serializer.toJson<String?>(tagType),
      'tagGroupId': serializer.toJson<String?>(tagGroupId),
      'tagGroupName': serializer.toJson<String?>(tagGroupName),
      'description': serializer.toJson<String?>(description),
      'specification': serializer.toJson<String?>(specification),
      'specMin': serializer.toJson<String?>(specMin),
      'specMax': serializer.toJson<String?>(specMax),
      'unit': serializer.toJson<String?>(unit),
      'queryStr': serializer.toJson<String?>(queryStr),
      'status': serializer.toJson<int>(status),
      'lastSync': serializer.toJson<String?>(lastSync),
      'driftQueryStr': serializer.toJson<String?>(driftQueryStr),
      'note': serializer.toJson<String?>(note),
      'value': serializer.toJson<String?>(value),
      'remark': serializer.toJson<String?>(remark),
      'createDate': serializer.toJson<String?>(createDate),
      'createBy': serializer.toJson<String?>(createBy),
      'valueType': serializer.toJson<String?>(valueType),
      'tagSelectionValue': serializer.toJson<String?>(tagSelectionValue),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  DbJobTag copyWith({
    int? uid,
    Value<String?> tagId = const Value.absent(),
    Value<String?> jobId = const Value.absent(),
    Value<String?> machineId = const Value.absent(),
    Value<String?> tagName = const Value.absent(),
    Value<String?> tagType = const Value.absent(),
    Value<String?> tagGroupId = const Value.absent(),
    Value<String?> tagGroupName = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> specification = const Value.absent(),
    Value<String?> specMin = const Value.absent(),
    Value<String?> specMax = const Value.absent(),
    Value<String?> unit = const Value.absent(),
    Value<String?> queryStr = const Value.absent(),
    int? status,
    Value<String?> lastSync = const Value.absent(),
    Value<String?> driftQueryStr = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<String?> value = const Value.absent(),
    Value<String?> remark = const Value.absent(),
    Value<String?> createDate = const Value.absent(),
    Value<String?> createBy = const Value.absent(),
    Value<String?> valueType = const Value.absent(),
    Value<String?> tagSelectionValue = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
  }) => DbJobTag(
    uid: uid ?? this.uid,
    tagId: tagId.present ? tagId.value : this.tagId,
    jobId: jobId.present ? jobId.value : this.jobId,
    machineId: machineId.present ? machineId.value : this.machineId,
    tagName: tagName.present ? tagName.value : this.tagName,
    tagType: tagType.present ? tagType.value : this.tagType,
    tagGroupId: tagGroupId.present ? tagGroupId.value : this.tagGroupId,
    tagGroupName: tagGroupName.present ? tagGroupName.value : this.tagGroupName,
    description: description.present ? description.value : this.description,
    specification: specification.present
        ? specification.value
        : this.specification,
    specMin: specMin.present ? specMin.value : this.specMin,
    specMax: specMax.present ? specMax.value : this.specMax,
    unit: unit.present ? unit.value : this.unit,
    queryStr: queryStr.present ? queryStr.value : this.queryStr,
    status: status ?? this.status,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    driftQueryStr: driftQueryStr.present
        ? driftQueryStr.value
        : this.driftQueryStr,
    note: note.present ? note.value : this.note,
    value: value.present ? value.value : this.value,
    remark: remark.present ? remark.value : this.remark,
    createDate: createDate.present ? createDate.value : this.createDate,
    createBy: createBy.present ? createBy.value : this.createBy,
    valueType: valueType.present ? valueType.value : this.valueType,
    tagSelectionValue: tagSelectionValue.present
        ? tagSelectionValue.value
        : this.tagSelectionValue,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbJobTag copyWithCompanion(JobTagsCompanion data) {
    return DbJobTag(
      uid: data.uid.present ? data.uid.value : this.uid,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      machineId: data.machineId.present ? data.machineId.value : this.machineId,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
      tagType: data.tagType.present ? data.tagType.value : this.tagType,
      tagGroupId: data.tagGroupId.present
          ? data.tagGroupId.value
          : this.tagGroupId,
      tagGroupName: data.tagGroupName.present
          ? data.tagGroupName.value
          : this.tagGroupName,
      description: data.description.present
          ? data.description.value
          : this.description,
      specification: data.specification.present
          ? data.specification.value
          : this.specification,
      specMin: data.specMin.present ? data.specMin.value : this.specMin,
      specMax: data.specMax.present ? data.specMax.value : this.specMax,
      unit: data.unit.present ? data.unit.value : this.unit,
      queryStr: data.queryStr.present ? data.queryStr.value : this.queryStr,
      status: data.status.present ? data.status.value : this.status,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      driftQueryStr: data.driftQueryStr.present
          ? data.driftQueryStr.value
          : this.driftQueryStr,
      note: data.note.present ? data.note.value : this.note,
      value: data.value.present ? data.value.value : this.value,
      remark: data.remark.present ? data.remark.value : this.remark,
      createDate: data.createDate.present
          ? data.createDate.value
          : this.createDate,
      createBy: data.createBy.present ? data.createBy.value : this.createBy,
      valueType: data.valueType.present ? data.valueType.value : this.valueType,
      tagSelectionValue: data.tagSelectionValue.present
          ? data.tagSelectionValue.value
          : this.tagSelectionValue,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbJobTag(')
          ..write('uid: $uid, ')
          ..write('tagId: $tagId, ')
          ..write('jobId: $jobId, ')
          ..write('machineId: $machineId, ')
          ..write('tagName: $tagName, ')
          ..write('tagType: $tagType, ')
          ..write('tagGroupId: $tagGroupId, ')
          ..write('tagGroupName: $tagGroupName, ')
          ..write('description: $description, ')
          ..write('specification: $specification, ')
          ..write('specMin: $specMin, ')
          ..write('specMax: $specMax, ')
          ..write('unit: $unit, ')
          ..write('queryStr: $queryStr, ')
          ..write('status: $status, ')
          ..write('lastSync: $lastSync, ')
          ..write('driftQueryStr: $driftQueryStr, ')
          ..write('note: $note, ')
          ..write('value: $value, ')
          ..write('remark: $remark, ')
          ..write('createDate: $createDate, ')
          ..write('createBy: $createBy, ')
          ..write('valueType: $valueType, ')
          ..write('tagSelectionValue: $tagSelectionValue, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    uid,
    tagId,
    jobId,
    machineId,
    tagName,
    tagType,
    tagGroupId,
    tagGroupName,
    description,
    specification,
    specMin,
    specMax,
    unit,
    queryStr,
    status,
    lastSync,
    driftQueryStr,
    note,
    value,
    remark,
    createDate,
    createBy,
    valueType,
    tagSelectionValue,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbJobTag &&
          other.uid == this.uid &&
          other.tagId == this.tagId &&
          other.jobId == this.jobId &&
          other.machineId == this.machineId &&
          other.tagName == this.tagName &&
          other.tagType == this.tagType &&
          other.tagGroupId == this.tagGroupId &&
          other.tagGroupName == this.tagGroupName &&
          other.description == this.description &&
          other.specification == this.specification &&
          other.specMin == this.specMin &&
          other.specMax == this.specMax &&
          other.unit == this.unit &&
          other.queryStr == this.queryStr &&
          other.status == this.status &&
          other.lastSync == this.lastSync &&
          other.driftQueryStr == this.driftQueryStr &&
          other.note == this.note &&
          other.value == this.value &&
          other.remark == this.remark &&
          other.createDate == this.createDate &&
          other.createBy == this.createBy &&
          other.valueType == this.valueType &&
          other.tagSelectionValue == this.tagSelectionValue &&
          other.updatedAt == this.updatedAt);
}

class JobTagsCompanion extends UpdateCompanion<DbJobTag> {
  final Value<int> uid;
  final Value<String?> tagId;
  final Value<String?> jobId;
  final Value<String?> machineId;
  final Value<String?> tagName;
  final Value<String?> tagType;
  final Value<String?> tagGroupId;
  final Value<String?> tagGroupName;
  final Value<String?> description;
  final Value<String?> specification;
  final Value<String?> specMin;
  final Value<String?> specMax;
  final Value<String?> unit;
  final Value<String?> queryStr;
  final Value<int> status;
  final Value<String?> lastSync;
  final Value<String?> driftQueryStr;
  final Value<String?> note;
  final Value<String?> value;
  final Value<String?> remark;
  final Value<String?> createDate;
  final Value<String?> createBy;
  final Value<String?> valueType;
  final Value<String?> tagSelectionValue;
  final Value<String?> updatedAt;
  const JobTagsCompanion({
    this.uid = const Value.absent(),
    this.tagId = const Value.absent(),
    this.jobId = const Value.absent(),
    this.machineId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.tagType = const Value.absent(),
    this.tagGroupId = const Value.absent(),
    this.tagGroupName = const Value.absent(),
    this.description = const Value.absent(),
    this.specification = const Value.absent(),
    this.specMin = const Value.absent(),
    this.specMax = const Value.absent(),
    this.unit = const Value.absent(),
    this.queryStr = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.driftQueryStr = const Value.absent(),
    this.note = const Value.absent(),
    this.value = const Value.absent(),
    this.remark = const Value.absent(),
    this.createDate = const Value.absent(),
    this.createBy = const Value.absent(),
    this.valueType = const Value.absent(),
    this.tagSelectionValue = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  JobTagsCompanion.insert({
    this.uid = const Value.absent(),
    this.tagId = const Value.absent(),
    this.jobId = const Value.absent(),
    this.machineId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.tagType = const Value.absent(),
    this.tagGroupId = const Value.absent(),
    this.tagGroupName = const Value.absent(),
    this.description = const Value.absent(),
    this.specification = const Value.absent(),
    this.specMin = const Value.absent(),
    this.specMax = const Value.absent(),
    this.unit = const Value.absent(),
    this.queryStr = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.driftQueryStr = const Value.absent(),
    this.note = const Value.absent(),
    this.value = const Value.absent(),
    this.remark = const Value.absent(),
    this.createDate = const Value.absent(),
    this.createBy = const Value.absent(),
    this.valueType = const Value.absent(),
    this.tagSelectionValue = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<DbJobTag> custom({
    Expression<int>? uid,
    Expression<String>? tagId,
    Expression<String>? jobId,
    Expression<String>? machineId,
    Expression<String>? tagName,
    Expression<String>? tagType,
    Expression<String>? tagGroupId,
    Expression<String>? tagGroupName,
    Expression<String>? description,
    Expression<String>? specification,
    Expression<String>? specMin,
    Expression<String>? specMax,
    Expression<String>? unit,
    Expression<String>? queryStr,
    Expression<int>? status,
    Expression<String>? lastSync,
    Expression<String>? driftQueryStr,
    Expression<String>? note,
    Expression<String>? value,
    Expression<String>? remark,
    Expression<String>? createDate,
    Expression<String>? createBy,
    Expression<String>? valueType,
    Expression<String>? tagSelectionValue,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (tagId != null) 'TagId': tagId,
      if (jobId != null) 'JobId': jobId,
      if (machineId != null) 'MachineId': machineId,
      if (tagName != null) 'tagName': tagName,
      if (tagType != null) 'tagType': tagType,
      if (tagGroupId != null) 'TagGroupId': tagGroupId,
      if (tagGroupName != null) 'TagGroupName': tagGroupName,
      if (description != null) 'description': description,
      if (specification != null) 'specification': specification,
      if (specMin != null) 'SpecMin': specMin,
      if (specMax != null) 'SpecMax': specMax,
      if (unit != null) 'unit': unit,
      if (queryStr != null) 'queryStr': queryStr,
      if (status != null) 'status': status,
      if (lastSync != null) 'lastSync': lastSync,
      if (driftQueryStr != null) 'driftQueryStr': driftQueryStr,
      if (note != null) 'Note': note,
      if (value != null) 'Value': value,
      if (remark != null) 'Remark': remark,
      if (createDate != null) 'CreateDate': createDate,
      if (createBy != null) 'CreateBy': createBy,
      if (valueType != null) 'ValueType': valueType,
      if (tagSelectionValue != null) 'TagSelectionValue': tagSelectionValue,
      if (updatedAt != null) 'updatedAt': updatedAt,
    });
  }

  JobTagsCompanion copyWith({
    Value<int>? uid,
    Value<String?>? tagId,
    Value<String?>? jobId,
    Value<String?>? machineId,
    Value<String?>? tagName,
    Value<String?>? tagType,
    Value<String?>? tagGroupId,
    Value<String?>? tagGroupName,
    Value<String?>? description,
    Value<String?>? specification,
    Value<String?>? specMin,
    Value<String?>? specMax,
    Value<String?>? unit,
    Value<String?>? queryStr,
    Value<int>? status,
    Value<String?>? lastSync,
    Value<String?>? driftQueryStr,
    Value<String?>? note,
    Value<String?>? value,
    Value<String?>? remark,
    Value<String?>? createDate,
    Value<String?>? createBy,
    Value<String?>? valueType,
    Value<String?>? tagSelectionValue,
    Value<String?>? updatedAt,
  }) {
    return JobTagsCompanion(
      uid: uid ?? this.uid,
      tagId: tagId ?? this.tagId,
      jobId: jobId ?? this.jobId,
      machineId: machineId ?? this.machineId,
      tagName: tagName ?? this.tagName,
      tagType: tagType ?? this.tagType,
      tagGroupId: tagGroupId ?? this.tagGroupId,
      tagGroupName: tagGroupName ?? this.tagGroupName,
      description: description ?? this.description,
      specification: specification ?? this.specification,
      specMin: specMin ?? this.specMin,
      specMax: specMax ?? this.specMax,
      unit: unit ?? this.unit,
      queryStr: queryStr ?? this.queryStr,
      status: status ?? this.status,
      lastSync: lastSync ?? this.lastSync,
      driftQueryStr: driftQueryStr ?? this.driftQueryStr,
      note: note ?? this.note,
      value: value ?? this.value,
      remark: remark ?? this.remark,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      valueType: valueType ?? this.valueType,
      tagSelectionValue: tagSelectionValue ?? this.tagSelectionValue,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (tagId.present) {
      map['TagId'] = Variable<String>(tagId.value);
    }
    if (jobId.present) {
      map['JobId'] = Variable<String>(jobId.value);
    }
    if (machineId.present) {
      map['MachineId'] = Variable<String>(machineId.value);
    }
    if (tagName.present) {
      map['tagName'] = Variable<String>(tagName.value);
    }
    if (tagType.present) {
      map['tagType'] = Variable<String>(tagType.value);
    }
    if (tagGroupId.present) {
      map['TagGroupId'] = Variable<String>(tagGroupId.value);
    }
    if (tagGroupName.present) {
      map['TagGroupName'] = Variable<String>(tagGroupName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (specification.present) {
      map['specification'] = Variable<String>(specification.value);
    }
    if (specMin.present) {
      map['SpecMin'] = Variable<String>(specMin.value);
    }
    if (specMax.present) {
      map['SpecMax'] = Variable<String>(specMax.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (queryStr.present) {
      map['queryStr'] = Variable<String>(queryStr.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (driftQueryStr.present) {
      map['driftQueryStr'] = Variable<String>(driftQueryStr.value);
    }
    if (note.present) {
      map['Note'] = Variable<String>(note.value);
    }
    if (value.present) {
      map['Value'] = Variable<String>(value.value);
    }
    if (remark.present) {
      map['Remark'] = Variable<String>(remark.value);
    }
    if (createDate.present) {
      map['CreateDate'] = Variable<String>(createDate.value);
    }
    if (createBy.present) {
      map['CreateBy'] = Variable<String>(createBy.value);
    }
    if (valueType.present) {
      map['ValueType'] = Variable<String>(valueType.value);
    }
    if (tagSelectionValue.present) {
      map['TagSelectionValue'] = Variable<String>(tagSelectionValue.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobTagsCompanion(')
          ..write('uid: $uid, ')
          ..write('tagId: $tagId, ')
          ..write('jobId: $jobId, ')
          ..write('machineId: $machineId, ')
          ..write('tagName: $tagName, ')
          ..write('tagType: $tagType, ')
          ..write('tagGroupId: $tagGroupId, ')
          ..write('tagGroupName: $tagGroupName, ')
          ..write('description: $description, ')
          ..write('specification: $specification, ')
          ..write('specMin: $specMin, ')
          ..write('specMax: $specMax, ')
          ..write('unit: $unit, ')
          ..write('queryStr: $queryStr, ')
          ..write('status: $status, ')
          ..write('lastSync: $lastSync, ')
          ..write('driftQueryStr: $driftQueryStr, ')
          ..write('note: $note, ')
          ..write('value: $value, ')
          ..write('remark: $remark, ')
          ..write('createDate: $createDate, ')
          ..write('createBy: $createBy, ')
          ..write('valueType: $valueType, ')
          ..write('tagSelectionValue: $tagSelectionValue, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProblemsTable extends Problems
    with TableInfo<$ProblemsTable, DbProblem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProblemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _problemIdMeta = const VerificationMeta(
    'problemId',
  );
  @override
  late final GeneratedColumn<String> problemId = GeneratedColumn<String>(
    'ProblemId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _problemNameMeta = const VerificationMeta(
    'problemName',
  );
  @override
  late final GeneratedColumn<String> problemName = GeneratedColumn<String>(
    'ProblemName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _problemDescriptionMeta =
      const VerificationMeta('problemDescription');
  @override
  late final GeneratedColumn<String> problemDescription =
      GeneratedColumn<String>(
        'ProblemDescription',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _problemStatusMeta = const VerificationMeta(
    'problemStatus',
  );
  @override
  late final GeneratedColumn<int> problemStatus = GeneratedColumn<int>(
    'ProblemStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _problemSolvingDescriptionMeta =
      const VerificationMeta('problemSolvingDescription');
  @override
  late final GeneratedColumn<String> problemSolvingDescription =
      GeneratedColumn<String>(
        'SolvingDescription',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'documentId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineIdMeta = const VerificationMeta(
    'machineId',
  );
  @override
  late final GeneratedColumn<String> machineId = GeneratedColumn<String>(
    'machineId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineNameMeta = const VerificationMeta(
    'machineName',
  );
  @override
  late final GeneratedColumn<String> machineName = GeneratedColumn<String>(
    'machineName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<String> jobId = GeneratedColumn<String>(
    'jobId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tagId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagNameMeta = const VerificationMeta(
    'tagName',
  );
  @override
  late final GeneratedColumn<String> tagName = GeneratedColumn<String>(
    'tagName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagTypeMeta = const VerificationMeta(
    'tagType',
  );
  @override
  late final GeneratedColumn<String> tagType = GeneratedColumn<String>(
    'tagType',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'TagDescription',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'Note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specificationMeta = const VerificationMeta(
    'specification',
  );
  @override
  late final GeneratedColumn<String> specification = GeneratedColumn<String>(
    'specification',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specMinMeta = const VerificationMeta(
    'specMin',
  );
  @override
  late final GeneratedColumn<String> specMin = GeneratedColumn<String>(
    'specMin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _specMaxMeta = const VerificationMeta(
    'specMax',
  );
  @override
  late final GeneratedColumn<String> specMax = GeneratedColumn<String>(
    'specMax',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unReadableMeta = const VerificationMeta(
    'unReadable',
  );
  @override
  late final GeneratedColumn<String> unReadable = GeneratedColumn<String>(
    'unReadable',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('false'),
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _problemSolvingByMeta = const VerificationMeta(
    'problemSolvingBy',
  );
  @override
  late final GeneratedColumn<String> problemSolvingBy = GeneratedColumn<String>(
    'SolvingBy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'syncStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    problemId,
    problemName,
    problemDescription,
    problemStatus,
    problemSolvingDescription,
    documentId,
    machineId,
    machineName,
    jobId,
    tagId,
    tagName,
    tagType,
    description,
    note,
    specification,
    specMin,
    specMax,
    unit,
    value,
    remark,
    unReadable,
    lastSync,
    problemSolvingBy,
    syncStatus,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'problems';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbProblem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('ProblemId')) {
      context.handle(
        _problemIdMeta,
        problemId.isAcceptableOrUnknown(data['ProblemId']!, _problemIdMeta),
      );
    }
    if (data.containsKey('ProblemName')) {
      context.handle(
        _problemNameMeta,
        problemName.isAcceptableOrUnknown(
          data['ProblemName']!,
          _problemNameMeta,
        ),
      );
    }
    if (data.containsKey('ProblemDescription')) {
      context.handle(
        _problemDescriptionMeta,
        problemDescription.isAcceptableOrUnknown(
          data['ProblemDescription']!,
          _problemDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('ProblemStatus')) {
      context.handle(
        _problemStatusMeta,
        problemStatus.isAcceptableOrUnknown(
          data['ProblemStatus']!,
          _problemStatusMeta,
        ),
      );
    }
    if (data.containsKey('SolvingDescription')) {
      context.handle(
        _problemSolvingDescriptionMeta,
        problemSolvingDescription.isAcceptableOrUnknown(
          data['SolvingDescription']!,
          _problemSolvingDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('documentId')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['documentId']!, _documentIdMeta),
      );
    }
    if (data.containsKey('machineId')) {
      context.handle(
        _machineIdMeta,
        machineId.isAcceptableOrUnknown(data['machineId']!, _machineIdMeta),
      );
    }
    if (data.containsKey('machineName')) {
      context.handle(
        _machineNameMeta,
        machineName.isAcceptableOrUnknown(
          data['machineName']!,
          _machineNameMeta,
        ),
      );
    }
    if (data.containsKey('jobId')) {
      context.handle(
        _jobIdMeta,
        jobId.isAcceptableOrUnknown(data['jobId']!, _jobIdMeta),
      );
    }
    if (data.containsKey('tagId')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tagId']!, _tagIdMeta),
      );
    }
    if (data.containsKey('tagName')) {
      context.handle(
        _tagNameMeta,
        tagName.isAcceptableOrUnknown(data['tagName']!, _tagNameMeta),
      );
    }
    if (data.containsKey('tagType')) {
      context.handle(
        _tagTypeMeta,
        tagType.isAcceptableOrUnknown(data['tagType']!, _tagTypeMeta),
      );
    }
    if (data.containsKey('TagDescription')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['TagDescription']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('Note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['Note']!, _noteMeta),
      );
    }
    if (data.containsKey('specification')) {
      context.handle(
        _specificationMeta,
        specification.isAcceptableOrUnknown(
          data['specification']!,
          _specificationMeta,
        ),
      );
    }
    if (data.containsKey('specMin')) {
      context.handle(
        _specMinMeta,
        specMin.isAcceptableOrUnknown(data['specMin']!, _specMinMeta),
      );
    }
    if (data.containsKey('specMax')) {
      context.handle(
        _specMaxMeta,
        specMax.isAcceptableOrUnknown(data['specMax']!, _specMaxMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('unReadable')) {
      context.handle(
        _unReadableMeta,
        unReadable.isAcceptableOrUnknown(data['unReadable']!, _unReadableMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('SolvingBy')) {
      context.handle(
        _problemSolvingByMeta,
        problemSolvingBy.isAcceptableOrUnknown(
          data['SolvingBy']!,
          _problemSolvingByMeta,
        ),
      );
    }
    if (data.containsKey('syncStatus')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['syncStatus']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbProblem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbProblem(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      problemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ProblemId'],
      ),
      problemName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ProblemName'],
      ),
      problemDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ProblemDescription'],
      ),
      problemStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ProblemStatus'],
      )!,
      problemSolvingDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}SolvingDescription'],
      ),
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentId'],
      ),
      machineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}machineId'],
      ),
      machineName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}machineName'],
      ),
      jobId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jobId'],
      ),
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagId'],
      ),
      tagName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagName'],
      ),
      tagType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagType'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}TagDescription'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Note'],
      ),
      specification: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specification'],
      ),
      specMin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specMin'],
      ),
      specMax: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specMax'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      ),
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      ),
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      unReadable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unReadable'],
      )!,
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      problemSolvingBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}SolvingBy'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}syncStatus'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
    );
  }

  @override
  $ProblemsTable createAlias(String alias) {
    return $ProblemsTable(attachedDatabase, alias);
  }
}

class DbProblem extends DataClass implements Insertable<DbProblem> {
  final int uid;
  final String? problemId;
  final String? problemName;
  final String? problemDescription;
  final int problemStatus;
  final String? problemSolvingDescription;
  final String? documentId;
  final String? machineId;
  final String? machineName;
  final String? jobId;
  final String? tagId;
  final String? tagName;
  final String? tagType;
  final String? description;
  final String? note;
  final String? specification;
  final String? specMin;
  final String? specMax;
  final String? unit;
  final String? value;
  final String? remark;
  final String unReadable;
  final String? lastSync;
  final String? problemSolvingBy;
  final int syncStatus;
  final String? updatedAt;
  const DbProblem({
    required this.uid,
    this.problemId,
    this.problemName,
    this.problemDescription,
    required this.problemStatus,
    this.problemSolvingDescription,
    this.documentId,
    this.machineId,
    this.machineName,
    this.jobId,
    this.tagId,
    this.tagName,
    this.tagType,
    this.description,
    this.note,
    this.specification,
    this.specMin,
    this.specMax,
    this.unit,
    this.value,
    this.remark,
    required this.unReadable,
    this.lastSync,
    this.problemSolvingBy,
    required this.syncStatus,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || problemId != null) {
      map['ProblemId'] = Variable<String>(problemId);
    }
    if (!nullToAbsent || problemName != null) {
      map['ProblemName'] = Variable<String>(problemName);
    }
    if (!nullToAbsent || problemDescription != null) {
      map['ProblemDescription'] = Variable<String>(problemDescription);
    }
    map['ProblemStatus'] = Variable<int>(problemStatus);
    if (!nullToAbsent || problemSolvingDescription != null) {
      map['SolvingDescription'] = Variable<String>(problemSolvingDescription);
    }
    if (!nullToAbsent || documentId != null) {
      map['documentId'] = Variable<String>(documentId);
    }
    if (!nullToAbsent || machineId != null) {
      map['machineId'] = Variable<String>(machineId);
    }
    if (!nullToAbsent || machineName != null) {
      map['machineName'] = Variable<String>(machineName);
    }
    if (!nullToAbsent || jobId != null) {
      map['jobId'] = Variable<String>(jobId);
    }
    if (!nullToAbsent || tagId != null) {
      map['tagId'] = Variable<String>(tagId);
    }
    if (!nullToAbsent || tagName != null) {
      map['tagName'] = Variable<String>(tagName);
    }
    if (!nullToAbsent || tagType != null) {
      map['tagType'] = Variable<String>(tagType);
    }
    if (!nullToAbsent || description != null) {
      map['TagDescription'] = Variable<String>(description);
    }
    if (!nullToAbsent || note != null) {
      map['Note'] = Variable<String>(note);
    }
    if (!nullToAbsent || specification != null) {
      map['specification'] = Variable<String>(specification);
    }
    if (!nullToAbsent || specMin != null) {
      map['specMin'] = Variable<String>(specMin);
    }
    if (!nullToAbsent || specMax != null) {
      map['specMax'] = Variable<String>(specMax);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['unReadable'] = Variable<String>(unReadable);
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    if (!nullToAbsent || problemSolvingBy != null) {
      map['SolvingBy'] = Variable<String>(problemSolvingBy);
    }
    map['syncStatus'] = Variable<int>(syncStatus);
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    return map;
  }

  ProblemsCompanion toCompanion(bool nullToAbsent) {
    return ProblemsCompanion(
      uid: Value(uid),
      problemId: problemId == null && nullToAbsent
          ? const Value.absent()
          : Value(problemId),
      problemName: problemName == null && nullToAbsent
          ? const Value.absent()
          : Value(problemName),
      problemDescription: problemDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(problemDescription),
      problemStatus: Value(problemStatus),
      problemSolvingDescription:
          problemSolvingDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(problemSolvingDescription),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      machineId: machineId == null && nullToAbsent
          ? const Value.absent()
          : Value(machineId),
      machineName: machineName == null && nullToAbsent
          ? const Value.absent()
          : Value(machineName),
      jobId: jobId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobId),
      tagId: tagId == null && nullToAbsent
          ? const Value.absent()
          : Value(tagId),
      tagName: tagName == null && nullToAbsent
          ? const Value.absent()
          : Value(tagName),
      tagType: tagType == null && nullToAbsent
          ? const Value.absent()
          : Value(tagType),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      specification: specification == null && nullToAbsent
          ? const Value.absent()
          : Value(specification),
      specMin: specMin == null && nullToAbsent
          ? const Value.absent()
          : Value(specMin),
      specMax: specMax == null && nullToAbsent
          ? const Value.absent()
          : Value(specMax),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      value: value == null && nullToAbsent
          ? const Value.absent()
          : Value(value),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      unReadable: Value(unReadable),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      problemSolvingBy: problemSolvingBy == null && nullToAbsent
          ? const Value.absent()
          : Value(problemSolvingBy),
      syncStatus: Value(syncStatus),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbProblem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbProblem(
      uid: serializer.fromJson<int>(json['uid']),
      problemId: serializer.fromJson<String?>(json['problemId']),
      problemName: serializer.fromJson<String?>(json['problemName']),
      problemDescription: serializer.fromJson<String?>(
        json['problemDescription'],
      ),
      problemStatus: serializer.fromJson<int>(json['problemStatus']),
      problemSolvingDescription: serializer.fromJson<String?>(
        json['problemSolvingDescription'],
      ),
      documentId: serializer.fromJson<String?>(json['documentId']),
      machineId: serializer.fromJson<String?>(json['machineId']),
      machineName: serializer.fromJson<String?>(json['machineName']),
      jobId: serializer.fromJson<String?>(json['jobId']),
      tagId: serializer.fromJson<String?>(json['tagId']),
      tagName: serializer.fromJson<String?>(json['tagName']),
      tagType: serializer.fromJson<String?>(json['tagType']),
      description: serializer.fromJson<String?>(json['description']),
      note: serializer.fromJson<String?>(json['note']),
      specification: serializer.fromJson<String?>(json['specification']),
      specMin: serializer.fromJson<String?>(json['specMin']),
      specMax: serializer.fromJson<String?>(json['specMax']),
      unit: serializer.fromJson<String?>(json['unit']),
      value: serializer.fromJson<String?>(json['value']),
      remark: serializer.fromJson<String?>(json['remark']),
      unReadable: serializer.fromJson<String>(json['unReadable']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      problemSolvingBy: serializer.fromJson<String?>(json['problemSolvingBy']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'problemId': serializer.toJson<String?>(problemId),
      'problemName': serializer.toJson<String?>(problemName),
      'problemDescription': serializer.toJson<String?>(problemDescription),
      'problemStatus': serializer.toJson<int>(problemStatus),
      'problemSolvingDescription': serializer.toJson<String?>(
        problemSolvingDescription,
      ),
      'documentId': serializer.toJson<String?>(documentId),
      'machineId': serializer.toJson<String?>(machineId),
      'machineName': serializer.toJson<String?>(machineName),
      'jobId': serializer.toJson<String?>(jobId),
      'tagId': serializer.toJson<String?>(tagId),
      'tagName': serializer.toJson<String?>(tagName),
      'tagType': serializer.toJson<String?>(tagType),
      'description': serializer.toJson<String?>(description),
      'note': serializer.toJson<String?>(note),
      'specification': serializer.toJson<String?>(specification),
      'specMin': serializer.toJson<String?>(specMin),
      'specMax': serializer.toJson<String?>(specMax),
      'unit': serializer.toJson<String?>(unit),
      'value': serializer.toJson<String?>(value),
      'remark': serializer.toJson<String?>(remark),
      'unReadable': serializer.toJson<String>(unReadable),
      'lastSync': serializer.toJson<String?>(lastSync),
      'problemSolvingBy': serializer.toJson<String?>(problemSolvingBy),
      'syncStatus': serializer.toJson<int>(syncStatus),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  DbProblem copyWith({
    int? uid,
    Value<String?> problemId = const Value.absent(),
    Value<String?> problemName = const Value.absent(),
    Value<String?> problemDescription = const Value.absent(),
    int? problemStatus,
    Value<String?> problemSolvingDescription = const Value.absent(),
    Value<String?> documentId = const Value.absent(),
    Value<String?> machineId = const Value.absent(),
    Value<String?> machineName = const Value.absent(),
    Value<String?> jobId = const Value.absent(),
    Value<String?> tagId = const Value.absent(),
    Value<String?> tagName = const Value.absent(),
    Value<String?> tagType = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<String?> specification = const Value.absent(),
    Value<String?> specMin = const Value.absent(),
    Value<String?> specMax = const Value.absent(),
    Value<String?> unit = const Value.absent(),
    Value<String?> value = const Value.absent(),
    Value<String?> remark = const Value.absent(),
    String? unReadable,
    Value<String?> lastSync = const Value.absent(),
    Value<String?> problemSolvingBy = const Value.absent(),
    int? syncStatus,
    Value<String?> updatedAt = const Value.absent(),
  }) => DbProblem(
    uid: uid ?? this.uid,
    problemId: problemId.present ? problemId.value : this.problemId,
    problemName: problemName.present ? problemName.value : this.problemName,
    problemDescription: problemDescription.present
        ? problemDescription.value
        : this.problemDescription,
    problemStatus: problemStatus ?? this.problemStatus,
    problemSolvingDescription: problemSolvingDescription.present
        ? problemSolvingDescription.value
        : this.problemSolvingDescription,
    documentId: documentId.present ? documentId.value : this.documentId,
    machineId: machineId.present ? machineId.value : this.machineId,
    machineName: machineName.present ? machineName.value : this.machineName,
    jobId: jobId.present ? jobId.value : this.jobId,
    tagId: tagId.present ? tagId.value : this.tagId,
    tagName: tagName.present ? tagName.value : this.tagName,
    tagType: tagType.present ? tagType.value : this.tagType,
    description: description.present ? description.value : this.description,
    note: note.present ? note.value : this.note,
    specification: specification.present
        ? specification.value
        : this.specification,
    specMin: specMin.present ? specMin.value : this.specMin,
    specMax: specMax.present ? specMax.value : this.specMax,
    unit: unit.present ? unit.value : this.unit,
    value: value.present ? value.value : this.value,
    remark: remark.present ? remark.value : this.remark,
    unReadable: unReadable ?? this.unReadable,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    problemSolvingBy: problemSolvingBy.present
        ? problemSolvingBy.value
        : this.problemSolvingBy,
    syncStatus: syncStatus ?? this.syncStatus,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbProblem copyWithCompanion(ProblemsCompanion data) {
    return DbProblem(
      uid: data.uid.present ? data.uid.value : this.uid,
      problemId: data.problemId.present ? data.problemId.value : this.problemId,
      problemName: data.problemName.present
          ? data.problemName.value
          : this.problemName,
      problemDescription: data.problemDescription.present
          ? data.problemDescription.value
          : this.problemDescription,
      problemStatus: data.problemStatus.present
          ? data.problemStatus.value
          : this.problemStatus,
      problemSolvingDescription: data.problemSolvingDescription.present
          ? data.problemSolvingDescription.value
          : this.problemSolvingDescription,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      machineId: data.machineId.present ? data.machineId.value : this.machineId,
      machineName: data.machineName.present
          ? data.machineName.value
          : this.machineName,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
      tagType: data.tagType.present ? data.tagType.value : this.tagType,
      description: data.description.present
          ? data.description.value
          : this.description,
      note: data.note.present ? data.note.value : this.note,
      specification: data.specification.present
          ? data.specification.value
          : this.specification,
      specMin: data.specMin.present ? data.specMin.value : this.specMin,
      specMax: data.specMax.present ? data.specMax.value : this.specMax,
      unit: data.unit.present ? data.unit.value : this.unit,
      value: data.value.present ? data.value.value : this.value,
      remark: data.remark.present ? data.remark.value : this.remark,
      unReadable: data.unReadable.present
          ? data.unReadable.value
          : this.unReadable,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      problemSolvingBy: data.problemSolvingBy.present
          ? data.problemSolvingBy.value
          : this.problemSolvingBy,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbProblem(')
          ..write('uid: $uid, ')
          ..write('problemId: $problemId, ')
          ..write('problemName: $problemName, ')
          ..write('problemDescription: $problemDescription, ')
          ..write('problemStatus: $problemStatus, ')
          ..write('problemSolvingDescription: $problemSolvingDescription, ')
          ..write('documentId: $documentId, ')
          ..write('machineId: $machineId, ')
          ..write('machineName: $machineName, ')
          ..write('jobId: $jobId, ')
          ..write('tagId: $tagId, ')
          ..write('tagName: $tagName, ')
          ..write('tagType: $tagType, ')
          ..write('description: $description, ')
          ..write('note: $note, ')
          ..write('specification: $specification, ')
          ..write('specMin: $specMin, ')
          ..write('specMax: $specMax, ')
          ..write('unit: $unit, ')
          ..write('value: $value, ')
          ..write('remark: $remark, ')
          ..write('unReadable: $unReadable, ')
          ..write('lastSync: $lastSync, ')
          ..write('problemSolvingBy: $problemSolvingBy, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    uid,
    problemId,
    problemName,
    problemDescription,
    problemStatus,
    problemSolvingDescription,
    documentId,
    machineId,
    machineName,
    jobId,
    tagId,
    tagName,
    tagType,
    description,
    note,
    specification,
    specMin,
    specMax,
    unit,
    value,
    remark,
    unReadable,
    lastSync,
    problemSolvingBy,
    syncStatus,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbProblem &&
          other.uid == this.uid &&
          other.problemId == this.problemId &&
          other.problemName == this.problemName &&
          other.problemDescription == this.problemDescription &&
          other.problemStatus == this.problemStatus &&
          other.problemSolvingDescription == this.problemSolvingDescription &&
          other.documentId == this.documentId &&
          other.machineId == this.machineId &&
          other.machineName == this.machineName &&
          other.jobId == this.jobId &&
          other.tagId == this.tagId &&
          other.tagName == this.tagName &&
          other.tagType == this.tagType &&
          other.description == this.description &&
          other.note == this.note &&
          other.specification == this.specification &&
          other.specMin == this.specMin &&
          other.specMax == this.specMax &&
          other.unit == this.unit &&
          other.value == this.value &&
          other.remark == this.remark &&
          other.unReadable == this.unReadable &&
          other.lastSync == this.lastSync &&
          other.problemSolvingBy == this.problemSolvingBy &&
          other.syncStatus == this.syncStatus &&
          other.updatedAt == this.updatedAt);
}

class ProblemsCompanion extends UpdateCompanion<DbProblem> {
  final Value<int> uid;
  final Value<String?> problemId;
  final Value<String?> problemName;
  final Value<String?> problemDescription;
  final Value<int> problemStatus;
  final Value<String?> problemSolvingDescription;
  final Value<String?> documentId;
  final Value<String?> machineId;
  final Value<String?> machineName;
  final Value<String?> jobId;
  final Value<String?> tagId;
  final Value<String?> tagName;
  final Value<String?> tagType;
  final Value<String?> description;
  final Value<String?> note;
  final Value<String?> specification;
  final Value<String?> specMin;
  final Value<String?> specMax;
  final Value<String?> unit;
  final Value<String?> value;
  final Value<String?> remark;
  final Value<String> unReadable;
  final Value<String?> lastSync;
  final Value<String?> problemSolvingBy;
  final Value<int> syncStatus;
  final Value<String?> updatedAt;
  const ProblemsCompanion({
    this.uid = const Value.absent(),
    this.problemId = const Value.absent(),
    this.problemName = const Value.absent(),
    this.problemDescription = const Value.absent(),
    this.problemStatus = const Value.absent(),
    this.problemSolvingDescription = const Value.absent(),
    this.documentId = const Value.absent(),
    this.machineId = const Value.absent(),
    this.machineName = const Value.absent(),
    this.jobId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.tagType = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
    this.specification = const Value.absent(),
    this.specMin = const Value.absent(),
    this.specMax = const Value.absent(),
    this.unit = const Value.absent(),
    this.value = const Value.absent(),
    this.remark = const Value.absent(),
    this.unReadable = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.problemSolvingBy = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProblemsCompanion.insert({
    this.uid = const Value.absent(),
    this.problemId = const Value.absent(),
    this.problemName = const Value.absent(),
    this.problemDescription = const Value.absent(),
    this.problemStatus = const Value.absent(),
    this.problemSolvingDescription = const Value.absent(),
    this.documentId = const Value.absent(),
    this.machineId = const Value.absent(),
    this.machineName = const Value.absent(),
    this.jobId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.tagName = const Value.absent(),
    this.tagType = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
    this.specification = const Value.absent(),
    this.specMin = const Value.absent(),
    this.specMax = const Value.absent(),
    this.unit = const Value.absent(),
    this.value = const Value.absent(),
    this.remark = const Value.absent(),
    this.unReadable = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.problemSolvingBy = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<DbProblem> custom({
    Expression<int>? uid,
    Expression<String>? problemId,
    Expression<String>? problemName,
    Expression<String>? problemDescription,
    Expression<int>? problemStatus,
    Expression<String>? problemSolvingDescription,
    Expression<String>? documentId,
    Expression<String>? machineId,
    Expression<String>? machineName,
    Expression<String>? jobId,
    Expression<String>? tagId,
    Expression<String>? tagName,
    Expression<String>? tagType,
    Expression<String>? description,
    Expression<String>? note,
    Expression<String>? specification,
    Expression<String>? specMin,
    Expression<String>? specMax,
    Expression<String>? unit,
    Expression<String>? value,
    Expression<String>? remark,
    Expression<String>? unReadable,
    Expression<String>? lastSync,
    Expression<String>? problemSolvingBy,
    Expression<int>? syncStatus,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (problemId != null) 'ProblemId': problemId,
      if (problemName != null) 'ProblemName': problemName,
      if (problemDescription != null) 'ProblemDescription': problemDescription,
      if (problemStatus != null) 'ProblemStatus': problemStatus,
      if (problemSolvingDescription != null)
        'SolvingDescription': problemSolvingDescription,
      if (documentId != null) 'documentId': documentId,
      if (machineId != null) 'machineId': machineId,
      if (machineName != null) 'machineName': machineName,
      if (jobId != null) 'jobId': jobId,
      if (tagId != null) 'tagId': tagId,
      if (tagName != null) 'tagName': tagName,
      if (tagType != null) 'tagType': tagType,
      if (description != null) 'TagDescription': description,
      if (note != null) 'Note': note,
      if (specification != null) 'specification': specification,
      if (specMin != null) 'specMin': specMin,
      if (specMax != null) 'specMax': specMax,
      if (unit != null) 'unit': unit,
      if (value != null) 'value': value,
      if (remark != null) 'remark': remark,
      if (unReadable != null) 'unReadable': unReadable,
      if (lastSync != null) 'lastSync': lastSync,
      if (problemSolvingBy != null) 'SolvingBy': problemSolvingBy,
      if (syncStatus != null) 'syncStatus': syncStatus,
      if (updatedAt != null) 'updatedAt': updatedAt,
    });
  }

  ProblemsCompanion copyWith({
    Value<int>? uid,
    Value<String?>? problemId,
    Value<String?>? problemName,
    Value<String?>? problemDescription,
    Value<int>? problemStatus,
    Value<String?>? problemSolvingDescription,
    Value<String?>? documentId,
    Value<String?>? machineId,
    Value<String?>? machineName,
    Value<String?>? jobId,
    Value<String?>? tagId,
    Value<String?>? tagName,
    Value<String?>? tagType,
    Value<String?>? description,
    Value<String?>? note,
    Value<String?>? specification,
    Value<String?>? specMin,
    Value<String?>? specMax,
    Value<String?>? unit,
    Value<String?>? value,
    Value<String?>? remark,
    Value<String>? unReadable,
    Value<String?>? lastSync,
    Value<String?>? problemSolvingBy,
    Value<int>? syncStatus,
    Value<String?>? updatedAt,
  }) {
    return ProblemsCompanion(
      uid: uid ?? this.uid,
      problemId: problemId ?? this.problemId,
      problemName: problemName ?? this.problemName,
      problemDescription: problemDescription ?? this.problemDescription,
      problemStatus: problemStatus ?? this.problemStatus,
      problemSolvingDescription:
          problemSolvingDescription ?? this.problemSolvingDescription,
      documentId: documentId ?? this.documentId,
      machineId: machineId ?? this.machineId,
      machineName: machineName ?? this.machineName,
      jobId: jobId ?? this.jobId,
      tagId: tagId ?? this.tagId,
      tagName: tagName ?? this.tagName,
      tagType: tagType ?? this.tagType,
      description: description ?? this.description,
      note: note ?? this.note,
      specification: specification ?? this.specification,
      specMin: specMin ?? this.specMin,
      specMax: specMax ?? this.specMax,
      unit: unit ?? this.unit,
      value: value ?? this.value,
      remark: remark ?? this.remark,
      unReadable: unReadable ?? this.unReadable,
      lastSync: lastSync ?? this.lastSync,
      problemSolvingBy: problemSolvingBy ?? this.problemSolvingBy,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (problemId.present) {
      map['ProblemId'] = Variable<String>(problemId.value);
    }
    if (problemName.present) {
      map['ProblemName'] = Variable<String>(problemName.value);
    }
    if (problemDescription.present) {
      map['ProblemDescription'] = Variable<String>(problemDescription.value);
    }
    if (problemStatus.present) {
      map['ProblemStatus'] = Variable<int>(problemStatus.value);
    }
    if (problemSolvingDescription.present) {
      map['SolvingDescription'] = Variable<String>(
        problemSolvingDescription.value,
      );
    }
    if (documentId.present) {
      map['documentId'] = Variable<String>(documentId.value);
    }
    if (machineId.present) {
      map['machineId'] = Variable<String>(machineId.value);
    }
    if (machineName.present) {
      map['machineName'] = Variable<String>(machineName.value);
    }
    if (jobId.present) {
      map['jobId'] = Variable<String>(jobId.value);
    }
    if (tagId.present) {
      map['tagId'] = Variable<String>(tagId.value);
    }
    if (tagName.present) {
      map['tagName'] = Variable<String>(tagName.value);
    }
    if (tagType.present) {
      map['tagType'] = Variable<String>(tagType.value);
    }
    if (description.present) {
      map['TagDescription'] = Variable<String>(description.value);
    }
    if (note.present) {
      map['Note'] = Variable<String>(note.value);
    }
    if (specification.present) {
      map['specification'] = Variable<String>(specification.value);
    }
    if (specMin.present) {
      map['specMin'] = Variable<String>(specMin.value);
    }
    if (specMax.present) {
      map['specMax'] = Variable<String>(specMax.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (unReadable.present) {
      map['unReadable'] = Variable<String>(unReadable.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (problemSolvingBy.present) {
      map['SolvingBy'] = Variable<String>(problemSolvingBy.value);
    }
    if (syncStatus.present) {
      map['syncStatus'] = Variable<int>(syncStatus.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProblemsCompanion(')
          ..write('uid: $uid, ')
          ..write('problemId: $problemId, ')
          ..write('problemName: $problemName, ')
          ..write('problemDescription: $problemDescription, ')
          ..write('problemStatus: $problemStatus, ')
          ..write('problemSolvingDescription: $problemSolvingDescription, ')
          ..write('documentId: $documentId, ')
          ..write('machineId: $machineId, ')
          ..write('machineName: $machineName, ')
          ..write('jobId: $jobId, ')
          ..write('tagId: $tagId, ')
          ..write('tagName: $tagName, ')
          ..write('tagType: $tagType, ')
          ..write('description: $description, ')
          ..write('note: $note, ')
          ..write('specification: $specification, ')
          ..write('specMin: $specMin, ')
          ..write('specMax: $specMax, ')
          ..write('unit: $unit, ')
          ..write('value: $value, ')
          ..write('remark: $remark, ')
          ..write('unReadable: $unReadable, ')
          ..write('lastSync: $lastSync, ')
          ..write('problemSolvingBy: $problemSolvingBy, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SyncsTable extends Syncs with TableInfo<$SyncsTable, DbSync> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _syncIdMeta = const VerificationMeta('syncId');
  @override
  late final GeneratedColumn<String> syncId = GeneratedColumn<String>(
    'SyncId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncNameMeta = const VerificationMeta(
    'syncName',
  );
  @override
  late final GeneratedColumn<String> syncName = GeneratedColumn<String>(
    'SyncName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'LastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'SyncStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextSyncMeta = const VerificationMeta(
    'nextSync',
  );
  @override
  late final GeneratedColumn<String> nextSync = GeneratedColumn<String>(
    'NextSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    syncId,
    syncName,
    lastSync,
    syncStatus,
    nextSync,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'syncs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbSync> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('SyncId')) {
      context.handle(
        _syncIdMeta,
        syncId.isAcceptableOrUnknown(data['SyncId']!, _syncIdMeta),
      );
    }
    if (data.containsKey('SyncName')) {
      context.handle(
        _syncNameMeta,
        syncName.isAcceptableOrUnknown(data['SyncName']!, _syncNameMeta),
      );
    }
    if (data.containsKey('LastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['LastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('SyncStatus')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['SyncStatus']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('NextSync')) {
      context.handle(
        _nextSyncMeta,
        nextSync.isAcceptableOrUnknown(data['NextSync']!, _nextSyncMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbSync map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbSync(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      syncId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}SyncId'],
      ),
      syncName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}SyncName'],
      ),
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}LastSync'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}SyncStatus'],
      )!,
      nextSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}NextSync'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
    );
  }

  @override
  $SyncsTable createAlias(String alias) {
    return $SyncsTable(attachedDatabase, alias);
  }
}

class DbSync extends DataClass implements Insertable<DbSync> {
  final int uid;
  final String? syncId;
  final String? syncName;
  final String? lastSync;
  final int syncStatus;
  final String? nextSync;
  final String? updatedAt;
  const DbSync({
    required this.uid,
    this.syncId,
    this.syncName,
    this.lastSync,
    required this.syncStatus,
    this.nextSync,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || syncId != null) {
      map['SyncId'] = Variable<String>(syncId);
    }
    if (!nullToAbsent || syncName != null) {
      map['SyncName'] = Variable<String>(syncName);
    }
    if (!nullToAbsent || lastSync != null) {
      map['LastSync'] = Variable<String>(lastSync);
    }
    map['SyncStatus'] = Variable<int>(syncStatus);
    if (!nullToAbsent || nextSync != null) {
      map['NextSync'] = Variable<String>(nextSync);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    return map;
  }

  SyncsCompanion toCompanion(bool nullToAbsent) {
    return SyncsCompanion(
      uid: Value(uid),
      syncId: syncId == null && nullToAbsent
          ? const Value.absent()
          : Value(syncId),
      syncName: syncName == null && nullToAbsent
          ? const Value.absent()
          : Value(syncName),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      syncStatus: Value(syncStatus),
      nextSync: nextSync == null && nullToAbsent
          ? const Value.absent()
          : Value(nextSync),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbSync.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSync(
      uid: serializer.fromJson<int>(json['uid']),
      syncId: serializer.fromJson<String?>(json['syncId']),
      syncName: serializer.fromJson<String?>(json['syncName']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
      nextSync: serializer.fromJson<String?>(json['nextSync']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'syncId': serializer.toJson<String?>(syncId),
      'syncName': serializer.toJson<String?>(syncName),
      'lastSync': serializer.toJson<String?>(lastSync),
      'syncStatus': serializer.toJson<int>(syncStatus),
      'nextSync': serializer.toJson<String?>(nextSync),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  DbSync copyWith({
    int? uid,
    Value<String?> syncId = const Value.absent(),
    Value<String?> syncName = const Value.absent(),
    Value<String?> lastSync = const Value.absent(),
    int? syncStatus,
    Value<String?> nextSync = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
  }) => DbSync(
    uid: uid ?? this.uid,
    syncId: syncId.present ? syncId.value : this.syncId,
    syncName: syncName.present ? syncName.value : this.syncName,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    syncStatus: syncStatus ?? this.syncStatus,
    nextSync: nextSync.present ? nextSync.value : this.nextSync,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbSync copyWithCompanion(SyncsCompanion data) {
    return DbSync(
      uid: data.uid.present ? data.uid.value : this.uid,
      syncId: data.syncId.present ? data.syncId.value : this.syncId,
      syncName: data.syncName.present ? data.syncName.value : this.syncName,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      nextSync: data.nextSync.present ? data.nextSync.value : this.nextSync,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbSync(')
          ..write('uid: $uid, ')
          ..write('syncId: $syncId, ')
          ..write('syncName: $syncName, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('nextSync: $nextSync, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    syncId,
    syncName,
    lastSync,
    syncStatus,
    nextSync,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSync &&
          other.uid == this.uid &&
          other.syncId == this.syncId &&
          other.syncName == this.syncName &&
          other.lastSync == this.lastSync &&
          other.syncStatus == this.syncStatus &&
          other.nextSync == this.nextSync &&
          other.updatedAt == this.updatedAt);
}

class SyncsCompanion extends UpdateCompanion<DbSync> {
  final Value<int> uid;
  final Value<String?> syncId;
  final Value<String?> syncName;
  final Value<String?> lastSync;
  final Value<int> syncStatus;
  final Value<String?> nextSync;
  final Value<String?> updatedAt;
  const SyncsCompanion({
    this.uid = const Value.absent(),
    this.syncId = const Value.absent(),
    this.syncName = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.nextSync = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SyncsCompanion.insert({
    this.uid = const Value.absent(),
    this.syncId = const Value.absent(),
    this.syncName = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.nextSync = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<DbSync> custom({
    Expression<int>? uid,
    Expression<String>? syncId,
    Expression<String>? syncName,
    Expression<String>? lastSync,
    Expression<int>? syncStatus,
    Expression<String>? nextSync,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (syncId != null) 'SyncId': syncId,
      if (syncName != null) 'SyncName': syncName,
      if (lastSync != null) 'LastSync': lastSync,
      if (syncStatus != null) 'SyncStatus': syncStatus,
      if (nextSync != null) 'NextSync': nextSync,
      if (updatedAt != null) 'updatedAt': updatedAt,
    });
  }

  SyncsCompanion copyWith({
    Value<int>? uid,
    Value<String?>? syncId,
    Value<String?>? syncName,
    Value<String?>? lastSync,
    Value<int>? syncStatus,
    Value<String?>? nextSync,
    Value<String?>? updatedAt,
  }) {
    return SyncsCompanion(
      uid: uid ?? this.uid,
      syncId: syncId ?? this.syncId,
      syncName: syncName ?? this.syncName,
      lastSync: lastSync ?? this.lastSync,
      syncStatus: syncStatus ?? this.syncStatus,
      nextSync: nextSync ?? this.nextSync,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (syncId.present) {
      map['SyncId'] = Variable<String>(syncId.value);
    }
    if (syncName.present) {
      map['SyncName'] = Variable<String>(syncName.value);
    }
    if (lastSync.present) {
      map['LastSync'] = Variable<String>(lastSync.value);
    }
    if (syncStatus.present) {
      map['SyncStatus'] = Variable<int>(syncStatus.value);
    }
    if (nextSync.present) {
      map['NextSync'] = Variable<String>(nextSync.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncsCompanion(')
          ..write('uid: $uid, ')
          ..write('syncId: $syncId, ')
          ..write('syncName: $syncName, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('nextSync: $nextSync, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, DbUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'userId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userCodeMeta = const VerificationMeta(
    'userCode',
  );
  @override
  late final GeneratedColumn<String> userCode = GeneratedColumn<String>(
    'userCode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userNameMeta = const VerificationMeta(
    'userName',
  );
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
    'userName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
    'position',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'Status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isLocalSessionActiveMeta =
      const VerificationMeta('isLocalSessionActive');
  @override
  late final GeneratedColumn<bool> isLocalSessionActive = GeneratedColumn<bool>(
    'isLocalSessionActive',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("isLocalSessionActive" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    userId,
    userCode,
    password,
    userName,
    position,
    status,
    lastSync,
    updatedAt,
    isLocalSessionActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbUser> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('userId')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['userId']!, _userIdMeta),
      );
    }
    if (data.containsKey('userCode')) {
      context.handle(
        _userCodeMeta,
        userCode.isAcceptableOrUnknown(data['userCode']!, _userCodeMeta),
      );
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    }
    if (data.containsKey('userName')) {
      context.handle(
        _userNameMeta,
        userName.isAcceptableOrUnknown(data['userName']!, _userNameMeta),
      );
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    }
    if (data.containsKey('Status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['Status']!, _statusMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('isLocalSessionActive')) {
      context.handle(
        _isLocalSessionActiveMeta,
        isLocalSessionActive.isAcceptableOrUnknown(
          data['isLocalSessionActive']!,
          _isLocalSessionActiveMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbUser(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}userId'],
      ),
      userCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}userCode'],
      ),
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      ),
      userName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}userName'],
      ),
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}position'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}Status'],
      )!,
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
      isLocalSessionActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}isLocalSessionActive'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class DbUser extends DataClass implements Insertable<DbUser> {
  final int uid;
  final String? userId;
  final String? userCode;
  final String? password;
  final String? userName;
  final String? position;
  final int status;
  final String? lastSync;
  final String? updatedAt;
  final bool isLocalSessionActive;
  const DbUser({
    required this.uid,
    this.userId,
    this.userCode,
    this.password,
    this.userName,
    this.position,
    required this.status,
    this.lastSync,
    this.updatedAt,
    required this.isLocalSessionActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || userId != null) {
      map['userId'] = Variable<String>(userId);
    }
    if (!nullToAbsent || userCode != null) {
      map['userCode'] = Variable<String>(userCode);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    if (!nullToAbsent || userName != null) {
      map['userName'] = Variable<String>(userName);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<String>(position);
    }
    map['Status'] = Variable<int>(status);
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    map['isLocalSessionActive'] = Variable<bool>(isLocalSessionActive);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      uid: Value(uid),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      userCode: userCode == null && nullToAbsent
          ? const Value.absent()
          : Value(userCode),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      status: Value(status),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isLocalSessionActive: Value(isLocalSessionActive),
    );
  }

  factory DbUser.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbUser(
      uid: serializer.fromJson<int>(json['uid']),
      userId: serializer.fromJson<String?>(json['userId']),
      userCode: serializer.fromJson<String?>(json['userCode']),
      password: serializer.fromJson<String?>(json['password']),
      userName: serializer.fromJson<String?>(json['userName']),
      position: serializer.fromJson<String?>(json['position']),
      status: serializer.fromJson<int>(json['status']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      isLocalSessionActive: serializer.fromJson<bool>(
        json['isLocalSessionActive'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'userId': serializer.toJson<String?>(userId),
      'userCode': serializer.toJson<String?>(userCode),
      'password': serializer.toJson<String?>(password),
      'userName': serializer.toJson<String?>(userName),
      'position': serializer.toJson<String?>(position),
      'status': serializer.toJson<int>(status),
      'lastSync': serializer.toJson<String?>(lastSync),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'isLocalSessionActive': serializer.toJson<bool>(isLocalSessionActive),
    };
  }

  DbUser copyWith({
    int? uid,
    Value<String?> userId = const Value.absent(),
    Value<String?> userCode = const Value.absent(),
    Value<String?> password = const Value.absent(),
    Value<String?> userName = const Value.absent(),
    Value<String?> position = const Value.absent(),
    int? status,
    Value<String?> lastSync = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
    bool? isLocalSessionActive,
  }) => DbUser(
    uid: uid ?? this.uid,
    userId: userId.present ? userId.value : this.userId,
    userCode: userCode.present ? userCode.value : this.userCode,
    password: password.present ? password.value : this.password,
    userName: userName.present ? userName.value : this.userName,
    position: position.present ? position.value : this.position,
    status: status ?? this.status,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    isLocalSessionActive: isLocalSessionActive ?? this.isLocalSessionActive,
  );
  DbUser copyWithCompanion(UsersCompanion data) {
    return DbUser(
      uid: data.uid.present ? data.uid.value : this.uid,
      userId: data.userId.present ? data.userId.value : this.userId,
      userCode: data.userCode.present ? data.userCode.value : this.userCode,
      password: data.password.present ? data.password.value : this.password,
      userName: data.userName.present ? data.userName.value : this.userName,
      position: data.position.present ? data.position.value : this.position,
      status: data.status.present ? data.status.value : this.status,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isLocalSessionActive: data.isLocalSessionActive.present
          ? data.isLocalSessionActive.value
          : this.isLocalSessionActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbUser(')
          ..write('uid: $uid, ')
          ..write('userId: $userId, ')
          ..write('userCode: $userCode, ')
          ..write('password: $password, ')
          ..write('userName: $userName, ')
          ..write('position: $position, ')
          ..write('status: $status, ')
          ..write('lastSync: $lastSync, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isLocalSessionActive: $isLocalSessionActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    userId,
    userCode,
    password,
    userName,
    position,
    status,
    lastSync,
    updatedAt,
    isLocalSessionActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbUser &&
          other.uid == this.uid &&
          other.userId == this.userId &&
          other.userCode == this.userCode &&
          other.password == this.password &&
          other.userName == this.userName &&
          other.position == this.position &&
          other.status == this.status &&
          other.lastSync == this.lastSync &&
          other.updatedAt == this.updatedAt &&
          other.isLocalSessionActive == this.isLocalSessionActive);
}

class UsersCompanion extends UpdateCompanion<DbUser> {
  final Value<int> uid;
  final Value<String?> userId;
  final Value<String?> userCode;
  final Value<String?> password;
  final Value<String?> userName;
  final Value<String?> position;
  final Value<int> status;
  final Value<String?> lastSync;
  final Value<String?> updatedAt;
  final Value<bool> isLocalSessionActive;
  const UsersCompanion({
    this.uid = const Value.absent(),
    this.userId = const Value.absent(),
    this.userCode = const Value.absent(),
    this.password = const Value.absent(),
    this.userName = const Value.absent(),
    this.position = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isLocalSessionActive = const Value.absent(),
  });
  UsersCompanion.insert({
    this.uid = const Value.absent(),
    this.userId = const Value.absent(),
    this.userCode = const Value.absent(),
    this.password = const Value.absent(),
    this.userName = const Value.absent(),
    this.position = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isLocalSessionActive = const Value.absent(),
  });
  static Insertable<DbUser> custom({
    Expression<int>? uid,
    Expression<String>? userId,
    Expression<String>? userCode,
    Expression<String>? password,
    Expression<String>? userName,
    Expression<String>? position,
    Expression<int>? status,
    Expression<String>? lastSync,
    Expression<String>? updatedAt,
    Expression<bool>? isLocalSessionActive,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (userId != null) 'userId': userId,
      if (userCode != null) 'userCode': userCode,
      if (password != null) 'password': password,
      if (userName != null) 'userName': userName,
      if (position != null) 'position': position,
      if (status != null) 'Status': status,
      if (lastSync != null) 'lastSync': lastSync,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (isLocalSessionActive != null)
        'isLocalSessionActive': isLocalSessionActive,
    });
  }

  UsersCompanion copyWith({
    Value<int>? uid,
    Value<String?>? userId,
    Value<String?>? userCode,
    Value<String?>? password,
    Value<String?>? userName,
    Value<String?>? position,
    Value<int>? status,
    Value<String?>? lastSync,
    Value<String?>? updatedAt,
    Value<bool>? isLocalSessionActive,
  }) {
    return UsersCompanion(
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
      userCode: userCode ?? this.userCode,
      password: password ?? this.password,
      userName: userName ?? this.userName,
      position: position ?? this.position,
      status: status ?? this.status,
      lastSync: lastSync ?? this.lastSync,
      updatedAt: updatedAt ?? this.updatedAt,
      isLocalSessionActive: isLocalSessionActive ?? this.isLocalSessionActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (userId.present) {
      map['userId'] = Variable<String>(userId.value);
    }
    if (userCode.present) {
      map['userCode'] = Variable<String>(userCode.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (userName.present) {
      map['userName'] = Variable<String>(userName.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (status.present) {
      map['Status'] = Variable<int>(status.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    if (isLocalSessionActive.present) {
      map['isLocalSessionActive'] = Variable<bool>(isLocalSessionActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('uid: $uid, ')
          ..write('userId: $userId, ')
          ..write('userCode: $userCode, ')
          ..write('password: $password, ')
          ..write('userName: $userName, ')
          ..write('position: $position, ')
          ..write('status: $status, ')
          ..write('lastSync: $lastSync, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isLocalSessionActive: $isLocalSessionActive')
          ..write(')'))
        .toString();
  }
}

class $ImagesTable extends Images with TableInfo<$ImagesTable, DbImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _guidMeta = const VerificationMeta('guid');
  @override
  late final GeneratedColumn<String> guid = GeneratedColumn<String>(
    'guid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageIndexMeta = const VerificationMeta(
    'imageIndex',
  );
  @override
  late final GeneratedColumn<String> imageIndex = GeneratedColumn<String>(
    'imageIndex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pictureMeta = const VerificationMeta(
    'picture',
  );
  @override
  late final GeneratedColumn<String> picture = GeneratedColumn<String>(
    'picture',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUriMeta = const VerificationMeta(
    'imageUri',
  );
  @override
  late final GeneratedColumn<String> imageUri = GeneratedColumn<String>(
    'imageUri',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _filenameMeta = const VerificationMeta(
    'filename',
  );
  @override
  late final GeneratedColumn<String> filename = GeneratedColumn<String>(
    'filename',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _filepathMeta = const VerificationMeta(
    'filepath',
  );
  @override
  late final GeneratedColumn<String> filepath = GeneratedColumn<String>(
    'filepath',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'documentId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<String> jobId = GeneratedColumn<String>(
    'jobId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineIdMeta = const VerificationMeta(
    'machineId',
  );
  @override
  late final GeneratedColumn<String> machineId = GeneratedColumn<String>(
    'machineId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tagId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _problemIdMeta = const VerificationMeta(
    'problemId',
  );
  @override
  late final GeneratedColumn<String> problemId = GeneratedColumn<String>(
    'problemId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createDateMeta = const VerificationMeta(
    'createDate',
  );
  @override
  late final GeneratedColumn<String> createDate = GeneratedColumn<String>(
    'createDate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusSyncMeta = const VerificationMeta(
    'statusSync',
  );
  @override
  late final GeneratedColumn<int> statusSync = GeneratedColumn<int>(
    'statusSync',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    guid,
    imageIndex,
    picture,
    imageUri,
    filename,
    filepath,
    documentId,
    jobId,
    machineId,
    tagId,
    problemId,
    createDate,
    status,
    lastSync,
    statusSync,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'images';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbImage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('guid')) {
      context.handle(
        _guidMeta,
        guid.isAcceptableOrUnknown(data['guid']!, _guidMeta),
      );
    }
    if (data.containsKey('imageIndex')) {
      context.handle(
        _imageIndexMeta,
        imageIndex.isAcceptableOrUnknown(data['imageIndex']!, _imageIndexMeta),
      );
    }
    if (data.containsKey('picture')) {
      context.handle(
        _pictureMeta,
        picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta),
      );
    }
    if (data.containsKey('imageUri')) {
      context.handle(
        _imageUriMeta,
        imageUri.isAcceptableOrUnknown(data['imageUri']!, _imageUriMeta),
      );
    }
    if (data.containsKey('filename')) {
      context.handle(
        _filenameMeta,
        filename.isAcceptableOrUnknown(data['filename']!, _filenameMeta),
      );
    }
    if (data.containsKey('filepath')) {
      context.handle(
        _filepathMeta,
        filepath.isAcceptableOrUnknown(data['filepath']!, _filepathMeta),
      );
    }
    if (data.containsKey('documentId')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['documentId']!, _documentIdMeta),
      );
    }
    if (data.containsKey('jobId')) {
      context.handle(
        _jobIdMeta,
        jobId.isAcceptableOrUnknown(data['jobId']!, _jobIdMeta),
      );
    }
    if (data.containsKey('machineId')) {
      context.handle(
        _machineIdMeta,
        machineId.isAcceptableOrUnknown(data['machineId']!, _machineIdMeta),
      );
    }
    if (data.containsKey('tagId')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tagId']!, _tagIdMeta),
      );
    }
    if (data.containsKey('problemId')) {
      context.handle(
        _problemIdMeta,
        problemId.isAcceptableOrUnknown(data['problemId']!, _problemIdMeta),
      );
    }
    if (data.containsKey('createDate')) {
      context.handle(
        _createDateMeta,
        createDate.isAcceptableOrUnknown(data['createDate']!, _createDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('statusSync')) {
      context.handle(
        _statusSyncMeta,
        statusSync.isAcceptableOrUnknown(data['statusSync']!, _statusSyncMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbImage(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      guid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guid'],
      ),
      imageIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}imageIndex'],
      ),
      picture: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}picture'],
      ),
      imageUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}imageUri'],
      ),
      filename: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filename'],
      ),
      filepath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filepath'],
      ),
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentId'],
      ),
      jobId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jobId'],
      ),
      machineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}machineId'],
      ),
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagId'],
      ),
      problemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}problemId'],
      ),
      createDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}createDate'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      statusSync: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}statusSync'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
    );
  }

  @override
  $ImagesTable createAlias(String alias) {
    return $ImagesTable(attachedDatabase, alias);
  }
}

class DbImage extends DataClass implements Insertable<DbImage> {
  final int uid;
  final String? guid;
  final String? imageIndex;
  final String? picture;
  final String? imageUri;
  final String? filename;
  final String? filepath;
  final String? documentId;
  final String? jobId;
  final String? machineId;
  final String? tagId;
  final String? problemId;
  final String? createDate;
  final int status;
  final String? lastSync;
  final int statusSync;
  final String? updatedAt;
  const DbImage({
    required this.uid,
    this.guid,
    this.imageIndex,
    this.picture,
    this.imageUri,
    this.filename,
    this.filepath,
    this.documentId,
    this.jobId,
    this.machineId,
    this.tagId,
    this.problemId,
    this.createDate,
    required this.status,
    this.lastSync,
    required this.statusSync,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || guid != null) {
      map['guid'] = Variable<String>(guid);
    }
    if (!nullToAbsent || imageIndex != null) {
      map['imageIndex'] = Variable<String>(imageIndex);
    }
    if (!nullToAbsent || picture != null) {
      map['picture'] = Variable<String>(picture);
    }
    if (!nullToAbsent || imageUri != null) {
      map['imageUri'] = Variable<String>(imageUri);
    }
    if (!nullToAbsent || filename != null) {
      map['filename'] = Variable<String>(filename);
    }
    if (!nullToAbsent || filepath != null) {
      map['filepath'] = Variable<String>(filepath);
    }
    if (!nullToAbsent || documentId != null) {
      map['documentId'] = Variable<String>(documentId);
    }
    if (!nullToAbsent || jobId != null) {
      map['jobId'] = Variable<String>(jobId);
    }
    if (!nullToAbsent || machineId != null) {
      map['machineId'] = Variable<String>(machineId);
    }
    if (!nullToAbsent || tagId != null) {
      map['tagId'] = Variable<String>(tagId);
    }
    if (!nullToAbsent || problemId != null) {
      map['problemId'] = Variable<String>(problemId);
    }
    if (!nullToAbsent || createDate != null) {
      map['createDate'] = Variable<String>(createDate);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    map['statusSync'] = Variable<int>(statusSync);
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    return map;
  }

  ImagesCompanion toCompanion(bool nullToAbsent) {
    return ImagesCompanion(
      uid: Value(uid),
      guid: guid == null && nullToAbsent ? const Value.absent() : Value(guid),
      imageIndex: imageIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(imageIndex),
      picture: picture == null && nullToAbsent
          ? const Value.absent()
          : Value(picture),
      imageUri: imageUri == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUri),
      filename: filename == null && nullToAbsent
          ? const Value.absent()
          : Value(filename),
      filepath: filepath == null && nullToAbsent
          ? const Value.absent()
          : Value(filepath),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      jobId: jobId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobId),
      machineId: machineId == null && nullToAbsent
          ? const Value.absent()
          : Value(machineId),
      tagId: tagId == null && nullToAbsent
          ? const Value.absent()
          : Value(tagId),
      problemId: problemId == null && nullToAbsent
          ? const Value.absent()
          : Value(problemId),
      createDate: createDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createDate),
      status: Value(status),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      statusSync: Value(statusSync),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbImage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbImage(
      uid: serializer.fromJson<int>(json['uid']),
      guid: serializer.fromJson<String?>(json['guid']),
      imageIndex: serializer.fromJson<String?>(json['imageIndex']),
      picture: serializer.fromJson<String?>(json['picture']),
      imageUri: serializer.fromJson<String?>(json['imageUri']),
      filename: serializer.fromJson<String?>(json['filename']),
      filepath: serializer.fromJson<String?>(json['filepath']),
      documentId: serializer.fromJson<String?>(json['documentId']),
      jobId: serializer.fromJson<String?>(json['jobId']),
      machineId: serializer.fromJson<String?>(json['machineId']),
      tagId: serializer.fromJson<String?>(json['tagId']),
      problemId: serializer.fromJson<String?>(json['problemId']),
      createDate: serializer.fromJson<String?>(json['createDate']),
      status: serializer.fromJson<int>(json['status']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      statusSync: serializer.fromJson<int>(json['statusSync']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'guid': serializer.toJson<String?>(guid),
      'imageIndex': serializer.toJson<String?>(imageIndex),
      'picture': serializer.toJson<String?>(picture),
      'imageUri': serializer.toJson<String?>(imageUri),
      'filename': serializer.toJson<String?>(filename),
      'filepath': serializer.toJson<String?>(filepath),
      'documentId': serializer.toJson<String?>(documentId),
      'jobId': serializer.toJson<String?>(jobId),
      'machineId': serializer.toJson<String?>(machineId),
      'tagId': serializer.toJson<String?>(tagId),
      'problemId': serializer.toJson<String?>(problemId),
      'createDate': serializer.toJson<String?>(createDate),
      'status': serializer.toJson<int>(status),
      'lastSync': serializer.toJson<String?>(lastSync),
      'statusSync': serializer.toJson<int>(statusSync),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  DbImage copyWith({
    int? uid,
    Value<String?> guid = const Value.absent(),
    Value<String?> imageIndex = const Value.absent(),
    Value<String?> picture = const Value.absent(),
    Value<String?> imageUri = const Value.absent(),
    Value<String?> filename = const Value.absent(),
    Value<String?> filepath = const Value.absent(),
    Value<String?> documentId = const Value.absent(),
    Value<String?> jobId = const Value.absent(),
    Value<String?> machineId = const Value.absent(),
    Value<String?> tagId = const Value.absent(),
    Value<String?> problemId = const Value.absent(),
    Value<String?> createDate = const Value.absent(),
    int? status,
    Value<String?> lastSync = const Value.absent(),
    int? statusSync,
    Value<String?> updatedAt = const Value.absent(),
  }) => DbImage(
    uid: uid ?? this.uid,
    guid: guid.present ? guid.value : this.guid,
    imageIndex: imageIndex.present ? imageIndex.value : this.imageIndex,
    picture: picture.present ? picture.value : this.picture,
    imageUri: imageUri.present ? imageUri.value : this.imageUri,
    filename: filename.present ? filename.value : this.filename,
    filepath: filepath.present ? filepath.value : this.filepath,
    documentId: documentId.present ? documentId.value : this.documentId,
    jobId: jobId.present ? jobId.value : this.jobId,
    machineId: machineId.present ? machineId.value : this.machineId,
    tagId: tagId.present ? tagId.value : this.tagId,
    problemId: problemId.present ? problemId.value : this.problemId,
    createDate: createDate.present ? createDate.value : this.createDate,
    status: status ?? this.status,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    statusSync: statusSync ?? this.statusSync,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbImage copyWithCompanion(ImagesCompanion data) {
    return DbImage(
      uid: data.uid.present ? data.uid.value : this.uid,
      guid: data.guid.present ? data.guid.value : this.guid,
      imageIndex: data.imageIndex.present
          ? data.imageIndex.value
          : this.imageIndex,
      picture: data.picture.present ? data.picture.value : this.picture,
      imageUri: data.imageUri.present ? data.imageUri.value : this.imageUri,
      filename: data.filename.present ? data.filename.value : this.filename,
      filepath: data.filepath.present ? data.filepath.value : this.filepath,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      machineId: data.machineId.present ? data.machineId.value : this.machineId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
      problemId: data.problemId.present ? data.problemId.value : this.problemId,
      createDate: data.createDate.present
          ? data.createDate.value
          : this.createDate,
      status: data.status.present ? data.status.value : this.status,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      statusSync: data.statusSync.present
          ? data.statusSync.value
          : this.statusSync,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbImage(')
          ..write('uid: $uid, ')
          ..write('guid: $guid, ')
          ..write('imageIndex: $imageIndex, ')
          ..write('picture: $picture, ')
          ..write('imageUri: $imageUri, ')
          ..write('filename: $filename, ')
          ..write('filepath: $filepath, ')
          ..write('documentId: $documentId, ')
          ..write('jobId: $jobId, ')
          ..write('machineId: $machineId, ')
          ..write('tagId: $tagId, ')
          ..write('problemId: $problemId, ')
          ..write('createDate: $createDate, ')
          ..write('status: $status, ')
          ..write('lastSync: $lastSync, ')
          ..write('statusSync: $statusSync, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    guid,
    imageIndex,
    picture,
    imageUri,
    filename,
    filepath,
    documentId,
    jobId,
    machineId,
    tagId,
    problemId,
    createDate,
    status,
    lastSync,
    statusSync,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbImage &&
          other.uid == this.uid &&
          other.guid == this.guid &&
          other.imageIndex == this.imageIndex &&
          other.picture == this.picture &&
          other.imageUri == this.imageUri &&
          other.filename == this.filename &&
          other.filepath == this.filepath &&
          other.documentId == this.documentId &&
          other.jobId == this.jobId &&
          other.machineId == this.machineId &&
          other.tagId == this.tagId &&
          other.problemId == this.problemId &&
          other.createDate == this.createDate &&
          other.status == this.status &&
          other.lastSync == this.lastSync &&
          other.statusSync == this.statusSync &&
          other.updatedAt == this.updatedAt);
}

class ImagesCompanion extends UpdateCompanion<DbImage> {
  final Value<int> uid;
  final Value<String?> guid;
  final Value<String?> imageIndex;
  final Value<String?> picture;
  final Value<String?> imageUri;
  final Value<String?> filename;
  final Value<String?> filepath;
  final Value<String?> documentId;
  final Value<String?> jobId;
  final Value<String?> machineId;
  final Value<String?> tagId;
  final Value<String?> problemId;
  final Value<String?> createDate;
  final Value<int> status;
  final Value<String?> lastSync;
  final Value<int> statusSync;
  final Value<String?> updatedAt;
  const ImagesCompanion({
    this.uid = const Value.absent(),
    this.guid = const Value.absent(),
    this.imageIndex = const Value.absent(),
    this.picture = const Value.absent(),
    this.imageUri = const Value.absent(),
    this.filename = const Value.absent(),
    this.filepath = const Value.absent(),
    this.documentId = const Value.absent(),
    this.jobId = const Value.absent(),
    this.machineId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.problemId = const Value.absent(),
    this.createDate = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.statusSync = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ImagesCompanion.insert({
    this.uid = const Value.absent(),
    this.guid = const Value.absent(),
    this.imageIndex = const Value.absent(),
    this.picture = const Value.absent(),
    this.imageUri = const Value.absent(),
    this.filename = const Value.absent(),
    this.filepath = const Value.absent(),
    this.documentId = const Value.absent(),
    this.jobId = const Value.absent(),
    this.machineId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.problemId = const Value.absent(),
    this.createDate = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.statusSync = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<DbImage> custom({
    Expression<int>? uid,
    Expression<String>? guid,
    Expression<String>? imageIndex,
    Expression<String>? picture,
    Expression<String>? imageUri,
    Expression<String>? filename,
    Expression<String>? filepath,
    Expression<String>? documentId,
    Expression<String>? jobId,
    Expression<String>? machineId,
    Expression<String>? tagId,
    Expression<String>? problemId,
    Expression<String>? createDate,
    Expression<int>? status,
    Expression<String>? lastSync,
    Expression<int>? statusSync,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (guid != null) 'guid': guid,
      if (imageIndex != null) 'imageIndex': imageIndex,
      if (picture != null) 'picture': picture,
      if (imageUri != null) 'imageUri': imageUri,
      if (filename != null) 'filename': filename,
      if (filepath != null) 'filepath': filepath,
      if (documentId != null) 'documentId': documentId,
      if (jobId != null) 'jobId': jobId,
      if (machineId != null) 'machineId': machineId,
      if (tagId != null) 'tagId': tagId,
      if (problemId != null) 'problemId': problemId,
      if (createDate != null) 'createDate': createDate,
      if (status != null) 'status': status,
      if (lastSync != null) 'lastSync': lastSync,
      if (statusSync != null) 'statusSync': statusSync,
      if (updatedAt != null) 'updatedAt': updatedAt,
    });
  }

  ImagesCompanion copyWith({
    Value<int>? uid,
    Value<String?>? guid,
    Value<String?>? imageIndex,
    Value<String?>? picture,
    Value<String?>? imageUri,
    Value<String?>? filename,
    Value<String?>? filepath,
    Value<String?>? documentId,
    Value<String?>? jobId,
    Value<String?>? machineId,
    Value<String?>? tagId,
    Value<String?>? problemId,
    Value<String?>? createDate,
    Value<int>? status,
    Value<String?>? lastSync,
    Value<int>? statusSync,
    Value<String?>? updatedAt,
  }) {
    return ImagesCompanion(
      uid: uid ?? this.uid,
      guid: guid ?? this.guid,
      imageIndex: imageIndex ?? this.imageIndex,
      picture: picture ?? this.picture,
      imageUri: imageUri ?? this.imageUri,
      filename: filename ?? this.filename,
      filepath: filepath ?? this.filepath,
      documentId: documentId ?? this.documentId,
      jobId: jobId ?? this.jobId,
      machineId: machineId ?? this.machineId,
      tagId: tagId ?? this.tagId,
      problemId: problemId ?? this.problemId,
      createDate: createDate ?? this.createDate,
      status: status ?? this.status,
      lastSync: lastSync ?? this.lastSync,
      statusSync: statusSync ?? this.statusSync,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (imageIndex.present) {
      map['imageIndex'] = Variable<String>(imageIndex.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String>(picture.value);
    }
    if (imageUri.present) {
      map['imageUri'] = Variable<String>(imageUri.value);
    }
    if (filename.present) {
      map['filename'] = Variable<String>(filename.value);
    }
    if (filepath.present) {
      map['filepath'] = Variable<String>(filepath.value);
    }
    if (documentId.present) {
      map['documentId'] = Variable<String>(documentId.value);
    }
    if (jobId.present) {
      map['jobId'] = Variable<String>(jobId.value);
    }
    if (machineId.present) {
      map['machineId'] = Variable<String>(machineId.value);
    }
    if (tagId.present) {
      map['tagId'] = Variable<String>(tagId.value);
    }
    if (problemId.present) {
      map['problemId'] = Variable<String>(problemId.value);
    }
    if (createDate.present) {
      map['createDate'] = Variable<String>(createDate.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (statusSync.present) {
      map['statusSync'] = Variable<int>(statusSync.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImagesCompanion(')
          ..write('uid: $uid, ')
          ..write('guid: $guid, ')
          ..write('imageIndex: $imageIndex, ')
          ..write('picture: $picture, ')
          ..write('imageUri: $imageUri, ')
          ..write('filename: $filename, ')
          ..write('filepath: $filepath, ')
          ..write('documentId: $documentId, ')
          ..write('jobId: $jobId, ')
          ..write('machineId: $machineId, ')
          ..write('tagId: $tagId, ')
          ..write('problemId: $problemId, ')
          ..write('createDate: $createDate, ')
          ..write('status: $status, ')
          ..write('lastSync: $lastSync, ')
          ..write('statusSync: $statusSync, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CheckSheetMasterImagesTable extends CheckSheetMasterImages
    with TableInfo<$CheckSheetMasterImagesTable, DbCheckSheetMasterImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckSheetMasterImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineIdMeta = const VerificationMeta(
    'machineId',
  );
  @override
  late final GeneratedColumn<int> machineId = GeneratedColumn<int>(
    'machineId',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<int> jobId = GeneratedColumn<int>(
    'jobId',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
    'tagId',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createDateMeta = const VerificationMeta(
    'createDate',
  );
  @override
  late final GeneratedColumn<DateTime> createDate = GeneratedColumn<DateTime>(
    'createDate',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createByMeta = const VerificationMeta(
    'createBy',
  );
  @override
  late final GeneratedColumn<String> createBy = GeneratedColumn<String>(
    'createBy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<DateTime> lastSync = GeneratedColumn<DateTime>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'syncStatus',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _newImageMeta = const VerificationMeta(
    'newImage',
  );
  @override
  late final GeneratedColumn<int> newImage = GeneratedColumn<int>(
    'newImage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    machineId,
    jobId,
    tagId,
    path,
    status,
    createDate,
    createBy,
    lastSync,
    syncStatus,
    updatedAt,
    newImage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checksheet_master_images';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbCheckSheetMasterImage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('machineId')) {
      context.handle(
        _machineIdMeta,
        machineId.isAcceptableOrUnknown(data['machineId']!, _machineIdMeta),
      );
    }
    if (data.containsKey('jobId')) {
      context.handle(
        _jobIdMeta,
        jobId.isAcceptableOrUnknown(data['jobId']!, _jobIdMeta),
      );
    }
    if (data.containsKey('tagId')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tagId']!, _tagIdMeta),
      );
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('createDate')) {
      context.handle(
        _createDateMeta,
        createDate.isAcceptableOrUnknown(data['createDate']!, _createDateMeta),
      );
    }
    if (data.containsKey('createBy')) {
      context.handle(
        _createByMeta,
        createBy.isAcceptableOrUnknown(data['createBy']!, _createByMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('syncStatus')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['syncStatus']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('newImage')) {
      context.handle(
        _newImageMeta,
        newImage.isAcceptableOrUnknown(data['newImage']!, _newImageMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbCheckSheetMasterImage map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbCheckSheetMasterImage(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      machineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}machineId'],
      ),
      jobId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jobId'],
      ),
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tagId'],
      ),
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      ),
      createDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}createDate'],
      ),
      createBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}createBy'],
      ),
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}lastSync'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}syncStatus'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
      newImage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}newImage'],
      )!,
    );
  }

  @override
  $CheckSheetMasterImagesTable createAlias(String alias) {
    return $CheckSheetMasterImagesTable(attachedDatabase, alias);
  }
}

class DbCheckSheetMasterImage extends DataClass
    implements Insertable<DbCheckSheetMasterImage> {
  final int id;
  final int? machineId;
  final int? jobId;
  final int? tagId;
  final String? path;
  final int? status;
  final DateTime? createDate;
  final String? createBy;
  final DateTime? lastSync;
  final int? syncStatus;
  final String? updatedAt;
  final int newImage;
  const DbCheckSheetMasterImage({
    required this.id,
    this.machineId,
    this.jobId,
    this.tagId,
    this.path,
    this.status,
    this.createDate,
    this.createBy,
    this.lastSync,
    this.syncStatus,
    this.updatedAt,
    required this.newImage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || machineId != null) {
      map['machineId'] = Variable<int>(machineId);
    }
    if (!nullToAbsent || jobId != null) {
      map['jobId'] = Variable<int>(jobId);
    }
    if (!nullToAbsent || tagId != null) {
      map['tagId'] = Variable<int>(tagId);
    }
    if (!nullToAbsent || path != null) {
      map['path'] = Variable<String>(path);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || createDate != null) {
      map['createDate'] = Variable<DateTime>(createDate);
    }
    if (!nullToAbsent || createBy != null) {
      map['createBy'] = Variable<String>(createBy);
    }
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<DateTime>(lastSync);
    }
    if (!nullToAbsent || syncStatus != null) {
      map['syncStatus'] = Variable<int>(syncStatus);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    map['newImage'] = Variable<int>(newImage);
    return map;
  }

  CheckSheetMasterImagesCompanion toCompanion(bool nullToAbsent) {
    return CheckSheetMasterImagesCompanion(
      id: Value(id),
      machineId: machineId == null && nullToAbsent
          ? const Value.absent()
          : Value(machineId),
      jobId: jobId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobId),
      tagId: tagId == null && nullToAbsent
          ? const Value.absent()
          : Value(tagId),
      path: path == null && nullToAbsent ? const Value.absent() : Value(path),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      createDate: createDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createDate),
      createBy: createBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createBy),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      syncStatus: syncStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(syncStatus),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      newImage: Value(newImage),
    );
  }

  factory DbCheckSheetMasterImage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbCheckSheetMasterImage(
      id: serializer.fromJson<int>(json['id']),
      machineId: serializer.fromJson<int?>(json['machineId']),
      jobId: serializer.fromJson<int?>(json['jobId']),
      tagId: serializer.fromJson<int?>(json['tagId']),
      path: serializer.fromJson<String?>(json['path']),
      status: serializer.fromJson<int?>(json['status']),
      createDate: serializer.fromJson<DateTime?>(json['createDate']),
      createBy: serializer.fromJson<String?>(json['createBy']),
      lastSync: serializer.fromJson<DateTime?>(json['lastSync']),
      syncStatus: serializer.fromJson<int?>(json['syncStatus']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      newImage: serializer.fromJson<int>(json['newImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'machineId': serializer.toJson<int?>(machineId),
      'jobId': serializer.toJson<int?>(jobId),
      'tagId': serializer.toJson<int?>(tagId),
      'path': serializer.toJson<String?>(path),
      'status': serializer.toJson<int?>(status),
      'createDate': serializer.toJson<DateTime?>(createDate),
      'createBy': serializer.toJson<String?>(createBy),
      'lastSync': serializer.toJson<DateTime?>(lastSync),
      'syncStatus': serializer.toJson<int?>(syncStatus),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'newImage': serializer.toJson<int>(newImage),
    };
  }

  DbCheckSheetMasterImage copyWith({
    int? id,
    Value<int?> machineId = const Value.absent(),
    Value<int?> jobId = const Value.absent(),
    Value<int?> tagId = const Value.absent(),
    Value<String?> path = const Value.absent(),
    Value<int?> status = const Value.absent(),
    Value<DateTime?> createDate = const Value.absent(),
    Value<String?> createBy = const Value.absent(),
    Value<DateTime?> lastSync = const Value.absent(),
    Value<int?> syncStatus = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
    int? newImage,
  }) => DbCheckSheetMasterImage(
    id: id ?? this.id,
    machineId: machineId.present ? machineId.value : this.machineId,
    jobId: jobId.present ? jobId.value : this.jobId,
    tagId: tagId.present ? tagId.value : this.tagId,
    path: path.present ? path.value : this.path,
    status: status.present ? status.value : this.status,
    createDate: createDate.present ? createDate.value : this.createDate,
    createBy: createBy.present ? createBy.value : this.createBy,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    syncStatus: syncStatus.present ? syncStatus.value : this.syncStatus,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    newImage: newImage ?? this.newImage,
  );
  DbCheckSheetMasterImage copyWithCompanion(
    CheckSheetMasterImagesCompanion data,
  ) {
    return DbCheckSheetMasterImage(
      id: data.id.present ? data.id.value : this.id,
      machineId: data.machineId.present ? data.machineId.value : this.machineId,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
      path: data.path.present ? data.path.value : this.path,
      status: data.status.present ? data.status.value : this.status,
      createDate: data.createDate.present
          ? data.createDate.value
          : this.createDate,
      createBy: data.createBy.present ? data.createBy.value : this.createBy,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      newImage: data.newImage.present ? data.newImage.value : this.newImage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbCheckSheetMasterImage(')
          ..write('id: $id, ')
          ..write('machineId: $machineId, ')
          ..write('jobId: $jobId, ')
          ..write('tagId: $tagId, ')
          ..write('path: $path, ')
          ..write('status: $status, ')
          ..write('createDate: $createDate, ')
          ..write('createBy: $createBy, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('newImage: $newImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    machineId,
    jobId,
    tagId,
    path,
    status,
    createDate,
    createBy,
    lastSync,
    syncStatus,
    updatedAt,
    newImage,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbCheckSheetMasterImage &&
          other.id == this.id &&
          other.machineId == this.machineId &&
          other.jobId == this.jobId &&
          other.tagId == this.tagId &&
          other.path == this.path &&
          other.status == this.status &&
          other.createDate == this.createDate &&
          other.createBy == this.createBy &&
          other.lastSync == this.lastSync &&
          other.syncStatus == this.syncStatus &&
          other.updatedAt == this.updatedAt &&
          other.newImage == this.newImage);
}

class CheckSheetMasterImagesCompanion
    extends UpdateCompanion<DbCheckSheetMasterImage> {
  final Value<int> id;
  final Value<int?> machineId;
  final Value<int?> jobId;
  final Value<int?> tagId;
  final Value<String?> path;
  final Value<int?> status;
  final Value<DateTime?> createDate;
  final Value<String?> createBy;
  final Value<DateTime?> lastSync;
  final Value<int?> syncStatus;
  final Value<String?> updatedAt;
  final Value<int> newImage;
  const CheckSheetMasterImagesCompanion({
    this.id = const Value.absent(),
    this.machineId = const Value.absent(),
    this.jobId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.path = const Value.absent(),
    this.status = const Value.absent(),
    this.createDate = const Value.absent(),
    this.createBy = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.newImage = const Value.absent(),
  });
  CheckSheetMasterImagesCompanion.insert({
    this.id = const Value.absent(),
    this.machineId = const Value.absent(),
    this.jobId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.path = const Value.absent(),
    this.status = const Value.absent(),
    this.createDate = const Value.absent(),
    this.createBy = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.newImage = const Value.absent(),
  });
  static Insertable<DbCheckSheetMasterImage> custom({
    Expression<int>? id,
    Expression<int>? machineId,
    Expression<int>? jobId,
    Expression<int>? tagId,
    Expression<String>? path,
    Expression<int>? status,
    Expression<DateTime>? createDate,
    Expression<String>? createBy,
    Expression<DateTime>? lastSync,
    Expression<int>? syncStatus,
    Expression<String>? updatedAt,
    Expression<int>? newImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (machineId != null) 'machineId': machineId,
      if (jobId != null) 'jobId': jobId,
      if (tagId != null) 'tagId': tagId,
      if (path != null) 'path': path,
      if (status != null) 'status': status,
      if (createDate != null) 'createDate': createDate,
      if (createBy != null) 'createBy': createBy,
      if (lastSync != null) 'lastSync': lastSync,
      if (syncStatus != null) 'syncStatus': syncStatus,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (newImage != null) 'newImage': newImage,
    });
  }

  CheckSheetMasterImagesCompanion copyWith({
    Value<int>? id,
    Value<int?>? machineId,
    Value<int?>? jobId,
    Value<int?>? tagId,
    Value<String?>? path,
    Value<int?>? status,
    Value<DateTime?>? createDate,
    Value<String?>? createBy,
    Value<DateTime?>? lastSync,
    Value<int?>? syncStatus,
    Value<String?>? updatedAt,
    Value<int>? newImage,
  }) {
    return CheckSheetMasterImagesCompanion(
      id: id ?? this.id,
      machineId: machineId ?? this.machineId,
      jobId: jobId ?? this.jobId,
      tagId: tagId ?? this.tagId,
      path: path ?? this.path,
      status: status ?? this.status,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      lastSync: lastSync ?? this.lastSync,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      newImage: newImage ?? this.newImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (machineId.present) {
      map['machineId'] = Variable<int>(machineId.value);
    }
    if (jobId.present) {
      map['jobId'] = Variable<int>(jobId.value);
    }
    if (tagId.present) {
      map['tagId'] = Variable<int>(tagId.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (createDate.present) {
      map['createDate'] = Variable<DateTime>(createDate.value);
    }
    if (createBy.present) {
      map['createBy'] = Variable<String>(createBy.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<DateTime>(lastSync.value);
    }
    if (syncStatus.present) {
      map['syncStatus'] = Variable<int>(syncStatus.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    if (newImage.present) {
      map['newImage'] = Variable<int>(newImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckSheetMasterImagesCompanion(')
          ..write('id: $id, ')
          ..write('machineId: $machineId, ')
          ..write('jobId: $jobId, ')
          ..write('tagId: $tagId, ')
          ..write('path: $path, ')
          ..write('status: $status, ')
          ..write('createDate: $createDate, ')
          ..write('createBy: $createBy, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('newImage: $newImage')
          ..write(')'))
        .toString();
  }
}

class $DocumentTimeLogsTable extends DocumentTimeLogs
    with TableInfo<$DocumentTimeLogsTable, DbDocumentTimeLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentTimeLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'documentId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logTypeMeta = const VerificationMeta(
    'logType',
  );
  @override
  late final GeneratedColumn<int> logType = GeneratedColumn<int>(
    'logType',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _logTimeMeta = const VerificationMeta(
    'logTime',
  );
  @override
  late final GeneratedColumn<String> logTime = GeneratedColumn<String>(
    'logTime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    documentId,
    logType,
    logTime,
    remark,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_time_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbDocumentTimeLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('documentId')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['documentId']!, _documentIdMeta),
      );
    }
    if (data.containsKey('logType')) {
      context.handle(
        _logTypeMeta,
        logType.isAcceptableOrUnknown(data['logType']!, _logTypeMeta),
      );
    }
    if (data.containsKey('logTime')) {
      context.handle(
        _logTimeMeta,
        logTime.isAcceptableOrUnknown(data['logTime']!, _logTimeMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbDocumentTimeLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbDocumentTimeLog(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentId'],
      ),
      logType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}logType'],
      )!,
      logTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logTime'],
      ),
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
    );
  }

  @override
  $DocumentTimeLogsTable createAlias(String alias) {
    return $DocumentTimeLogsTable(attachedDatabase, alias);
  }
}

class DbDocumentTimeLog extends DataClass
    implements Insertable<DbDocumentTimeLog> {
  final int uid;
  final String? documentId;
  final int logType;
  final String? logTime;
  final String? remark;
  const DbDocumentTimeLog({
    required this.uid,
    this.documentId,
    required this.logType,
    this.logTime,
    this.remark,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || documentId != null) {
      map['documentId'] = Variable<String>(documentId);
    }
    map['logType'] = Variable<int>(logType);
    if (!nullToAbsent || logTime != null) {
      map['logTime'] = Variable<String>(logTime);
    }
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    return map;
  }

  DocumentTimeLogsCompanion toCompanion(bool nullToAbsent) {
    return DocumentTimeLogsCompanion(
      uid: Value(uid),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      logType: Value(logType),
      logTime: logTime == null && nullToAbsent
          ? const Value.absent()
          : Value(logTime),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
    );
  }

  factory DbDocumentTimeLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbDocumentTimeLog(
      uid: serializer.fromJson<int>(json['uid']),
      documentId: serializer.fromJson<String?>(json['documentId']),
      logType: serializer.fromJson<int>(json['logType']),
      logTime: serializer.fromJson<String?>(json['logTime']),
      remark: serializer.fromJson<String?>(json['remark']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'documentId': serializer.toJson<String?>(documentId),
      'logType': serializer.toJson<int>(logType),
      'logTime': serializer.toJson<String?>(logTime),
      'remark': serializer.toJson<String?>(remark),
    };
  }

  DbDocumentTimeLog copyWith({
    int? uid,
    Value<String?> documentId = const Value.absent(),
    int? logType,
    Value<String?> logTime = const Value.absent(),
    Value<String?> remark = const Value.absent(),
  }) => DbDocumentTimeLog(
    uid: uid ?? this.uid,
    documentId: documentId.present ? documentId.value : this.documentId,
    logType: logType ?? this.logType,
    logTime: logTime.present ? logTime.value : this.logTime,
    remark: remark.present ? remark.value : this.remark,
  );
  DbDocumentTimeLog copyWithCompanion(DocumentTimeLogsCompanion data) {
    return DbDocumentTimeLog(
      uid: data.uid.present ? data.uid.value : this.uid,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      logType: data.logType.present ? data.logType.value : this.logType,
      logTime: data.logTime.present ? data.logTime.value : this.logTime,
      remark: data.remark.present ? data.remark.value : this.remark,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbDocumentTimeLog(')
          ..write('uid: $uid, ')
          ..write('documentId: $documentId, ')
          ..write('logType: $logType, ')
          ..write('logTime: $logTime, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, documentId, logType, logTime, remark);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbDocumentTimeLog &&
          other.uid == this.uid &&
          other.documentId == this.documentId &&
          other.logType == this.logType &&
          other.logTime == this.logTime &&
          other.remark == this.remark);
}

class DocumentTimeLogsCompanion extends UpdateCompanion<DbDocumentTimeLog> {
  final Value<int> uid;
  final Value<String?> documentId;
  final Value<int> logType;
  final Value<String?> logTime;
  final Value<String?> remark;
  const DocumentTimeLogsCompanion({
    this.uid = const Value.absent(),
    this.documentId = const Value.absent(),
    this.logType = const Value.absent(),
    this.logTime = const Value.absent(),
    this.remark = const Value.absent(),
  });
  DocumentTimeLogsCompanion.insert({
    this.uid = const Value.absent(),
    this.documentId = const Value.absent(),
    this.logType = const Value.absent(),
    this.logTime = const Value.absent(),
    this.remark = const Value.absent(),
  });
  static Insertable<DbDocumentTimeLog> custom({
    Expression<int>? uid,
    Expression<String>? documentId,
    Expression<int>? logType,
    Expression<String>? logTime,
    Expression<String>? remark,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (documentId != null) 'documentId': documentId,
      if (logType != null) 'logType': logType,
      if (logTime != null) 'logTime': logTime,
      if (remark != null) 'remark': remark,
    });
  }

  DocumentTimeLogsCompanion copyWith({
    Value<int>? uid,
    Value<String?>? documentId,
    Value<int>? logType,
    Value<String?>? logTime,
    Value<String?>? remark,
  }) {
    return DocumentTimeLogsCompanion(
      uid: uid ?? this.uid,
      documentId: documentId ?? this.documentId,
      logType: logType ?? this.logType,
      logTime: logTime ?? this.logTime,
      remark: remark ?? this.remark,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (documentId.present) {
      map['documentId'] = Variable<String>(documentId.value);
    }
    if (logType.present) {
      map['logType'] = Variable<int>(logType.value);
    }
    if (logTime.present) {
      map['logTime'] = Variable<String>(logTime.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentTimeLogsCompanion(')
          ..write('uid: $uid, ')
          ..write('documentId: $documentId, ')
          ..write('logType: $logType, ')
          ..write('logTime: $logTime, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }
}

class $JobTestSetsTable extends JobTestSets
    with TableInfo<$JobTestSetsTable, DbJobTestSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobTestSetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recIdMeta = const VerificationMeta('recId');
  @override
  late final GeneratedColumn<String> recId = GeneratedColumn<String>(
    'recID',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'documentId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _setItemNoMeta = const VerificationMeta(
    'setItemNo',
  );
  @override
  late final GeneratedColumn<String> setItemNo = GeneratedColumn<String>(
    'setItemNo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registerDateTimeMeta = const VerificationMeta(
    'registerDateTime',
  );
  @override
  late final GeneratedColumn<String> registerDateTime = GeneratedColumn<String>(
    'registerDateTime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registerUserMeta = const VerificationMeta(
    'registerUser',
  );
  @override
  late final GeneratedColumn<String> registerUser = GeneratedColumn<String>(
    'registerUser',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'syncStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    recId,
    documentId,
    setItemNo,
    registerDateTime,
    registerUser,
    status,
    updatedAt,
    lastSync,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_test_sets';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbJobTestSet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('recID')) {
      context.handle(
        _recIdMeta,
        recId.isAcceptableOrUnknown(data['recID']!, _recIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recIdMeta);
    }
    if (data.containsKey('documentId')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['documentId']!, _documentIdMeta),
      );
    }
    if (data.containsKey('setItemNo')) {
      context.handle(
        _setItemNoMeta,
        setItemNo.isAcceptableOrUnknown(data['setItemNo']!, _setItemNoMeta),
      );
    }
    if (data.containsKey('registerDateTime')) {
      context.handle(
        _registerDateTimeMeta,
        registerDateTime.isAcceptableOrUnknown(
          data['registerDateTime']!,
          _registerDateTimeMeta,
        ),
      );
    }
    if (data.containsKey('registerUser')) {
      context.handle(
        _registerUserMeta,
        registerUser.isAcceptableOrUnknown(
          data['registerUser']!,
          _registerUserMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('syncStatus')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['syncStatus']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbJobTestSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbJobTestSet(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      recId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recID'],
      )!,
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentId'],
      ),
      setItemNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}setItemNo'],
      ),
      registerDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registerDateTime'],
      ),
      registerUser: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registerUser'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}syncStatus'],
      )!,
    );
  }

  @override
  $JobTestSetsTable createAlias(String alias) {
    return $JobTestSetsTable(attachedDatabase, alias);
  }
}

class DbJobTestSet extends DataClass implements Insertable<DbJobTestSet> {
  final int uid;
  final String recId;
  final String? documentId;
  final String? setItemNo;
  final String? registerDateTime;
  final String? registerUser;
  final int status;
  final String? updatedAt;
  final String? lastSync;
  final int syncStatus;
  const DbJobTestSet({
    required this.uid,
    required this.recId,
    this.documentId,
    this.setItemNo,
    this.registerDateTime,
    this.registerUser,
    required this.status,
    this.updatedAt,
    this.lastSync,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    map['recID'] = Variable<String>(recId);
    if (!nullToAbsent || documentId != null) {
      map['documentId'] = Variable<String>(documentId);
    }
    if (!nullToAbsent || setItemNo != null) {
      map['setItemNo'] = Variable<String>(setItemNo);
    }
    if (!nullToAbsent || registerDateTime != null) {
      map['registerDateTime'] = Variable<String>(registerDateTime);
    }
    if (!nullToAbsent || registerUser != null) {
      map['registerUser'] = Variable<String>(registerUser);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    map['syncStatus'] = Variable<int>(syncStatus);
    return map;
  }

  JobTestSetsCompanion toCompanion(bool nullToAbsent) {
    return JobTestSetsCompanion(
      uid: Value(uid),
      recId: Value(recId),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      setItemNo: setItemNo == null && nullToAbsent
          ? const Value.absent()
          : Value(setItemNo),
      registerDateTime: registerDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(registerDateTime),
      registerUser: registerUser == null && nullToAbsent
          ? const Value.absent()
          : Value(registerUser),
      status: Value(status),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      syncStatus: Value(syncStatus),
    );
  }

  factory DbJobTestSet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbJobTestSet(
      uid: serializer.fromJson<int>(json['uid']),
      recId: serializer.fromJson<String>(json['recId']),
      documentId: serializer.fromJson<String?>(json['documentId']),
      setItemNo: serializer.fromJson<String?>(json['setItemNo']),
      registerDateTime: serializer.fromJson<String?>(json['registerDateTime']),
      registerUser: serializer.fromJson<String?>(json['registerUser']),
      status: serializer.fromJson<int>(json['status']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'recId': serializer.toJson<String>(recId),
      'documentId': serializer.toJson<String?>(documentId),
      'setItemNo': serializer.toJson<String?>(setItemNo),
      'registerDateTime': serializer.toJson<String?>(registerDateTime),
      'registerUser': serializer.toJson<String?>(registerUser),
      'status': serializer.toJson<int>(status),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'lastSync': serializer.toJson<String?>(lastSync),
      'syncStatus': serializer.toJson<int>(syncStatus),
    };
  }

  DbJobTestSet copyWith({
    int? uid,
    String? recId,
    Value<String?> documentId = const Value.absent(),
    Value<String?> setItemNo = const Value.absent(),
    Value<String?> registerDateTime = const Value.absent(),
    Value<String?> registerUser = const Value.absent(),
    int? status,
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> lastSync = const Value.absent(),
    int? syncStatus,
  }) => DbJobTestSet(
    uid: uid ?? this.uid,
    recId: recId ?? this.recId,
    documentId: documentId.present ? documentId.value : this.documentId,
    setItemNo: setItemNo.present ? setItemNo.value : this.setItemNo,
    registerDateTime: registerDateTime.present
        ? registerDateTime.value
        : this.registerDateTime,
    registerUser: registerUser.present ? registerUser.value : this.registerUser,
    status: status ?? this.status,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  DbJobTestSet copyWithCompanion(JobTestSetsCompanion data) {
    return DbJobTestSet(
      uid: data.uid.present ? data.uid.value : this.uid,
      recId: data.recId.present ? data.recId.value : this.recId,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      setItemNo: data.setItemNo.present ? data.setItemNo.value : this.setItemNo,
      registerDateTime: data.registerDateTime.present
          ? data.registerDateTime.value
          : this.registerDateTime,
      registerUser: data.registerUser.present
          ? data.registerUser.value
          : this.registerUser,
      status: data.status.present ? data.status.value : this.status,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbJobTestSet(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('documentId: $documentId, ')
          ..write('setItemNo: $setItemNo, ')
          ..write('registerDateTime: $registerDateTime, ')
          ..write('registerUser: $registerUser, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    recId,
    documentId,
    setItemNo,
    registerDateTime,
    registerUser,
    status,
    updatedAt,
    lastSync,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbJobTestSet &&
          other.uid == this.uid &&
          other.recId == this.recId &&
          other.documentId == this.documentId &&
          other.setItemNo == this.setItemNo &&
          other.registerDateTime == this.registerDateTime &&
          other.registerUser == this.registerUser &&
          other.status == this.status &&
          other.updatedAt == this.updatedAt &&
          other.lastSync == this.lastSync &&
          other.syncStatus == this.syncStatus);
}

class JobTestSetsCompanion extends UpdateCompanion<DbJobTestSet> {
  final Value<int> uid;
  final Value<String> recId;
  final Value<String?> documentId;
  final Value<String?> setItemNo;
  final Value<String?> registerDateTime;
  final Value<String?> registerUser;
  final Value<int> status;
  final Value<String?> updatedAt;
  final Value<String?> lastSync;
  final Value<int> syncStatus;
  const JobTestSetsCompanion({
    this.uid = const Value.absent(),
    this.recId = const Value.absent(),
    this.documentId = const Value.absent(),
    this.setItemNo = const Value.absent(),
    this.registerDateTime = const Value.absent(),
    this.registerUser = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  JobTestSetsCompanion.insert({
    this.uid = const Value.absent(),
    required String recId,
    this.documentId = const Value.absent(),
    this.setItemNo = const Value.absent(),
    this.registerDateTime = const Value.absent(),
    this.registerUser = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : recId = Value(recId);
  static Insertable<DbJobTestSet> custom({
    Expression<int>? uid,
    Expression<String>? recId,
    Expression<String>? documentId,
    Expression<String>? setItemNo,
    Expression<String>? registerDateTime,
    Expression<String>? registerUser,
    Expression<int>? status,
    Expression<String>? updatedAt,
    Expression<String>? lastSync,
    Expression<int>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (recId != null) 'recID': recId,
      if (documentId != null) 'documentId': documentId,
      if (setItemNo != null) 'setItemNo': setItemNo,
      if (registerDateTime != null) 'registerDateTime': registerDateTime,
      if (registerUser != null) 'registerUser': registerUser,
      if (status != null) 'status': status,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (lastSync != null) 'lastSync': lastSync,
      if (syncStatus != null) 'syncStatus': syncStatus,
    });
  }

  JobTestSetsCompanion copyWith({
    Value<int>? uid,
    Value<String>? recId,
    Value<String?>? documentId,
    Value<String?>? setItemNo,
    Value<String?>? registerDateTime,
    Value<String?>? registerUser,
    Value<int>? status,
    Value<String?>? updatedAt,
    Value<String?>? lastSync,
    Value<int>? syncStatus,
  }) {
    return JobTestSetsCompanion(
      uid: uid ?? this.uid,
      recId: recId ?? this.recId,
      documentId: documentId ?? this.documentId,
      setItemNo: setItemNo ?? this.setItemNo,
      registerDateTime: registerDateTime ?? this.registerDateTime,
      registerUser: registerUser ?? this.registerUser,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSync: lastSync ?? this.lastSync,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (recId.present) {
      map['recID'] = Variable<String>(recId.value);
    }
    if (documentId.present) {
      map['documentId'] = Variable<String>(documentId.value);
    }
    if (setItemNo.present) {
      map['setItemNo'] = Variable<String>(setItemNo.value);
    }
    if (registerDateTime.present) {
      map['registerDateTime'] = Variable<String>(registerDateTime.value);
    }
    if (registerUser.present) {
      map['registerUser'] = Variable<String>(registerUser.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (syncStatus.present) {
      map['syncStatus'] = Variable<int>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobTestSetsCompanion(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('documentId: $documentId, ')
          ..write('setItemNo: $setItemNo, ')
          ..write('registerDateTime: $registerDateTime, ')
          ..write('registerUser: $registerUser, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $RunningJobMachinesTable extends RunningJobMachines
    with TableInfo<$RunningJobMachinesTable, DbRunningJobMachine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RunningJobMachinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recIdMeta = const VerificationMeta('recId');
  @override
  late final GeneratedColumn<String> recId = GeneratedColumn<String>(
    'recID',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'documentId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _machineNoMeta = const VerificationMeta(
    'machineNo',
  );
  @override
  late final GeneratedColumn<String> machineNo = GeneratedColumn<String>(
    'MachineNo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registerDateTimeMeta = const VerificationMeta(
    'registerDateTime',
  );
  @override
  late final GeneratedColumn<String> registerDateTime = GeneratedColumn<String>(
    'registerDateTime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registerUserMeta = const VerificationMeta(
    'registerUser',
  );
  @override
  late final GeneratedColumn<String> registerUser = GeneratedColumn<String>(
    'registerUser',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'syncStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    recId,
    documentId,
    machineNo,
    registerDateTime,
    registerUser,
    status,
    updatedAt,
    lastSync,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'running_job_machines';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbRunningJobMachine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('recID')) {
      context.handle(
        _recIdMeta,
        recId.isAcceptableOrUnknown(data['recID']!, _recIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recIdMeta);
    }
    if (data.containsKey('documentId')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['documentId']!, _documentIdMeta),
      );
    }
    if (data.containsKey('MachineNo')) {
      context.handle(
        _machineNoMeta,
        machineNo.isAcceptableOrUnknown(data['MachineNo']!, _machineNoMeta),
      );
    }
    if (data.containsKey('registerDateTime')) {
      context.handle(
        _registerDateTimeMeta,
        registerDateTime.isAcceptableOrUnknown(
          data['registerDateTime']!,
          _registerDateTimeMeta,
        ),
      );
    }
    if (data.containsKey('registerUser')) {
      context.handle(
        _registerUserMeta,
        registerUser.isAcceptableOrUnknown(
          data['registerUser']!,
          _registerUserMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('syncStatus')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['syncStatus']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbRunningJobMachine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbRunningJobMachine(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      recId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recID'],
      )!,
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentId'],
      ),
      machineNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineNo'],
      ),
      registerDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registerDateTime'],
      ),
      registerUser: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registerUser'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}syncStatus'],
      )!,
    );
  }

  @override
  $RunningJobMachinesTable createAlias(String alias) {
    return $RunningJobMachinesTable(attachedDatabase, alias);
  }
}

class DbRunningJobMachine extends DataClass
    implements Insertable<DbRunningJobMachine> {
  final int uid;
  final String recId;
  final String? documentId;
  final String? machineNo;
  final String? registerDateTime;
  final String? registerUser;
  final int status;
  final String? updatedAt;
  final String? lastSync;
  final int syncStatus;
  const DbRunningJobMachine({
    required this.uid,
    required this.recId,
    this.documentId,
    this.machineNo,
    this.registerDateTime,
    this.registerUser,
    required this.status,
    this.updatedAt,
    this.lastSync,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    map['recID'] = Variable<String>(recId);
    if (!nullToAbsent || documentId != null) {
      map['documentId'] = Variable<String>(documentId);
    }
    if (!nullToAbsent || machineNo != null) {
      map['MachineNo'] = Variable<String>(machineNo);
    }
    if (!nullToAbsent || registerDateTime != null) {
      map['registerDateTime'] = Variable<String>(registerDateTime);
    }
    if (!nullToAbsent || registerUser != null) {
      map['registerUser'] = Variable<String>(registerUser);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    map['syncStatus'] = Variable<int>(syncStatus);
    return map;
  }

  RunningJobMachinesCompanion toCompanion(bool nullToAbsent) {
    return RunningJobMachinesCompanion(
      uid: Value(uid),
      recId: Value(recId),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      machineNo: machineNo == null && nullToAbsent
          ? const Value.absent()
          : Value(machineNo),
      registerDateTime: registerDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(registerDateTime),
      registerUser: registerUser == null && nullToAbsent
          ? const Value.absent()
          : Value(registerUser),
      status: Value(status),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      syncStatus: Value(syncStatus),
    );
  }

  factory DbRunningJobMachine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbRunningJobMachine(
      uid: serializer.fromJson<int>(json['uid']),
      recId: serializer.fromJson<String>(json['recId']),
      documentId: serializer.fromJson<String?>(json['documentId']),
      machineNo: serializer.fromJson<String?>(json['machineNo']),
      registerDateTime: serializer.fromJson<String?>(json['registerDateTime']),
      registerUser: serializer.fromJson<String?>(json['registerUser']),
      status: serializer.fromJson<int>(json['status']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'recId': serializer.toJson<String>(recId),
      'documentId': serializer.toJson<String?>(documentId),
      'machineNo': serializer.toJson<String?>(machineNo),
      'registerDateTime': serializer.toJson<String?>(registerDateTime),
      'registerUser': serializer.toJson<String?>(registerUser),
      'status': serializer.toJson<int>(status),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'lastSync': serializer.toJson<String?>(lastSync),
      'syncStatus': serializer.toJson<int>(syncStatus),
    };
  }

  DbRunningJobMachine copyWith({
    int? uid,
    String? recId,
    Value<String?> documentId = const Value.absent(),
    Value<String?> machineNo = const Value.absent(),
    Value<String?> registerDateTime = const Value.absent(),
    Value<String?> registerUser = const Value.absent(),
    int? status,
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> lastSync = const Value.absent(),
    int? syncStatus,
  }) => DbRunningJobMachine(
    uid: uid ?? this.uid,
    recId: recId ?? this.recId,
    documentId: documentId.present ? documentId.value : this.documentId,
    machineNo: machineNo.present ? machineNo.value : this.machineNo,
    registerDateTime: registerDateTime.present
        ? registerDateTime.value
        : this.registerDateTime,
    registerUser: registerUser.present ? registerUser.value : this.registerUser,
    status: status ?? this.status,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  DbRunningJobMachine copyWithCompanion(RunningJobMachinesCompanion data) {
    return DbRunningJobMachine(
      uid: data.uid.present ? data.uid.value : this.uid,
      recId: data.recId.present ? data.recId.value : this.recId,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      machineNo: data.machineNo.present ? data.machineNo.value : this.machineNo,
      registerDateTime: data.registerDateTime.present
          ? data.registerDateTime.value
          : this.registerDateTime,
      registerUser: data.registerUser.present
          ? data.registerUser.value
          : this.registerUser,
      status: data.status.present ? data.status.value : this.status,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbRunningJobMachine(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('documentId: $documentId, ')
          ..write('machineNo: $machineNo, ')
          ..write('registerDateTime: $registerDateTime, ')
          ..write('registerUser: $registerUser, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    recId,
    documentId,
    machineNo,
    registerDateTime,
    registerUser,
    status,
    updatedAt,
    lastSync,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbRunningJobMachine &&
          other.uid == this.uid &&
          other.recId == this.recId &&
          other.documentId == this.documentId &&
          other.machineNo == this.machineNo &&
          other.registerDateTime == this.registerDateTime &&
          other.registerUser == this.registerUser &&
          other.status == this.status &&
          other.updatedAt == this.updatedAt &&
          other.lastSync == this.lastSync &&
          other.syncStatus == this.syncStatus);
}

class RunningJobMachinesCompanion extends UpdateCompanion<DbRunningJobMachine> {
  final Value<int> uid;
  final Value<String> recId;
  final Value<String?> documentId;
  final Value<String?> machineNo;
  final Value<String?> registerDateTime;
  final Value<String?> registerUser;
  final Value<int> status;
  final Value<String?> updatedAt;
  final Value<String?> lastSync;
  final Value<int> syncStatus;
  const RunningJobMachinesCompanion({
    this.uid = const Value.absent(),
    this.recId = const Value.absent(),
    this.documentId = const Value.absent(),
    this.machineNo = const Value.absent(),
    this.registerDateTime = const Value.absent(),
    this.registerUser = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  RunningJobMachinesCompanion.insert({
    this.uid = const Value.absent(),
    required String recId,
    this.documentId = const Value.absent(),
    this.machineNo = const Value.absent(),
    this.registerDateTime = const Value.absent(),
    this.registerUser = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : recId = Value(recId);
  static Insertable<DbRunningJobMachine> custom({
    Expression<int>? uid,
    Expression<String>? recId,
    Expression<String>? documentId,
    Expression<String>? machineNo,
    Expression<String>? registerDateTime,
    Expression<String>? registerUser,
    Expression<int>? status,
    Expression<String>? updatedAt,
    Expression<String>? lastSync,
    Expression<int>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (recId != null) 'recID': recId,
      if (documentId != null) 'documentId': documentId,
      if (machineNo != null) 'MachineNo': machineNo,
      if (registerDateTime != null) 'registerDateTime': registerDateTime,
      if (registerUser != null) 'registerUser': registerUser,
      if (status != null) 'status': status,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (lastSync != null) 'lastSync': lastSync,
      if (syncStatus != null) 'syncStatus': syncStatus,
    });
  }

  RunningJobMachinesCompanion copyWith({
    Value<int>? uid,
    Value<String>? recId,
    Value<String?>? documentId,
    Value<String?>? machineNo,
    Value<String?>? registerDateTime,
    Value<String?>? registerUser,
    Value<int>? status,
    Value<String?>? updatedAt,
    Value<String?>? lastSync,
    Value<int>? syncStatus,
  }) {
    return RunningJobMachinesCompanion(
      uid: uid ?? this.uid,
      recId: recId ?? this.recId,
      documentId: documentId ?? this.documentId,
      machineNo: machineNo ?? this.machineNo,
      registerDateTime: registerDateTime ?? this.registerDateTime,
      registerUser: registerUser ?? this.registerUser,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSync: lastSync ?? this.lastSync,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (recId.present) {
      map['recID'] = Variable<String>(recId.value);
    }
    if (documentId.present) {
      map['documentId'] = Variable<String>(documentId.value);
    }
    if (machineNo.present) {
      map['MachineNo'] = Variable<String>(machineNo.value);
    }
    if (registerDateTime.present) {
      map['registerDateTime'] = Variable<String>(registerDateTime.value);
    }
    if (registerUser.present) {
      map['registerUser'] = Variable<String>(registerUser.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (syncStatus.present) {
      map['syncStatus'] = Variable<int>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RunningJobMachinesCompanion(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('documentId: $documentId, ')
          ..write('machineNo: $machineNo, ')
          ..write('registerDateTime: $registerDateTime, ')
          ..write('registerUser: $registerUser, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $JobWorkingTimesTable extends JobWorkingTimes
    with TableInfo<$JobWorkingTimesTable, DbJobWorkingTime> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobWorkingTimesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'documentId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'UserId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activityIdMeta = const VerificationMeta(
    'activityId',
  );
  @override
  late final GeneratedColumn<String> activityId = GeneratedColumn<String>(
    'ActivityID',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
    'StartTime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
    'EndTime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'syncStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    documentId,
    userId,
    activityId,
    startTime,
    endTime,
    status,
    updatedAt,
    lastSync,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_working_times';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbJobWorkingTime> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('documentId')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['documentId']!, _documentIdMeta),
      );
    }
    if (data.containsKey('UserId')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['UserId']!, _userIdMeta),
      );
    }
    if (data.containsKey('ActivityID')) {
      context.handle(
        _activityIdMeta,
        activityId.isAcceptableOrUnknown(data['ActivityID']!, _activityIdMeta),
      );
    }
    if (data.containsKey('StartTime')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['StartTime']!, _startTimeMeta),
      );
    }
    if (data.containsKey('EndTime')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['EndTime']!, _endTimeMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('syncStatus')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['syncStatus']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbJobWorkingTime map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbJobWorkingTime(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentId'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}UserId'],
      ),
      activityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ActivityID'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}StartTime'],
      ),
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}EndTime'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}syncStatus'],
      )!,
    );
  }

  @override
  $JobWorkingTimesTable createAlias(String alias) {
    return $JobWorkingTimesTable(attachedDatabase, alias);
  }
}

class DbJobWorkingTime extends DataClass
    implements Insertable<DbJobWorkingTime> {
  final int uid;
  final String? documentId;
  final String? userId;
  final String? activityId;
  final String? startTime;
  final String? endTime;
  final int status;
  final String? updatedAt;
  final String? lastSync;
  final int syncStatus;
  const DbJobWorkingTime({
    required this.uid,
    this.documentId,
    this.userId,
    this.activityId,
    this.startTime,
    this.endTime,
    required this.status,
    this.updatedAt,
    this.lastSync,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || documentId != null) {
      map['documentId'] = Variable<String>(documentId);
    }
    if (!nullToAbsent || userId != null) {
      map['UserId'] = Variable<String>(userId);
    }
    if (!nullToAbsent || activityId != null) {
      map['ActivityID'] = Variable<String>(activityId);
    }
    if (!nullToAbsent || startTime != null) {
      map['StartTime'] = Variable<String>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['EndTime'] = Variable<String>(endTime);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    map['syncStatus'] = Variable<int>(syncStatus);
    return map;
  }

  JobWorkingTimesCompanion toCompanion(bool nullToAbsent) {
    return JobWorkingTimesCompanion(
      uid: Value(uid),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      activityId: activityId == null && nullToAbsent
          ? const Value.absent()
          : Value(activityId),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      status: Value(status),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      syncStatus: Value(syncStatus),
    );
  }

  factory DbJobWorkingTime.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbJobWorkingTime(
      uid: serializer.fromJson<int>(json['uid']),
      documentId: serializer.fromJson<String?>(json['documentId']),
      userId: serializer.fromJson<String?>(json['userId']),
      activityId: serializer.fromJson<String?>(json['activityId']),
      startTime: serializer.fromJson<String?>(json['startTime']),
      endTime: serializer.fromJson<String?>(json['endTime']),
      status: serializer.fromJson<int>(json['status']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'documentId': serializer.toJson<String?>(documentId),
      'userId': serializer.toJson<String?>(userId),
      'activityId': serializer.toJson<String?>(activityId),
      'startTime': serializer.toJson<String?>(startTime),
      'endTime': serializer.toJson<String?>(endTime),
      'status': serializer.toJson<int>(status),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'lastSync': serializer.toJson<String?>(lastSync),
      'syncStatus': serializer.toJson<int>(syncStatus),
    };
  }

  DbJobWorkingTime copyWith({
    int? uid,
    Value<String?> documentId = const Value.absent(),
    Value<String?> userId = const Value.absent(),
    Value<String?> activityId = const Value.absent(),
    Value<String?> startTime = const Value.absent(),
    Value<String?> endTime = const Value.absent(),
    int? status,
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> lastSync = const Value.absent(),
    int? syncStatus,
  }) => DbJobWorkingTime(
    uid: uid ?? this.uid,
    documentId: documentId.present ? documentId.value : this.documentId,
    userId: userId.present ? userId.value : this.userId,
    activityId: activityId.present ? activityId.value : this.activityId,
    startTime: startTime.present ? startTime.value : this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    status: status ?? this.status,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  DbJobWorkingTime copyWithCompanion(JobWorkingTimesCompanion data) {
    return DbJobWorkingTime(
      uid: data.uid.present ? data.uid.value : this.uid,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      userId: data.userId.present ? data.userId.value : this.userId,
      activityId: data.activityId.present
          ? data.activityId.value
          : this.activityId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      status: data.status.present ? data.status.value : this.status,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbJobWorkingTime(')
          ..write('uid: $uid, ')
          ..write('documentId: $documentId, ')
          ..write('userId: $userId, ')
          ..write('activityId: $activityId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    documentId,
    userId,
    activityId,
    startTime,
    endTime,
    status,
    updatedAt,
    lastSync,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbJobWorkingTime &&
          other.uid == this.uid &&
          other.documentId == this.documentId &&
          other.userId == this.userId &&
          other.activityId == this.activityId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.status == this.status &&
          other.updatedAt == this.updatedAt &&
          other.lastSync == this.lastSync &&
          other.syncStatus == this.syncStatus);
}

class JobWorkingTimesCompanion extends UpdateCompanion<DbJobWorkingTime> {
  final Value<int> uid;
  final Value<String?> documentId;
  final Value<String?> userId;
  final Value<String?> activityId;
  final Value<String?> startTime;
  final Value<String?> endTime;
  final Value<int> status;
  final Value<String?> updatedAt;
  final Value<String?> lastSync;
  final Value<int> syncStatus;
  const JobWorkingTimesCompanion({
    this.uid = const Value.absent(),
    this.documentId = const Value.absent(),
    this.userId = const Value.absent(),
    this.activityId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  JobWorkingTimesCompanion.insert({
    this.uid = const Value.absent(),
    this.documentId = const Value.absent(),
    this.userId = const Value.absent(),
    this.activityId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  static Insertable<DbJobWorkingTime> custom({
    Expression<int>? uid,
    Expression<String>? documentId,
    Expression<String>? userId,
    Expression<String>? activityId,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<int>? status,
    Expression<String>? updatedAt,
    Expression<String>? lastSync,
    Expression<int>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (documentId != null) 'documentId': documentId,
      if (userId != null) 'UserId': userId,
      if (activityId != null) 'ActivityID': activityId,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (status != null) 'status': status,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (lastSync != null) 'lastSync': lastSync,
      if (syncStatus != null) 'syncStatus': syncStatus,
    });
  }

  JobWorkingTimesCompanion copyWith({
    Value<int>? uid,
    Value<String?>? documentId,
    Value<String?>? userId,
    Value<String?>? activityId,
    Value<String?>? startTime,
    Value<String?>? endTime,
    Value<int>? status,
    Value<String?>? updatedAt,
    Value<String?>? lastSync,
    Value<int>? syncStatus,
  }) {
    return JobWorkingTimesCompanion(
      uid: uid ?? this.uid,
      documentId: documentId ?? this.documentId,
      userId: userId ?? this.userId,
      activityId: activityId ?? this.activityId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSync: lastSync ?? this.lastSync,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (documentId.present) {
      map['documentId'] = Variable<String>(documentId.value);
    }
    if (userId.present) {
      map['UserId'] = Variable<String>(userId.value);
    }
    if (activityId.present) {
      map['ActivityID'] = Variable<String>(activityId.value);
    }
    if (startTime.present) {
      map['StartTime'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['EndTime'] = Variable<String>(endTime.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (syncStatus.present) {
      map['syncStatus'] = Variable<int>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobWorkingTimesCompanion(')
          ..write('uid: $uid, ')
          ..write('documentId: $documentId, ')
          ..write('userId: $userId, ')
          ..write('activityId: $activityId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $JobMachineEventLogsTable extends JobMachineEventLogs
    with TableInfo<$JobMachineEventLogsTable, DbJobMachineEventLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobMachineEventLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _jobMachineRecIdMeta = const VerificationMeta(
    'jobMachineRecId',
  );
  @override
  late final GeneratedColumn<String> jobMachineRecId = GeneratedColumn<String>(
    'JobMachineRef',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
    'StartTime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
    'EndTime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'syncStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    jobMachineRecId,
    startTime,
    endTime,
    status,
    updatedAt,
    lastSync,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_machine_event_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbJobMachineEventLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('JobMachineRef')) {
      context.handle(
        _jobMachineRecIdMeta,
        jobMachineRecId.isAcceptableOrUnknown(
          data['JobMachineRef']!,
          _jobMachineRecIdMeta,
        ),
      );
    }
    if (data.containsKey('StartTime')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['StartTime']!, _startTimeMeta),
      );
    }
    if (data.containsKey('EndTime')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['EndTime']!, _endTimeMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('syncStatus')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['syncStatus']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbJobMachineEventLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbJobMachineEventLog(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      jobMachineRecId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}JobMachineRef'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}StartTime'],
      ),
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}EndTime'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}syncStatus'],
      )!,
    );
  }

  @override
  $JobMachineEventLogsTable createAlias(String alias) {
    return $JobMachineEventLogsTable(attachedDatabase, alias);
  }
}

class DbJobMachineEventLog extends DataClass
    implements Insertable<DbJobMachineEventLog> {
  final int uid;
  final String? jobMachineRecId;
  final String? startTime;
  final String? endTime;
  final int status;
  final String? updatedAt;
  final String? lastSync;
  final int syncStatus;
  const DbJobMachineEventLog({
    required this.uid,
    this.jobMachineRecId,
    this.startTime,
    this.endTime,
    required this.status,
    this.updatedAt,
    this.lastSync,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || jobMachineRecId != null) {
      map['JobMachineRef'] = Variable<String>(jobMachineRecId);
    }
    if (!nullToAbsent || startTime != null) {
      map['StartTime'] = Variable<String>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['EndTime'] = Variable<String>(endTime);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    map['syncStatus'] = Variable<int>(syncStatus);
    return map;
  }

  JobMachineEventLogsCompanion toCompanion(bool nullToAbsent) {
    return JobMachineEventLogsCompanion(
      uid: Value(uid),
      jobMachineRecId: jobMachineRecId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobMachineRecId),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      status: Value(status),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      syncStatus: Value(syncStatus),
    );
  }

  factory DbJobMachineEventLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbJobMachineEventLog(
      uid: serializer.fromJson<int>(json['uid']),
      jobMachineRecId: serializer.fromJson<String?>(json['jobMachineRecId']),
      startTime: serializer.fromJson<String?>(json['startTime']),
      endTime: serializer.fromJson<String?>(json['endTime']),
      status: serializer.fromJson<int>(json['status']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'jobMachineRecId': serializer.toJson<String?>(jobMachineRecId),
      'startTime': serializer.toJson<String?>(startTime),
      'endTime': serializer.toJson<String?>(endTime),
      'status': serializer.toJson<int>(status),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'lastSync': serializer.toJson<String?>(lastSync),
      'syncStatus': serializer.toJson<int>(syncStatus),
    };
  }

  DbJobMachineEventLog copyWith({
    int? uid,
    Value<String?> jobMachineRecId = const Value.absent(),
    Value<String?> startTime = const Value.absent(),
    Value<String?> endTime = const Value.absent(),
    int? status,
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> lastSync = const Value.absent(),
    int? syncStatus,
  }) => DbJobMachineEventLog(
    uid: uid ?? this.uid,
    jobMachineRecId: jobMachineRecId.present
        ? jobMachineRecId.value
        : this.jobMachineRecId,
    startTime: startTime.present ? startTime.value : this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    status: status ?? this.status,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  DbJobMachineEventLog copyWithCompanion(JobMachineEventLogsCompanion data) {
    return DbJobMachineEventLog(
      uid: data.uid.present ? data.uid.value : this.uid,
      jobMachineRecId: data.jobMachineRecId.present
          ? data.jobMachineRecId.value
          : this.jobMachineRecId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      status: data.status.present ? data.status.value : this.status,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbJobMachineEventLog(')
          ..write('uid: $uid, ')
          ..write('jobMachineRecId: $jobMachineRecId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    jobMachineRecId,
    startTime,
    endTime,
    status,
    updatedAt,
    lastSync,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbJobMachineEventLog &&
          other.uid == this.uid &&
          other.jobMachineRecId == this.jobMachineRecId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.status == this.status &&
          other.updatedAt == this.updatedAt &&
          other.lastSync == this.lastSync &&
          other.syncStatus == this.syncStatus);
}

class JobMachineEventLogsCompanion
    extends UpdateCompanion<DbJobMachineEventLog> {
  final Value<int> uid;
  final Value<String?> jobMachineRecId;
  final Value<String?> startTime;
  final Value<String?> endTime;
  final Value<int> status;
  final Value<String?> updatedAt;
  final Value<String?> lastSync;
  final Value<int> syncStatus;
  const JobMachineEventLogsCompanion({
    this.uid = const Value.absent(),
    this.jobMachineRecId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  JobMachineEventLogsCompanion.insert({
    this.uid = const Value.absent(),
    this.jobMachineRecId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  static Insertable<DbJobMachineEventLog> custom({
    Expression<int>? uid,
    Expression<String>? jobMachineRecId,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<int>? status,
    Expression<String>? updatedAt,
    Expression<String>? lastSync,
    Expression<int>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (jobMachineRecId != null) 'JobMachineRef': jobMachineRecId,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (status != null) 'status': status,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (lastSync != null) 'lastSync': lastSync,
      if (syncStatus != null) 'syncStatus': syncStatus,
    });
  }

  JobMachineEventLogsCompanion copyWith({
    Value<int>? uid,
    Value<String?>? jobMachineRecId,
    Value<String?>? startTime,
    Value<String?>? endTime,
    Value<int>? status,
    Value<String?>? updatedAt,
    Value<String?>? lastSync,
    Value<int>? syncStatus,
  }) {
    return JobMachineEventLogsCompanion(
      uid: uid ?? this.uid,
      jobMachineRecId: jobMachineRecId ?? this.jobMachineRecId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSync: lastSync ?? this.lastSync,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (jobMachineRecId.present) {
      map['JobMachineRef'] = Variable<String>(jobMachineRecId.value);
    }
    if (startTime.present) {
      map['StartTime'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['EndTime'] = Variable<String>(endTime.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (syncStatus.present) {
      map['syncStatus'] = Variable<int>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobMachineEventLogsCompanion(')
          ..write('uid: $uid, ')
          ..write('jobMachineRecId: $jobMachineRecId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $JobMachineItemsTable extends JobMachineItems
    with TableInfo<$JobMachineItemsTable, DbJobMachineItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobMachineItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recIdMeta = const VerificationMeta('recId');
  @override
  late final GeneratedColumn<String> recId = GeneratedColumn<String>(
    'recID',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<String> documentId = GeneratedColumn<String>(
    'documentId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobTestSetRecIdMeta = const VerificationMeta(
    'jobTestSetRecId',
  );
  @override
  late final GeneratedColumn<String> jobTestSetRecId = GeneratedColumn<String>(
    'JobTestSetRef',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jobMachineRecIdMeta = const VerificationMeta(
    'jobMachineRecId',
  );
  @override
  late final GeneratedColumn<String> jobMachineRecId = GeneratedColumn<String>(
    'JobMachineRef',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registerDateTimeMeta = const VerificationMeta(
    'registerDateTime',
  );
  @override
  late final GeneratedColumn<String> registerDateTime = GeneratedColumn<String>(
    'registerDateTime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registerUserMeta = const VerificationMeta(
    'registerUser',
  );
  @override
  late final GeneratedColumn<String> registerUser = GeneratedColumn<String>(
    'registerUser',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'lastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'syncStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    recId,
    documentId,
    jobTestSetRecId,
    jobMachineRecId,
    registerDateTime,
    registerUser,
    status,
    updatedAt,
    lastSync,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_machine_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbJobMachineItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('recID')) {
      context.handle(
        _recIdMeta,
        recId.isAcceptableOrUnknown(data['recID']!, _recIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recIdMeta);
    }
    if (data.containsKey('documentId')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['documentId']!, _documentIdMeta),
      );
    }
    if (data.containsKey('JobTestSetRef')) {
      context.handle(
        _jobTestSetRecIdMeta,
        jobTestSetRecId.isAcceptableOrUnknown(
          data['JobTestSetRef']!,
          _jobTestSetRecIdMeta,
        ),
      );
    }
    if (data.containsKey('JobMachineRef')) {
      context.handle(
        _jobMachineRecIdMeta,
        jobMachineRecId.isAcceptableOrUnknown(
          data['JobMachineRef']!,
          _jobMachineRecIdMeta,
        ),
      );
    }
    if (data.containsKey('registerDateTime')) {
      context.handle(
        _registerDateTimeMeta,
        registerDateTime.isAcceptableOrUnknown(
          data['registerDateTime']!,
          _registerDateTimeMeta,
        ),
      );
    }
    if (data.containsKey('registerUser')) {
      context.handle(
        _registerUserMeta,
        registerUser.isAcceptableOrUnknown(
          data['registerUser']!,
          _registerUserMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('updatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updatedAt']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('lastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['lastSync']!, _lastSyncMeta),
      );
    }
    if (data.containsKey('syncStatus')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['syncStatus']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbJobMachineItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbJobMachineItem(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      recId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recID'],
      )!,
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentId'],
      ),
      jobTestSetRecId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}JobTestSetRef'],
      ),
      jobMachineRecId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}JobMachineRef'],
      ),
      registerDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registerDateTime'],
      ),
      registerUser: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registerUser'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastSync'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}syncStatus'],
      )!,
    );
  }

  @override
  $JobMachineItemsTable createAlias(String alias) {
    return $JobMachineItemsTable(attachedDatabase, alias);
  }
}

class DbJobMachineItem extends DataClass
    implements Insertable<DbJobMachineItem> {
  final int uid;
  final String recId;
  final String? documentId;
  final String? jobTestSetRecId;
  final String? jobMachineRecId;
  final String? registerDateTime;
  final String? registerUser;
  final int status;
  final String? updatedAt;
  final String? lastSync;
  final int syncStatus;
  const DbJobMachineItem({
    required this.uid,
    required this.recId,
    this.documentId,
    this.jobTestSetRecId,
    this.jobMachineRecId,
    this.registerDateTime,
    this.registerUser,
    required this.status,
    this.updatedAt,
    this.lastSync,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    map['recID'] = Variable<String>(recId);
    if (!nullToAbsent || documentId != null) {
      map['documentId'] = Variable<String>(documentId);
    }
    if (!nullToAbsent || jobTestSetRecId != null) {
      map['JobTestSetRef'] = Variable<String>(jobTestSetRecId);
    }
    if (!nullToAbsent || jobMachineRecId != null) {
      map['JobMachineRef'] = Variable<String>(jobMachineRecId);
    }
    if (!nullToAbsent || registerDateTime != null) {
      map['registerDateTime'] = Variable<String>(registerDateTime);
    }
    if (!nullToAbsent || registerUser != null) {
      map['registerUser'] = Variable<String>(registerUser);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    map['syncStatus'] = Variable<int>(syncStatus);
    return map;
  }

  JobMachineItemsCompanion toCompanion(bool nullToAbsent) {
    return JobMachineItemsCompanion(
      uid: Value(uid),
      recId: Value(recId),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      jobTestSetRecId: jobTestSetRecId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobTestSetRecId),
      jobMachineRecId: jobMachineRecId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobMachineRecId),
      registerDateTime: registerDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(registerDateTime),
      registerUser: registerUser == null && nullToAbsent
          ? const Value.absent()
          : Value(registerUser),
      status: Value(status),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      syncStatus: Value(syncStatus),
    );
  }

  factory DbJobMachineItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbJobMachineItem(
      uid: serializer.fromJson<int>(json['uid']),
      recId: serializer.fromJson<String>(json['recId']),
      documentId: serializer.fromJson<String?>(json['documentId']),
      jobTestSetRecId: serializer.fromJson<String?>(json['jobTestSetRecId']),
      jobMachineRecId: serializer.fromJson<String?>(json['jobMachineRecId']),
      registerDateTime: serializer.fromJson<String?>(json['registerDateTime']),
      registerUser: serializer.fromJson<String?>(json['registerUser']),
      status: serializer.fromJson<int>(json['status']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'recId': serializer.toJson<String>(recId),
      'documentId': serializer.toJson<String?>(documentId),
      'jobTestSetRecId': serializer.toJson<String?>(jobTestSetRecId),
      'jobMachineRecId': serializer.toJson<String?>(jobMachineRecId),
      'registerDateTime': serializer.toJson<String?>(registerDateTime),
      'registerUser': serializer.toJson<String?>(registerUser),
      'status': serializer.toJson<int>(status),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'lastSync': serializer.toJson<String?>(lastSync),
      'syncStatus': serializer.toJson<int>(syncStatus),
    };
  }

  DbJobMachineItem copyWith({
    int? uid,
    String? recId,
    Value<String?> documentId = const Value.absent(),
    Value<String?> jobTestSetRecId = const Value.absent(),
    Value<String?> jobMachineRecId = const Value.absent(),
    Value<String?> registerDateTime = const Value.absent(),
    Value<String?> registerUser = const Value.absent(),
    int? status,
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> lastSync = const Value.absent(),
    int? syncStatus,
  }) => DbJobMachineItem(
    uid: uid ?? this.uid,
    recId: recId ?? this.recId,
    documentId: documentId.present ? documentId.value : this.documentId,
    jobTestSetRecId: jobTestSetRecId.present
        ? jobTestSetRecId.value
        : this.jobTestSetRecId,
    jobMachineRecId: jobMachineRecId.present
        ? jobMachineRecId.value
        : this.jobMachineRecId,
    registerDateTime: registerDateTime.present
        ? registerDateTime.value
        : this.registerDateTime,
    registerUser: registerUser.present ? registerUser.value : this.registerUser,
    status: status ?? this.status,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  DbJobMachineItem copyWithCompanion(JobMachineItemsCompanion data) {
    return DbJobMachineItem(
      uid: data.uid.present ? data.uid.value : this.uid,
      recId: data.recId.present ? data.recId.value : this.recId,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      jobTestSetRecId: data.jobTestSetRecId.present
          ? data.jobTestSetRecId.value
          : this.jobTestSetRecId,
      jobMachineRecId: data.jobMachineRecId.present
          ? data.jobMachineRecId.value
          : this.jobMachineRecId,
      registerDateTime: data.registerDateTime.present
          ? data.registerDateTime.value
          : this.registerDateTime,
      registerUser: data.registerUser.present
          ? data.registerUser.value
          : this.registerUser,
      status: data.status.present ? data.status.value : this.status,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbJobMachineItem(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('documentId: $documentId, ')
          ..write('jobTestSetRecId: $jobTestSetRecId, ')
          ..write('jobMachineRecId: $jobMachineRecId, ')
          ..write('registerDateTime: $registerDateTime, ')
          ..write('registerUser: $registerUser, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    recId,
    documentId,
    jobTestSetRecId,
    jobMachineRecId,
    registerDateTime,
    registerUser,
    status,
    updatedAt,
    lastSync,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbJobMachineItem &&
          other.uid == this.uid &&
          other.recId == this.recId &&
          other.documentId == this.documentId &&
          other.jobTestSetRecId == this.jobTestSetRecId &&
          other.jobMachineRecId == this.jobMachineRecId &&
          other.registerDateTime == this.registerDateTime &&
          other.registerUser == this.registerUser &&
          other.status == this.status &&
          other.updatedAt == this.updatedAt &&
          other.lastSync == this.lastSync &&
          other.syncStatus == this.syncStatus);
}

class JobMachineItemsCompanion extends UpdateCompanion<DbJobMachineItem> {
  final Value<int> uid;
  final Value<String> recId;
  final Value<String?> documentId;
  final Value<String?> jobTestSetRecId;
  final Value<String?> jobMachineRecId;
  final Value<String?> registerDateTime;
  final Value<String?> registerUser;
  final Value<int> status;
  final Value<String?> updatedAt;
  final Value<String?> lastSync;
  final Value<int> syncStatus;
  const JobMachineItemsCompanion({
    this.uid = const Value.absent(),
    this.recId = const Value.absent(),
    this.documentId = const Value.absent(),
    this.jobTestSetRecId = const Value.absent(),
    this.jobMachineRecId = const Value.absent(),
    this.registerDateTime = const Value.absent(),
    this.registerUser = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  JobMachineItemsCompanion.insert({
    this.uid = const Value.absent(),
    required String recId,
    this.documentId = const Value.absent(),
    this.jobTestSetRecId = const Value.absent(),
    this.jobMachineRecId = const Value.absent(),
    this.registerDateTime = const Value.absent(),
    this.registerUser = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : recId = Value(recId);
  static Insertable<DbJobMachineItem> custom({
    Expression<int>? uid,
    Expression<String>? recId,
    Expression<String>? documentId,
    Expression<String>? jobTestSetRecId,
    Expression<String>? jobMachineRecId,
    Expression<String>? registerDateTime,
    Expression<String>? registerUser,
    Expression<int>? status,
    Expression<String>? updatedAt,
    Expression<String>? lastSync,
    Expression<int>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (recId != null) 'recID': recId,
      if (documentId != null) 'documentId': documentId,
      if (jobTestSetRecId != null) 'JobTestSetRef': jobTestSetRecId,
      if (jobMachineRecId != null) 'JobMachineRef': jobMachineRecId,
      if (registerDateTime != null) 'registerDateTime': registerDateTime,
      if (registerUser != null) 'registerUser': registerUser,
      if (status != null) 'status': status,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (lastSync != null) 'lastSync': lastSync,
      if (syncStatus != null) 'syncStatus': syncStatus,
    });
  }

  JobMachineItemsCompanion copyWith({
    Value<int>? uid,
    Value<String>? recId,
    Value<String?>? documentId,
    Value<String?>? jobTestSetRecId,
    Value<String?>? jobMachineRecId,
    Value<String?>? registerDateTime,
    Value<String?>? registerUser,
    Value<int>? status,
    Value<String?>? updatedAt,
    Value<String?>? lastSync,
    Value<int>? syncStatus,
  }) {
    return JobMachineItemsCompanion(
      uid: uid ?? this.uid,
      recId: recId ?? this.recId,
      documentId: documentId ?? this.documentId,
      jobTestSetRecId: jobTestSetRecId ?? this.jobTestSetRecId,
      jobMachineRecId: jobMachineRecId ?? this.jobMachineRecId,
      registerDateTime: registerDateTime ?? this.registerDateTime,
      registerUser: registerUser ?? this.registerUser,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSync: lastSync ?? this.lastSync,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (recId.present) {
      map['recID'] = Variable<String>(recId.value);
    }
    if (documentId.present) {
      map['documentId'] = Variable<String>(documentId.value);
    }
    if (jobTestSetRecId.present) {
      map['JobTestSetRef'] = Variable<String>(jobTestSetRecId.value);
    }
    if (jobMachineRecId.present) {
      map['JobMachineRef'] = Variable<String>(jobMachineRecId.value);
    }
    if (registerDateTime.present) {
      map['registerDateTime'] = Variable<String>(registerDateTime.value);
    }
    if (registerUser.present) {
      map['registerUser'] = Variable<String>(registerUser.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    if (lastSync.present) {
      map['lastSync'] = Variable<String>(lastSync.value);
    }
    if (syncStatus.present) {
      map['syncStatus'] = Variable<int>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobMachineItemsCompanion(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('documentId: $documentId, ')
          ..write('jobTestSetRecId: $jobTestSetRecId, ')
          ..write('jobMachineRecId: $jobMachineRecId, ')
          ..write('registerDateTime: $registerDateTime, ')
          ..write('registerUser: $registerUser, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $PauseReasonsTable extends PauseReasons
    with TableInfo<$PauseReasonsTable, DbPauseReason> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PauseReasonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _reasonCodeMeta = const VerificationMeta(
    'reasonCode',
  );
  @override
  late final GeneratedColumn<String> reasonCode = GeneratedColumn<String>(
    'ReasonCode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reasonNameMeta = const VerificationMeta(
    'reasonName',
  );
  @override
  late final GeneratedColumn<String> reasonName = GeneratedColumn<String>(
    'ReasonName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'Status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [uid, reasonCode, reasonName, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pause_reasons';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbPauseReason> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('ReasonCode')) {
      context.handle(
        _reasonCodeMeta,
        reasonCode.isAcceptableOrUnknown(data['ReasonCode']!, _reasonCodeMeta),
      );
    }
    if (data.containsKey('ReasonName')) {
      context.handle(
        _reasonNameMeta,
        reasonName.isAcceptableOrUnknown(data['ReasonName']!, _reasonNameMeta),
      );
    }
    if (data.containsKey('Status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['Status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbPauseReason map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbPauseReason(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      reasonCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ReasonCode'],
      ),
      reasonName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ReasonName'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}Status'],
      )!,
    );
  }

  @override
  $PauseReasonsTable createAlias(String alias) {
    return $PauseReasonsTable(attachedDatabase, alias);
  }
}

class DbPauseReason extends DataClass implements Insertable<DbPauseReason> {
  final int uid;
  final String? reasonCode;
  final String? reasonName;
  final int status;
  const DbPauseReason({
    required this.uid,
    this.reasonCode,
    this.reasonName,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || reasonCode != null) {
      map['ReasonCode'] = Variable<String>(reasonCode);
    }
    if (!nullToAbsent || reasonName != null) {
      map['ReasonName'] = Variable<String>(reasonName);
    }
    map['Status'] = Variable<int>(status);
    return map;
  }

  PauseReasonsCompanion toCompanion(bool nullToAbsent) {
    return PauseReasonsCompanion(
      uid: Value(uid),
      reasonCode: reasonCode == null && nullToAbsent
          ? const Value.absent()
          : Value(reasonCode),
      reasonName: reasonName == null && nullToAbsent
          ? const Value.absent()
          : Value(reasonName),
      status: Value(status),
    );
  }

  factory DbPauseReason.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbPauseReason(
      uid: serializer.fromJson<int>(json['uid']),
      reasonCode: serializer.fromJson<String?>(json['reasonCode']),
      reasonName: serializer.fromJson<String?>(json['reasonName']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'reasonCode': serializer.toJson<String?>(reasonCode),
      'reasonName': serializer.toJson<String?>(reasonName),
      'status': serializer.toJson<int>(status),
    };
  }

  DbPauseReason copyWith({
    int? uid,
    Value<String?> reasonCode = const Value.absent(),
    Value<String?> reasonName = const Value.absent(),
    int? status,
  }) => DbPauseReason(
    uid: uid ?? this.uid,
    reasonCode: reasonCode.present ? reasonCode.value : this.reasonCode,
    reasonName: reasonName.present ? reasonName.value : this.reasonName,
    status: status ?? this.status,
  );
  DbPauseReason copyWithCompanion(PauseReasonsCompanion data) {
    return DbPauseReason(
      uid: data.uid.present ? data.uid.value : this.uid,
      reasonCode: data.reasonCode.present
          ? data.reasonCode.value
          : this.reasonCode,
      reasonName: data.reasonName.present
          ? data.reasonName.value
          : this.reasonName,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbPauseReason(')
          ..write('uid: $uid, ')
          ..write('reasonCode: $reasonCode, ')
          ..write('reasonName: $reasonName, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, reasonCode, reasonName, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbPauseReason &&
          other.uid == this.uid &&
          other.reasonCode == this.reasonCode &&
          other.reasonName == this.reasonName &&
          other.status == this.status);
}

class PauseReasonsCompanion extends UpdateCompanion<DbPauseReason> {
  final Value<int> uid;
  final Value<String?> reasonCode;
  final Value<String?> reasonName;
  final Value<int> status;
  const PauseReasonsCompanion({
    this.uid = const Value.absent(),
    this.reasonCode = const Value.absent(),
    this.reasonName = const Value.absent(),
    this.status = const Value.absent(),
  });
  PauseReasonsCompanion.insert({
    this.uid = const Value.absent(),
    this.reasonCode = const Value.absent(),
    this.reasonName = const Value.absent(),
    this.status = const Value.absent(),
  });
  static Insertable<DbPauseReason> custom({
    Expression<int>? uid,
    Expression<String>? reasonCode,
    Expression<String>? reasonName,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (reasonCode != null) 'ReasonCode': reasonCode,
      if (reasonName != null) 'ReasonName': reasonName,
      if (status != null) 'Status': status,
    });
  }

  PauseReasonsCompanion copyWith({
    Value<int>? uid,
    Value<String?>? reasonCode,
    Value<String?>? reasonName,
    Value<int>? status,
  }) {
    return PauseReasonsCompanion(
      uid: uid ?? this.uid,
      reasonCode: reasonCode ?? this.reasonCode,
      reasonName: reasonName ?? this.reasonName,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (reasonCode.present) {
      map['ReasonCode'] = Variable<String>(reasonCode.value);
    }
    if (reasonName.present) {
      map['ReasonName'] = Variable<String>(reasonName.value);
    }
    if (status.present) {
      map['Status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PauseReasonsCompanion(')
          ..write('uid: $uid, ')
          ..write('reasonCode: $reasonCode, ')
          ..write('reasonName: $reasonName, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $CheckInActivitiesTable extends CheckInActivities
    with TableInfo<$CheckInActivitiesTable, DbCheckInActivity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckInActivitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _activityNameMeta = const VerificationMeta(
    'activityName',
  );
  @override
  late final GeneratedColumn<String> activityName = GeneratedColumn<String>(
    'ActivityName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'Status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [uid, activityName, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'check_in_activities';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbCheckInActivity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('ActivityName')) {
      context.handle(
        _activityNameMeta,
        activityName.isAcceptableOrUnknown(
          data['ActivityName']!,
          _activityNameMeta,
        ),
      );
    }
    if (data.containsKey('Status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['Status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbCheckInActivity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbCheckInActivity(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      activityName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ActivityName'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}Status'],
      )!,
    );
  }

  @override
  $CheckInActivitiesTable createAlias(String alias) {
    return $CheckInActivitiesTable(attachedDatabase, alias);
  }
}

class DbCheckInActivity extends DataClass
    implements Insertable<DbCheckInActivity> {
  final int uid;
  final String? activityName;
  final int status;
  const DbCheckInActivity({
    required this.uid,
    this.activityName,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || activityName != null) {
      map['ActivityName'] = Variable<String>(activityName);
    }
    map['Status'] = Variable<int>(status);
    return map;
  }

  CheckInActivitiesCompanion toCompanion(bool nullToAbsent) {
    return CheckInActivitiesCompanion(
      uid: Value(uid),
      activityName: activityName == null && nullToAbsent
          ? const Value.absent()
          : Value(activityName),
      status: Value(status),
    );
  }

  factory DbCheckInActivity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbCheckInActivity(
      uid: serializer.fromJson<int>(json['uid']),
      activityName: serializer.fromJson<String?>(json['activityName']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'activityName': serializer.toJson<String?>(activityName),
      'status': serializer.toJson<int>(status),
    };
  }

  DbCheckInActivity copyWith({
    int? uid,
    Value<String?> activityName = const Value.absent(),
    int? status,
  }) => DbCheckInActivity(
    uid: uid ?? this.uid,
    activityName: activityName.present ? activityName.value : this.activityName,
    status: status ?? this.status,
  );
  DbCheckInActivity copyWithCompanion(CheckInActivitiesCompanion data) {
    return DbCheckInActivity(
      uid: data.uid.present ? data.uid.value : this.uid,
      activityName: data.activityName.present
          ? data.activityName.value
          : this.activityName,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbCheckInActivity(')
          ..write('uid: $uid, ')
          ..write('activityName: $activityName, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, activityName, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbCheckInActivity &&
          other.uid == this.uid &&
          other.activityName == this.activityName &&
          other.status == this.status);
}

class CheckInActivitiesCompanion extends UpdateCompanion<DbCheckInActivity> {
  final Value<int> uid;
  final Value<String?> activityName;
  final Value<int> status;
  const CheckInActivitiesCompanion({
    this.uid = const Value.absent(),
    this.activityName = const Value.absent(),
    this.status = const Value.absent(),
  });
  CheckInActivitiesCompanion.insert({
    this.uid = const Value.absent(),
    this.activityName = const Value.absent(),
    this.status = const Value.absent(),
  });
  static Insertable<DbCheckInActivity> custom({
    Expression<int>? uid,
    Expression<String>? activityName,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (activityName != null) 'ActivityName': activityName,
      if (status != null) 'Status': status,
    });
  }

  CheckInActivitiesCompanion copyWith({
    Value<int>? uid,
    Value<String?>? activityName,
    Value<int>? status,
  }) {
    return CheckInActivitiesCompanion(
      uid: uid ?? this.uid,
      activityName: activityName ?? this.activityName,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (activityName.present) {
      map['ActivityName'] = Variable<String>(activityName.value);
    }
    if (status.present) {
      map['Status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckInActivitiesCompanion(')
          ..write('uid: $uid, ')
          ..write('activityName: $activityName, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $CheckInLogsTable extends CheckInLogs
    with TableInfo<$CheckInLogsTable, DbCheckInLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckInLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _locationCodeMeta = const VerificationMeta(
    'locationCode',
  );
  @override
  late final GeneratedColumn<String> locationCode = GeneratedColumn<String>(
    'LocationCode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'UserId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activityNameMeta = const VerificationMeta(
    'activityName',
  );
  @override
  late final GeneratedColumn<String> activityName = GeneratedColumn<String>(
    'ActivityName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'Remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkInTimeMeta = const VerificationMeta(
    'checkInTime',
  );
  @override
  late final GeneratedColumn<String> checkInTime = GeneratedColumn<String>(
    'CheckInTime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkOutTimeMeta = const VerificationMeta(
    'checkOutTime',
  );
  @override
  late final GeneratedColumn<String> checkOutTime = GeneratedColumn<String>(
    'CheckOutTime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'Status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'SyncStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'LastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    locationCode,
    userId,
    activityName,
    remark,
    checkInTime,
    checkOutTime,
    status,
    syncStatus,
    lastSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'check_in_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbCheckInLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('LocationCode')) {
      context.handle(
        _locationCodeMeta,
        locationCode.isAcceptableOrUnknown(
          data['LocationCode']!,
          _locationCodeMeta,
        ),
      );
    }
    if (data.containsKey('UserId')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['UserId']!, _userIdMeta),
      );
    }
    if (data.containsKey('ActivityName')) {
      context.handle(
        _activityNameMeta,
        activityName.isAcceptableOrUnknown(
          data['ActivityName']!,
          _activityNameMeta,
        ),
      );
    }
    if (data.containsKey('Remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['Remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('CheckInTime')) {
      context.handle(
        _checkInTimeMeta,
        checkInTime.isAcceptableOrUnknown(
          data['CheckInTime']!,
          _checkInTimeMeta,
        ),
      );
    }
    if (data.containsKey('CheckOutTime')) {
      context.handle(
        _checkOutTimeMeta,
        checkOutTime.isAcceptableOrUnknown(
          data['CheckOutTime']!,
          _checkOutTimeMeta,
        ),
      );
    }
    if (data.containsKey('Status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['Status']!, _statusMeta),
      );
    }
    if (data.containsKey('SyncStatus')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['SyncStatus']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('LastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['LastSync']!, _lastSyncMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbCheckInLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbCheckInLog(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      locationCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}LocationCode'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}UserId'],
      ),
      activityName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ActivityName'],
      ),
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Remark'],
      ),
      checkInTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CheckInTime'],
      ),
      checkOutTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CheckOutTime'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}Status'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}SyncStatus'],
      )!,
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}LastSync'],
      ),
    );
  }

  @override
  $CheckInLogsTable createAlias(String alias) {
    return $CheckInLogsTable(attachedDatabase, alias);
  }
}

class DbCheckInLog extends DataClass implements Insertable<DbCheckInLog> {
  final int uid;
  final String? locationCode;
  final String? userId;
  final String? activityName;
  final String? remark;
  final String? checkInTime;
  final String? checkOutTime;
  final int status;
  final int syncStatus;
  final String? lastSync;
  const DbCheckInLog({
    required this.uid,
    this.locationCode,
    this.userId,
    this.activityName,
    this.remark,
    this.checkInTime,
    this.checkOutTime,
    required this.status,
    required this.syncStatus,
    this.lastSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || locationCode != null) {
      map['LocationCode'] = Variable<String>(locationCode);
    }
    if (!nullToAbsent || userId != null) {
      map['UserId'] = Variable<String>(userId);
    }
    if (!nullToAbsent || activityName != null) {
      map['ActivityName'] = Variable<String>(activityName);
    }
    if (!nullToAbsent || remark != null) {
      map['Remark'] = Variable<String>(remark);
    }
    if (!nullToAbsent || checkInTime != null) {
      map['CheckInTime'] = Variable<String>(checkInTime);
    }
    if (!nullToAbsent || checkOutTime != null) {
      map['CheckOutTime'] = Variable<String>(checkOutTime);
    }
    map['Status'] = Variable<int>(status);
    map['SyncStatus'] = Variable<int>(syncStatus);
    if (!nullToAbsent || lastSync != null) {
      map['LastSync'] = Variable<String>(lastSync);
    }
    return map;
  }

  CheckInLogsCompanion toCompanion(bool nullToAbsent) {
    return CheckInLogsCompanion(
      uid: Value(uid),
      locationCode: locationCode == null && nullToAbsent
          ? const Value.absent()
          : Value(locationCode),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      activityName: activityName == null && nullToAbsent
          ? const Value.absent()
          : Value(activityName),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      checkInTime: checkInTime == null && nullToAbsent
          ? const Value.absent()
          : Value(checkInTime),
      checkOutTime: checkOutTime == null && nullToAbsent
          ? const Value.absent()
          : Value(checkOutTime),
      status: Value(status),
      syncStatus: Value(syncStatus),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
    );
  }

  factory DbCheckInLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbCheckInLog(
      uid: serializer.fromJson<int>(json['uid']),
      locationCode: serializer.fromJson<String?>(json['locationCode']),
      userId: serializer.fromJson<String?>(json['userId']),
      activityName: serializer.fromJson<String?>(json['activityName']),
      remark: serializer.fromJson<String?>(json['remark']),
      checkInTime: serializer.fromJson<String?>(json['checkInTime']),
      checkOutTime: serializer.fromJson<String?>(json['checkOutTime']),
      status: serializer.fromJson<int>(json['status']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'locationCode': serializer.toJson<String?>(locationCode),
      'userId': serializer.toJson<String?>(userId),
      'activityName': serializer.toJson<String?>(activityName),
      'remark': serializer.toJson<String?>(remark),
      'checkInTime': serializer.toJson<String?>(checkInTime),
      'checkOutTime': serializer.toJson<String?>(checkOutTime),
      'status': serializer.toJson<int>(status),
      'syncStatus': serializer.toJson<int>(syncStatus),
      'lastSync': serializer.toJson<String?>(lastSync),
    };
  }

  DbCheckInLog copyWith({
    int? uid,
    Value<String?> locationCode = const Value.absent(),
    Value<String?> userId = const Value.absent(),
    Value<String?> activityName = const Value.absent(),
    Value<String?> remark = const Value.absent(),
    Value<String?> checkInTime = const Value.absent(),
    Value<String?> checkOutTime = const Value.absent(),
    int? status,
    int? syncStatus,
    Value<String?> lastSync = const Value.absent(),
  }) => DbCheckInLog(
    uid: uid ?? this.uid,
    locationCode: locationCode.present ? locationCode.value : this.locationCode,
    userId: userId.present ? userId.value : this.userId,
    activityName: activityName.present ? activityName.value : this.activityName,
    remark: remark.present ? remark.value : this.remark,
    checkInTime: checkInTime.present ? checkInTime.value : this.checkInTime,
    checkOutTime: checkOutTime.present ? checkOutTime.value : this.checkOutTime,
    status: status ?? this.status,
    syncStatus: syncStatus ?? this.syncStatus,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
  );
  DbCheckInLog copyWithCompanion(CheckInLogsCompanion data) {
    return DbCheckInLog(
      uid: data.uid.present ? data.uid.value : this.uid,
      locationCode: data.locationCode.present
          ? data.locationCode.value
          : this.locationCode,
      userId: data.userId.present ? data.userId.value : this.userId,
      activityName: data.activityName.present
          ? data.activityName.value
          : this.activityName,
      remark: data.remark.present ? data.remark.value : this.remark,
      checkInTime: data.checkInTime.present
          ? data.checkInTime.value
          : this.checkInTime,
      checkOutTime: data.checkOutTime.present
          ? data.checkOutTime.value
          : this.checkOutTime,
      status: data.status.present ? data.status.value : this.status,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbCheckInLog(')
          ..write('uid: $uid, ')
          ..write('locationCode: $locationCode, ')
          ..write('userId: $userId, ')
          ..write('activityName: $activityName, ')
          ..write('remark: $remark, ')
          ..write('checkInTime: $checkInTime, ')
          ..write('checkOutTime: $checkOutTime, ')
          ..write('status: $status, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSync: $lastSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    locationCode,
    userId,
    activityName,
    remark,
    checkInTime,
    checkOutTime,
    status,
    syncStatus,
    lastSync,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbCheckInLog &&
          other.uid == this.uid &&
          other.locationCode == this.locationCode &&
          other.userId == this.userId &&
          other.activityName == this.activityName &&
          other.remark == this.remark &&
          other.checkInTime == this.checkInTime &&
          other.checkOutTime == this.checkOutTime &&
          other.status == this.status &&
          other.syncStatus == this.syncStatus &&
          other.lastSync == this.lastSync);
}

class CheckInLogsCompanion extends UpdateCompanion<DbCheckInLog> {
  final Value<int> uid;
  final Value<String?> locationCode;
  final Value<String?> userId;
  final Value<String?> activityName;
  final Value<String?> remark;
  final Value<String?> checkInTime;
  final Value<String?> checkOutTime;
  final Value<int> status;
  final Value<int> syncStatus;
  final Value<String?> lastSync;
  const CheckInLogsCompanion({
    this.uid = const Value.absent(),
    this.locationCode = const Value.absent(),
    this.userId = const Value.absent(),
    this.activityName = const Value.absent(),
    this.remark = const Value.absent(),
    this.checkInTime = const Value.absent(),
    this.checkOutTime = const Value.absent(),
    this.status = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSync = const Value.absent(),
  });
  CheckInLogsCompanion.insert({
    this.uid = const Value.absent(),
    this.locationCode = const Value.absent(),
    this.userId = const Value.absent(),
    this.activityName = const Value.absent(),
    this.remark = const Value.absent(),
    this.checkInTime = const Value.absent(),
    this.checkOutTime = const Value.absent(),
    this.status = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSync = const Value.absent(),
  });
  static Insertable<DbCheckInLog> custom({
    Expression<int>? uid,
    Expression<String>? locationCode,
    Expression<String>? userId,
    Expression<String>? activityName,
    Expression<String>? remark,
    Expression<String>? checkInTime,
    Expression<String>? checkOutTime,
    Expression<int>? status,
    Expression<int>? syncStatus,
    Expression<String>? lastSync,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (locationCode != null) 'LocationCode': locationCode,
      if (userId != null) 'UserId': userId,
      if (activityName != null) 'ActivityName': activityName,
      if (remark != null) 'Remark': remark,
      if (checkInTime != null) 'CheckInTime': checkInTime,
      if (checkOutTime != null) 'CheckOutTime': checkOutTime,
      if (status != null) 'Status': status,
      if (syncStatus != null) 'SyncStatus': syncStatus,
      if (lastSync != null) 'LastSync': lastSync,
    });
  }

  CheckInLogsCompanion copyWith({
    Value<int>? uid,
    Value<String?>? locationCode,
    Value<String?>? userId,
    Value<String?>? activityName,
    Value<String?>? remark,
    Value<String?>? checkInTime,
    Value<String?>? checkOutTime,
    Value<int>? status,
    Value<int>? syncStatus,
    Value<String?>? lastSync,
  }) {
    return CheckInLogsCompanion(
      uid: uid ?? this.uid,
      locationCode: locationCode ?? this.locationCode,
      userId: userId ?? this.userId,
      activityName: activityName ?? this.activityName,
      remark: remark ?? this.remark,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      status: status ?? this.status,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSync: lastSync ?? this.lastSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (locationCode.present) {
      map['LocationCode'] = Variable<String>(locationCode.value);
    }
    if (userId.present) {
      map['UserId'] = Variable<String>(userId.value);
    }
    if (activityName.present) {
      map['ActivityName'] = Variable<String>(activityName.value);
    }
    if (remark.present) {
      map['Remark'] = Variable<String>(remark.value);
    }
    if (checkInTime.present) {
      map['CheckInTime'] = Variable<String>(checkInTime.value);
    }
    if (checkOutTime.present) {
      map['CheckOutTime'] = Variable<String>(checkOutTime.value);
    }
    if (status.present) {
      map['Status'] = Variable<int>(status.value);
    }
    if (syncStatus.present) {
      map['SyncStatus'] = Variable<int>(syncStatus.value);
    }
    if (lastSync.present) {
      map['LastSync'] = Variable<String>(lastSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckInLogsCompanion(')
          ..write('uid: $uid, ')
          ..write('locationCode: $locationCode, ')
          ..write('userId: $userId, ')
          ..write('activityName: $activityName, ')
          ..write('remark: $remark, ')
          ..write('checkInTime: $checkInTime, ')
          ..write('checkOutTime: $checkOutTime, ')
          ..write('status: $status, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSync: $lastSync')
          ..write(')'))
        .toString();
  }
}

class $ActivityLogsTable extends ActivityLogs
    with TableInfo<$ActivityLogsTable, DbActivityLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
    'uid',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recIdMeta = const VerificationMeta('recId');
  @override
  late final GeneratedColumn<String> recId = GeneratedColumn<String>(
    'recID',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _machineNoMeta = const VerificationMeta(
    'machineNo',
  );
  @override
  late final GeneratedColumn<String> machineNo = GeneratedColumn<String>(
    'MachineNo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activityTypeMeta = const VerificationMeta(
    'activityType',
  );
  @override
  late final GeneratedColumn<String> activityType = GeneratedColumn<String>(
    'ActivityType',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operatorIdMeta = const VerificationMeta(
    'operatorId',
  );
  @override
  late final GeneratedColumn<String> operatorId = GeneratedColumn<String>(
    'OperatorId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
    'StartTime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
    'EndTime',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'Status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'Remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
    'SyncStatus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastSyncMeta = const VerificationMeta(
    'lastSync',
  );
  @override
  late final GeneratedColumn<String> lastSync = GeneratedColumn<String>(
    'LastSync',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    recId,
    machineNo,
    activityType,
    operatorId,
    startTime,
    endTime,
    status,
    remark,
    syncStatus,
    lastSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbActivityLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    }
    if (data.containsKey('recID')) {
      context.handle(
        _recIdMeta,
        recId.isAcceptableOrUnknown(data['recID']!, _recIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recIdMeta);
    }
    if (data.containsKey('MachineNo')) {
      context.handle(
        _machineNoMeta,
        machineNo.isAcceptableOrUnknown(data['MachineNo']!, _machineNoMeta),
      );
    }
    if (data.containsKey('ActivityType')) {
      context.handle(
        _activityTypeMeta,
        activityType.isAcceptableOrUnknown(
          data['ActivityType']!,
          _activityTypeMeta,
        ),
      );
    }
    if (data.containsKey('OperatorId')) {
      context.handle(
        _operatorIdMeta,
        operatorId.isAcceptableOrUnknown(data['OperatorId']!, _operatorIdMeta),
      );
    }
    if (data.containsKey('StartTime')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['StartTime']!, _startTimeMeta),
      );
    }
    if (data.containsKey('EndTime')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['EndTime']!, _endTimeMeta),
      );
    }
    if (data.containsKey('Status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['Status']!, _statusMeta),
      );
    }
    if (data.containsKey('Remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['Remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('SyncStatus')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['SyncStatus']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('LastSync')) {
      context.handle(
        _lastSyncMeta,
        lastSync.isAcceptableOrUnknown(data['LastSync']!, _lastSyncMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbActivityLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbActivityLog(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      recId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recID'],
      )!,
      machineNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineNo'],
      ),
      activityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ActivityType'],
      ),
      operatorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}OperatorId'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}StartTime'],
      ),
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}EndTime'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}Status'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Remark'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}SyncStatus'],
      )!,
      lastSync: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}LastSync'],
      ),
    );
  }

  @override
  $ActivityLogsTable createAlias(String alias) {
    return $ActivityLogsTable(attachedDatabase, alias);
  }
}

class DbActivityLog extends DataClass implements Insertable<DbActivityLog> {
  final int uid;
  final String recId;
  final String? machineNo;
  final String? activityType;
  final String? operatorId;
  final String? startTime;
  final String? endTime;
  final int status;
  final String? remark;
  final int syncStatus;
  final String? lastSync;
  const DbActivityLog({
    required this.uid,
    required this.recId,
    this.machineNo,
    this.activityType,
    this.operatorId,
    this.startTime,
    this.endTime,
    required this.status,
    this.remark,
    required this.syncStatus,
    this.lastSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    map['recID'] = Variable<String>(recId);
    if (!nullToAbsent || machineNo != null) {
      map['MachineNo'] = Variable<String>(machineNo);
    }
    if (!nullToAbsent || activityType != null) {
      map['ActivityType'] = Variable<String>(activityType);
    }
    if (!nullToAbsent || operatorId != null) {
      map['OperatorId'] = Variable<String>(operatorId);
    }
    if (!nullToAbsent || startTime != null) {
      map['StartTime'] = Variable<String>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['EndTime'] = Variable<String>(endTime);
    }
    map['Status'] = Variable<int>(status);
    if (!nullToAbsent || remark != null) {
      map['Remark'] = Variable<String>(remark);
    }
    map['SyncStatus'] = Variable<int>(syncStatus);
    if (!nullToAbsent || lastSync != null) {
      map['LastSync'] = Variable<String>(lastSync);
    }
    return map;
  }

  ActivityLogsCompanion toCompanion(bool nullToAbsent) {
    return ActivityLogsCompanion(
      uid: Value(uid),
      recId: Value(recId),
      machineNo: machineNo == null && nullToAbsent
          ? const Value.absent()
          : Value(machineNo),
      activityType: activityType == null && nullToAbsent
          ? const Value.absent()
          : Value(activityType),
      operatorId: operatorId == null && nullToAbsent
          ? const Value.absent()
          : Value(operatorId),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      status: Value(status),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      syncStatus: Value(syncStatus),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
    );
  }

  factory DbActivityLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbActivityLog(
      uid: serializer.fromJson<int>(json['uid']),
      recId: serializer.fromJson<String>(json['recId']),
      machineNo: serializer.fromJson<String?>(json['machineNo']),
      activityType: serializer.fromJson<String?>(json['activityType']),
      operatorId: serializer.fromJson<String?>(json['operatorId']),
      startTime: serializer.fromJson<String?>(json['startTime']),
      endTime: serializer.fromJson<String?>(json['endTime']),
      status: serializer.fromJson<int>(json['status']),
      remark: serializer.fromJson<String?>(json['remark']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'recId': serializer.toJson<String>(recId),
      'machineNo': serializer.toJson<String?>(machineNo),
      'activityType': serializer.toJson<String?>(activityType),
      'operatorId': serializer.toJson<String?>(operatorId),
      'startTime': serializer.toJson<String?>(startTime),
      'endTime': serializer.toJson<String?>(endTime),
      'status': serializer.toJson<int>(status),
      'remark': serializer.toJson<String?>(remark),
      'syncStatus': serializer.toJson<int>(syncStatus),
      'lastSync': serializer.toJson<String?>(lastSync),
    };
  }

  DbActivityLog copyWith({
    int? uid,
    String? recId,
    Value<String?> machineNo = const Value.absent(),
    Value<String?> activityType = const Value.absent(),
    Value<String?> operatorId = const Value.absent(),
    Value<String?> startTime = const Value.absent(),
    Value<String?> endTime = const Value.absent(),
    int? status,
    Value<String?> remark = const Value.absent(),
    int? syncStatus,
    Value<String?> lastSync = const Value.absent(),
  }) => DbActivityLog(
    uid: uid ?? this.uid,
    recId: recId ?? this.recId,
    machineNo: machineNo.present ? machineNo.value : this.machineNo,
    activityType: activityType.present ? activityType.value : this.activityType,
    operatorId: operatorId.present ? operatorId.value : this.operatorId,
    startTime: startTime.present ? startTime.value : this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    status: status ?? this.status,
    remark: remark.present ? remark.value : this.remark,
    syncStatus: syncStatus ?? this.syncStatus,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
  );
  DbActivityLog copyWithCompanion(ActivityLogsCompanion data) {
    return DbActivityLog(
      uid: data.uid.present ? data.uid.value : this.uid,
      recId: data.recId.present ? data.recId.value : this.recId,
      machineNo: data.machineNo.present ? data.machineNo.value : this.machineNo,
      activityType: data.activityType.present
          ? data.activityType.value
          : this.activityType,
      operatorId: data.operatorId.present
          ? data.operatorId.value
          : this.operatorId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      status: data.status.present ? data.status.value : this.status,
      remark: data.remark.present ? data.remark.value : this.remark,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbActivityLog(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('machineNo: $machineNo, ')
          ..write('activityType: $activityType, ')
          ..write('operatorId: $operatorId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('remark: $remark, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSync: $lastSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    recId,
    machineNo,
    activityType,
    operatorId,
    startTime,
    endTime,
    status,
    remark,
    syncStatus,
    lastSync,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbActivityLog &&
          other.uid == this.uid &&
          other.recId == this.recId &&
          other.machineNo == this.machineNo &&
          other.activityType == this.activityType &&
          other.operatorId == this.operatorId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.status == this.status &&
          other.remark == this.remark &&
          other.syncStatus == this.syncStatus &&
          other.lastSync == this.lastSync);
}

class ActivityLogsCompanion extends UpdateCompanion<DbActivityLog> {
  final Value<int> uid;
  final Value<String> recId;
  final Value<String?> machineNo;
  final Value<String?> activityType;
  final Value<String?> operatorId;
  final Value<String?> startTime;
  final Value<String?> endTime;
  final Value<int> status;
  final Value<String?> remark;
  final Value<int> syncStatus;
  final Value<String?> lastSync;
  const ActivityLogsCompanion({
    this.uid = const Value.absent(),
    this.recId = const Value.absent(),
    this.machineNo = const Value.absent(),
    this.activityType = const Value.absent(),
    this.operatorId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.remark = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSync = const Value.absent(),
  });
  ActivityLogsCompanion.insert({
    this.uid = const Value.absent(),
    required String recId,
    this.machineNo = const Value.absent(),
    this.activityType = const Value.absent(),
    this.operatorId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.remark = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSync = const Value.absent(),
  }) : recId = Value(recId);
  static Insertable<DbActivityLog> custom({
    Expression<int>? uid,
    Expression<String>? recId,
    Expression<String>? machineNo,
    Expression<String>? activityType,
    Expression<String>? operatorId,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<int>? status,
    Expression<String>? remark,
    Expression<int>? syncStatus,
    Expression<String>? lastSync,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (recId != null) 'recID': recId,
      if (machineNo != null) 'MachineNo': machineNo,
      if (activityType != null) 'ActivityType': activityType,
      if (operatorId != null) 'OperatorId': operatorId,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (status != null) 'Status': status,
      if (remark != null) 'Remark': remark,
      if (syncStatus != null) 'SyncStatus': syncStatus,
      if (lastSync != null) 'LastSync': lastSync,
    });
  }

  ActivityLogsCompanion copyWith({
    Value<int>? uid,
    Value<String>? recId,
    Value<String?>? machineNo,
    Value<String?>? activityType,
    Value<String?>? operatorId,
    Value<String?>? startTime,
    Value<String?>? endTime,
    Value<int>? status,
    Value<String?>? remark,
    Value<int>? syncStatus,
    Value<String?>? lastSync,
  }) {
    return ActivityLogsCompanion(
      uid: uid ?? this.uid,
      recId: recId ?? this.recId,
      machineNo: machineNo ?? this.machineNo,
      activityType: activityType ?? this.activityType,
      operatorId: operatorId ?? this.operatorId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      remark: remark ?? this.remark,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSync: lastSync ?? this.lastSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (recId.present) {
      map['recID'] = Variable<String>(recId.value);
    }
    if (machineNo.present) {
      map['MachineNo'] = Variable<String>(machineNo.value);
    }
    if (activityType.present) {
      map['ActivityType'] = Variable<String>(activityType.value);
    }
    if (operatorId.present) {
      map['OperatorId'] = Variable<String>(operatorId.value);
    }
    if (startTime.present) {
      map['StartTime'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['EndTime'] = Variable<String>(endTime.value);
    }
    if (status.present) {
      map['Status'] = Variable<int>(status.value);
    }
    if (remark.present) {
      map['Remark'] = Variable<String>(remark.value);
    }
    if (syncStatus.present) {
      map['SyncStatus'] = Variable<int>(syncStatus.value);
    }
    if (lastSync.present) {
      map['LastSync'] = Variable<String>(lastSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityLogsCompanion(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('machineNo: $machineNo, ')
          ..write('activityType: $activityType, ')
          ..write('operatorId: $operatorId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('remark: $remark, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSync: $lastSync')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $JobsTable jobs = $JobsTable(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  late final $DocumentMachinesTable documentMachines = $DocumentMachinesTable(
    this,
  );
  late final $DocumentRecordsTable documentRecords = $DocumentRecordsTable(
    this,
  );
  late final $JobMachinesTable jobMachines = $JobMachinesTable(this);
  late final $JobTagsTable jobTags = $JobTagsTable(this);
  late final $ProblemsTable problems = $ProblemsTable(this);
  late final $SyncsTable syncs = $SyncsTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ImagesTable images = $ImagesTable(this);
  late final $CheckSheetMasterImagesTable checkSheetMasterImages =
      $CheckSheetMasterImagesTable(this);
  late final $DocumentTimeLogsTable documentTimeLogs = $DocumentTimeLogsTable(
    this,
  );
  late final $JobTestSetsTable jobTestSets = $JobTestSetsTable(this);
  late final $RunningJobMachinesTable runningJobMachines =
      $RunningJobMachinesTable(this);
  late final $JobWorkingTimesTable jobWorkingTimes = $JobWorkingTimesTable(
    this,
  );
  late final $JobMachineEventLogsTable jobMachineEventLogs =
      $JobMachineEventLogsTable(this);
  late final $JobMachineItemsTable jobMachineItems = $JobMachineItemsTable(
    this,
  );
  late final $PauseReasonsTable pauseReasons = $PauseReasonsTable(this);
  late final $CheckInActivitiesTable checkInActivities =
      $CheckInActivitiesTable(this);
  late final $CheckInLogsTable checkInLogs = $CheckInLogsTable(this);
  late final $ActivityLogsTable activityLogs = $ActivityLogsTable(this);
  late final JobDao jobDao = JobDao(this as AppDatabase);
  late final DocumentDao documentDao = DocumentDao(this as AppDatabase);
  late final DocumentMachineDao documentMachineDao = DocumentMachineDao(
    this as AppDatabase,
  );
  late final DocumentRecordDao documentRecordDao = DocumentRecordDao(
    this as AppDatabase,
  );
  late final JobMachineDao jobMachineDao = JobMachineDao(this as AppDatabase);
  late final JobTagDao jobTagDao = JobTagDao(this as AppDatabase);
  late final ProblemDao problemDao = ProblemDao(this as AppDatabase);
  late final SyncDao syncDao = SyncDao(this as AppDatabase);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final ImageDao imageDao = ImageDao(this as AppDatabase);
  late final ChecksheetMasterImageDao checksheetMasterImageDao =
      ChecksheetMasterImageDao(this as AppDatabase);
  late final DocumentTimeLogDao documentTimeLogDao = DocumentTimeLogDao(
    this as AppDatabase,
  );
  late final RunningJobDetailsDao runningJobDetailsDao = RunningJobDetailsDao(
    this as AppDatabase,
  );
  late final PauseReasonDao pauseReasonDao = PauseReasonDao(
    this as AppDatabase,
  );
  late final CheckInDao checkInDao = CheckInDao(this as AppDatabase);
  late final ActivityLogDao activityLogDao = ActivityLogDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    jobs,
    documents,
    documentMachines,
    documentRecords,
    jobMachines,
    jobTags,
    problems,
    syncs,
    users,
    images,
    checkSheetMasterImages,
    documentTimeLogs,
    jobTestSets,
    runningJobMachines,
    jobWorkingTimes,
    jobMachineEventLogs,
    jobMachineItems,
    pauseReasons,
    checkInActivities,
    checkInLogs,
    activityLogs,
  ];
}

typedef $$JobsTableCreateCompanionBuilder =
    JobsCompanion Function({
      Value<int> uid,
      Value<String?> jobId,
      Value<String?> jobName,
      Value<String?> machineName,
      Value<String?> documentId,
      Value<String?> location,
      Value<int> jobStatus,
      Value<String?> lastSync,
      Value<String?> createDate,
      Value<String?> createBy,
      Value<String?> updatedAt,
    });
typedef $$JobsTableUpdateCompanionBuilder =
    JobsCompanion Function({
      Value<int> uid,
      Value<String?> jobId,
      Value<String?> jobName,
      Value<String?> machineName,
      Value<String?> documentId,
      Value<String?> location,
      Value<int> jobStatus,
      Value<String?> lastSync,
      Value<String?> createDate,
      Value<String?> createBy,
      Value<String?> updatedAt,
    });

class $$JobsTableFilterComposer extends Composer<_$AppDatabase, $JobsTable> {
  $$JobsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobName => $composableBuilder(
    column: $table.jobName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jobStatus => $composableBuilder(
    column: $table.jobStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createBy => $composableBuilder(
    column: $table.createBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JobsTableOrderingComposer extends Composer<_$AppDatabase, $JobsTable> {
  $$JobsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobName => $composableBuilder(
    column: $table.jobName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jobStatus => $composableBuilder(
    column: $table.jobStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createBy => $composableBuilder(
    column: $table.createBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JobsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobsTable> {
  $$JobsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get jobId =>
      $composableBuilder(column: $table.jobId, builder: (column) => column);

  GeneratedColumn<String> get jobName =>
      $composableBuilder(column: $table.jobName, builder: (column) => column);

  GeneratedColumn<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<int> get jobStatus =>
      $composableBuilder(column: $table.jobStatus, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createBy =>
      $composableBuilder(column: $table.createBy, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$JobsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JobsTable,
          DbJob,
          $$JobsTableFilterComposer,
          $$JobsTableOrderingComposer,
          $$JobsTableAnnotationComposer,
          $$JobsTableCreateCompanionBuilder,
          $$JobsTableUpdateCompanionBuilder,
          (DbJob, BaseReferences<_$AppDatabase, $JobsTable, DbJob>),
          DbJob,
          PrefetchHooks Function()
        > {
  $$JobsTableTableManager(_$AppDatabase db, $JobsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> jobName = const Value.absent(),
                Value<String?> machineName = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<int> jobStatus = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> createDate = const Value.absent(),
                Value<String?> createBy = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => JobsCompanion(
                uid: uid,
                jobId: jobId,
                jobName: jobName,
                machineName: machineName,
                documentId: documentId,
                location: location,
                jobStatus: jobStatus,
                lastSync: lastSync,
                createDate: createDate,
                createBy: createBy,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> jobName = const Value.absent(),
                Value<String?> machineName = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<int> jobStatus = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> createDate = const Value.absent(),
                Value<String?> createBy = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => JobsCompanion.insert(
                uid: uid,
                jobId: jobId,
                jobName: jobName,
                machineName: machineName,
                documentId: documentId,
                location: location,
                jobStatus: jobStatus,
                lastSync: lastSync,
                createDate: createDate,
                createBy: createBy,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JobsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JobsTable,
      DbJob,
      $$JobsTableFilterComposer,
      $$JobsTableOrderingComposer,
      $$JobsTableAnnotationComposer,
      $$JobsTableCreateCompanionBuilder,
      $$JobsTableUpdateCompanionBuilder,
      (DbJob, BaseReferences<_$AppDatabase, $JobsTable, DbJob>),
      DbJob,
      PrefetchHooks Function()
    >;
typedef $$DocumentsTableCreateCompanionBuilder =
    DocumentsCompanion Function({
      Value<int> uid,
      Value<String?> documentId,
      Value<String?> jobId,
      Value<String?> documentName,
      Value<String?> userId,
      Value<String?> createDate,
      Value<int> status,
      Value<String?> lastSync,
      Value<String?> updatedAt,
      Value<int> syncStatus,
      Value<String?> runningDate,
      Value<String?> endDate,
      Value<String?> deleteDate,
      Value<String?> cancelDate,
      Value<String?> postDate,
    });
typedef $$DocumentsTableUpdateCompanionBuilder =
    DocumentsCompanion Function({
      Value<int> uid,
      Value<String?> documentId,
      Value<String?> jobId,
      Value<String?> documentName,
      Value<String?> userId,
      Value<String?> createDate,
      Value<int> status,
      Value<String?> lastSync,
      Value<String?> updatedAt,
      Value<int> syncStatus,
      Value<String?> runningDate,
      Value<String?> endDate,
      Value<String?> deleteDate,
      Value<String?> cancelDate,
      Value<String?> postDate,
    });

class $$DocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentName => $composableBuilder(
    column: $table.documentName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get runningDate => $composableBuilder(
    column: $table.runningDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deleteDate => $composableBuilder(
    column: $table.deleteDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cancelDate => $composableBuilder(
    column: $table.cancelDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postDate => $composableBuilder(
    column: $table.postDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentName => $composableBuilder(
    column: $table.documentName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get runningDate => $composableBuilder(
    column: $table.runningDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deleteDate => $composableBuilder(
    column: $table.deleteDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cancelDate => $composableBuilder(
    column: $table.cancelDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postDate => $composableBuilder(
    column: $table.postDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jobId =>
      $composableBuilder(column: $table.jobId, builder: (column) => column);

  GeneratedColumn<String> get documentName => $composableBuilder(
    column: $table.documentName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get runningDate => $composableBuilder(
    column: $table.runningDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get deleteDate => $composableBuilder(
    column: $table.deleteDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cancelDate => $composableBuilder(
    column: $table.cancelDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get postDate =>
      $composableBuilder(column: $table.postDate, builder: (column) => column);
}

class $$DocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentsTable,
          DbDocument,
          $$DocumentsTableFilterComposer,
          $$DocumentsTableOrderingComposer,
          $$DocumentsTableAnnotationComposer,
          $$DocumentsTableCreateCompanionBuilder,
          $$DocumentsTableUpdateCompanionBuilder,
          (
            DbDocument,
            BaseReferences<_$AppDatabase, $DocumentsTable, DbDocument>,
          ),
          DbDocument,
          PrefetchHooks Function()
        > {
  $$DocumentsTableTableManager(_$AppDatabase db, $DocumentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> documentName = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> createDate = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> runningDate = const Value.absent(),
                Value<String?> endDate = const Value.absent(),
                Value<String?> deleteDate = const Value.absent(),
                Value<String?> cancelDate = const Value.absent(),
                Value<String?> postDate = const Value.absent(),
              }) => DocumentsCompanion(
                uid: uid,
                documentId: documentId,
                jobId: jobId,
                documentName: documentName,
                userId: userId,
                createDate: createDate,
                status: status,
                lastSync: lastSync,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
                runningDate: runningDate,
                endDate: endDate,
                deleteDate: deleteDate,
                cancelDate: cancelDate,
                postDate: postDate,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> documentName = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> createDate = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> runningDate = const Value.absent(),
                Value<String?> endDate = const Value.absent(),
                Value<String?> deleteDate = const Value.absent(),
                Value<String?> cancelDate = const Value.absent(),
                Value<String?> postDate = const Value.absent(),
              }) => DocumentsCompanion.insert(
                uid: uid,
                documentId: documentId,
                jobId: jobId,
                documentName: documentName,
                userId: userId,
                createDate: createDate,
                status: status,
                lastSync: lastSync,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
                runningDate: runningDate,
                endDate: endDate,
                deleteDate: deleteDate,
                cancelDate: cancelDate,
                postDate: postDate,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentsTable,
      DbDocument,
      $$DocumentsTableFilterComposer,
      $$DocumentsTableOrderingComposer,
      $$DocumentsTableAnnotationComposer,
      $$DocumentsTableCreateCompanionBuilder,
      $$DocumentsTableUpdateCompanionBuilder,
      (DbDocument, BaseReferences<_$AppDatabase, $DocumentsTable, DbDocument>),
      DbDocument,
      PrefetchHooks Function()
    >;
typedef $$DocumentMachinesTableCreateCompanionBuilder =
    DocumentMachinesCompanion Function({
      Value<int> uid,
      Value<String?> jobId,
      Value<String?> documentId,
      Value<String?> machineId,
      Value<String?> machineName,
      Value<String?> machineType,
      Value<String?> description,
      Value<String?> specification,
      Value<int> status,
      Value<String?> lastSync,
      Value<int> uiType,
      required int id,
      Value<String?> createDate,
      Value<String?> createBy,
      Value<String?> updatedAt,
    });
typedef $$DocumentMachinesTableUpdateCompanionBuilder =
    DocumentMachinesCompanion Function({
      Value<int> uid,
      Value<String?> jobId,
      Value<String?> documentId,
      Value<String?> machineId,
      Value<String?> machineName,
      Value<String?> machineType,
      Value<String?> description,
      Value<String?> specification,
      Value<int> status,
      Value<String?> lastSync,
      Value<int> uiType,
      Value<int> id,
      Value<String?> createDate,
      Value<String?> createBy,
      Value<String?> updatedAt,
    });

class $$DocumentMachinesTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentMachinesTable> {
  $$DocumentMachinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineType => $composableBuilder(
    column: $table.machineType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get uiType => $composableBuilder(
    column: $table.uiType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createBy => $composableBuilder(
    column: $table.createBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DocumentMachinesTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentMachinesTable> {
  $$DocumentMachinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineType => $composableBuilder(
    column: $table.machineType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get uiType => $composableBuilder(
    column: $table.uiType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createBy => $composableBuilder(
    column: $table.createBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentMachinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentMachinesTable> {
  $$DocumentMachinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get jobId =>
      $composableBuilder(column: $table.jobId, builder: (column) => column);

  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get machineId =>
      $composableBuilder(column: $table.machineId, builder: (column) => column);

  GeneratedColumn<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get machineType => $composableBuilder(
    column: $table.machineType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<int> get uiType =>
      $composableBuilder(column: $table.uiType, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createBy =>
      $composableBuilder(column: $table.createBy, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DocumentMachinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentMachinesTable,
          DbDocumentMachine,
          $$DocumentMachinesTableFilterComposer,
          $$DocumentMachinesTableOrderingComposer,
          $$DocumentMachinesTableAnnotationComposer,
          $$DocumentMachinesTableCreateCompanionBuilder,
          $$DocumentMachinesTableUpdateCompanionBuilder,
          (
            DbDocumentMachine,
            BaseReferences<
              _$AppDatabase,
              $DocumentMachinesTable,
              DbDocumentMachine
            >,
          ),
          DbDocumentMachine,
          PrefetchHooks Function()
        > {
  $$DocumentMachinesTableTableManager(
    _$AppDatabase db,
    $DocumentMachinesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentMachinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentMachinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentMachinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> machineName = const Value.absent(),
                Value<String?> machineType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> specification = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> uiType = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> createDate = const Value.absent(),
                Value<String?> createBy = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => DocumentMachinesCompanion(
                uid: uid,
                jobId: jobId,
                documentId: documentId,
                machineId: machineId,
                machineName: machineName,
                machineType: machineType,
                description: description,
                specification: specification,
                status: status,
                lastSync: lastSync,
                uiType: uiType,
                id: id,
                createDate: createDate,
                createBy: createBy,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> machineName = const Value.absent(),
                Value<String?> machineType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> specification = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> uiType = const Value.absent(),
                required int id,
                Value<String?> createDate = const Value.absent(),
                Value<String?> createBy = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => DocumentMachinesCompanion.insert(
                uid: uid,
                jobId: jobId,
                documentId: documentId,
                machineId: machineId,
                machineName: machineName,
                machineType: machineType,
                description: description,
                specification: specification,
                status: status,
                lastSync: lastSync,
                uiType: uiType,
                id: id,
                createDate: createDate,
                createBy: createBy,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DocumentMachinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentMachinesTable,
      DbDocumentMachine,
      $$DocumentMachinesTableFilterComposer,
      $$DocumentMachinesTableOrderingComposer,
      $$DocumentMachinesTableAnnotationComposer,
      $$DocumentMachinesTableCreateCompanionBuilder,
      $$DocumentMachinesTableUpdateCompanionBuilder,
      (
        DbDocumentMachine,
        BaseReferences<
          _$AppDatabase,
          $DocumentMachinesTable,
          DbDocumentMachine
        >,
      ),
      DbDocumentMachine,
      PrefetchHooks Function()
    >;
typedef $$DocumentRecordsTableCreateCompanionBuilder =
    DocumentRecordsCompanion Function({
      Value<int> uid,
      Value<String?> documentId,
      Value<String?> machineId,
      Value<String?> jobId,
      Value<String?> tagId,
      Value<String?> tagName,
      Value<String?> tagType,
      Value<String?> tagGroupId,
      Value<String?> tagGroupName,
      Value<String?> tagSelectionValue,
      Value<String?> description,
      Value<String?> note,
      Value<String?> specification,
      Value<String?> specMin,
      Value<String?> specMax,
      Value<String?> unit,
      Value<String?> queryStr,
      Value<String?> value,
      Value<String?> valueType,
      Value<String?> remark,
      Value<int> status,
      Value<String> unReadable,
      Value<String?> lastSync,
      Value<String?> createBy,
      Value<int> syncStatus,
      Value<String?> updatedAt,
    });
typedef $$DocumentRecordsTableUpdateCompanionBuilder =
    DocumentRecordsCompanion Function({
      Value<int> uid,
      Value<String?> documentId,
      Value<String?> machineId,
      Value<String?> jobId,
      Value<String?> tagId,
      Value<String?> tagName,
      Value<String?> tagType,
      Value<String?> tagGroupId,
      Value<String?> tagGroupName,
      Value<String?> tagSelectionValue,
      Value<String?> description,
      Value<String?> note,
      Value<String?> specification,
      Value<String?> specMin,
      Value<String?> specMax,
      Value<String?> unit,
      Value<String?> queryStr,
      Value<String?> value,
      Value<String?> valueType,
      Value<String?> remark,
      Value<int> status,
      Value<String> unReadable,
      Value<String?> lastSync,
      Value<String?> createBy,
      Value<int> syncStatus,
      Value<String?> updatedAt,
    });

class $$DocumentRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentRecordsTable> {
  $$DocumentRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagName => $composableBuilder(
    column: $table.tagName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagType => $composableBuilder(
    column: $table.tagType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagGroupId => $composableBuilder(
    column: $table.tagGroupId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagGroupName => $composableBuilder(
    column: $table.tagGroupName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagSelectionValue => $composableBuilder(
    column: $table.tagSelectionValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specMin => $composableBuilder(
    column: $table.specMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specMax => $composableBuilder(
    column: $table.specMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get queryStr => $composableBuilder(
    column: $table.queryStr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueType => $composableBuilder(
    column: $table.valueType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unReadable => $composableBuilder(
    column: $table.unReadable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createBy => $composableBuilder(
    column: $table.createBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DocumentRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentRecordsTable> {
  $$DocumentRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagName => $composableBuilder(
    column: $table.tagName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagType => $composableBuilder(
    column: $table.tagType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagGroupId => $composableBuilder(
    column: $table.tagGroupId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagGroupName => $composableBuilder(
    column: $table.tagGroupName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagSelectionValue => $composableBuilder(
    column: $table.tagSelectionValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specMin => $composableBuilder(
    column: $table.specMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specMax => $composableBuilder(
    column: $table.specMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get queryStr => $composableBuilder(
    column: $table.queryStr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueType => $composableBuilder(
    column: $table.valueType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unReadable => $composableBuilder(
    column: $table.unReadable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createBy => $composableBuilder(
    column: $table.createBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentRecordsTable> {
  $$DocumentRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get machineId =>
      $composableBuilder(column: $table.machineId, builder: (column) => column);

  GeneratedColumn<String> get jobId =>
      $composableBuilder(column: $table.jobId, builder: (column) => column);

  GeneratedColumn<String> get tagId =>
      $composableBuilder(column: $table.tagId, builder: (column) => column);

  GeneratedColumn<String> get tagName =>
      $composableBuilder(column: $table.tagName, builder: (column) => column);

  GeneratedColumn<String> get tagType =>
      $composableBuilder(column: $table.tagType, builder: (column) => column);

  GeneratedColumn<String> get tagGroupId => $composableBuilder(
    column: $table.tagGroupId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tagGroupName => $composableBuilder(
    column: $table.tagGroupName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tagSelectionValue => $composableBuilder(
    column: $table.tagSelectionValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specMin =>
      $composableBuilder(column: $table.specMin, builder: (column) => column);

  GeneratedColumn<String> get specMax =>
      $composableBuilder(column: $table.specMax, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get queryStr =>
      $composableBuilder(column: $table.queryStr, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get valueType =>
      $composableBuilder(column: $table.valueType, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get unReadable => $composableBuilder(
    column: $table.unReadable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<String> get createBy =>
      $composableBuilder(column: $table.createBy, builder: (column) => column);

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DocumentRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentRecordsTable,
          DbDocumentRecord,
          $$DocumentRecordsTableFilterComposer,
          $$DocumentRecordsTableOrderingComposer,
          $$DocumentRecordsTableAnnotationComposer,
          $$DocumentRecordsTableCreateCompanionBuilder,
          $$DocumentRecordsTableUpdateCompanionBuilder,
          (
            DbDocumentRecord,
            BaseReferences<
              _$AppDatabase,
              $DocumentRecordsTable,
              DbDocumentRecord
            >,
          ),
          DbDocumentRecord,
          PrefetchHooks Function()
        > {
  $$DocumentRecordsTableTableManager(
    _$AppDatabase db,
    $DocumentRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> tagId = const Value.absent(),
                Value<String?> tagName = const Value.absent(),
                Value<String?> tagType = const Value.absent(),
                Value<String?> tagGroupId = const Value.absent(),
                Value<String?> tagGroupName = const Value.absent(),
                Value<String?> tagSelectionValue = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> specification = const Value.absent(),
                Value<String?> specMin = const Value.absent(),
                Value<String?> specMax = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String?> queryStr = const Value.absent(),
                Value<String?> value = const Value.absent(),
                Value<String?> valueType = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String> unReadable = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> createBy = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => DocumentRecordsCompanion(
                uid: uid,
                documentId: documentId,
                machineId: machineId,
                jobId: jobId,
                tagId: tagId,
                tagName: tagName,
                tagType: tagType,
                tagGroupId: tagGroupId,
                tagGroupName: tagGroupName,
                tagSelectionValue: tagSelectionValue,
                description: description,
                note: note,
                specification: specification,
                specMin: specMin,
                specMax: specMax,
                unit: unit,
                queryStr: queryStr,
                value: value,
                valueType: valueType,
                remark: remark,
                status: status,
                unReadable: unReadable,
                lastSync: lastSync,
                createBy: createBy,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> tagId = const Value.absent(),
                Value<String?> tagName = const Value.absent(),
                Value<String?> tagType = const Value.absent(),
                Value<String?> tagGroupId = const Value.absent(),
                Value<String?> tagGroupName = const Value.absent(),
                Value<String?> tagSelectionValue = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> specification = const Value.absent(),
                Value<String?> specMin = const Value.absent(),
                Value<String?> specMax = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String?> queryStr = const Value.absent(),
                Value<String?> value = const Value.absent(),
                Value<String?> valueType = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String> unReadable = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> createBy = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => DocumentRecordsCompanion.insert(
                uid: uid,
                documentId: documentId,
                machineId: machineId,
                jobId: jobId,
                tagId: tagId,
                tagName: tagName,
                tagType: tagType,
                tagGroupId: tagGroupId,
                tagGroupName: tagGroupName,
                tagSelectionValue: tagSelectionValue,
                description: description,
                note: note,
                specification: specification,
                specMin: specMin,
                specMax: specMax,
                unit: unit,
                queryStr: queryStr,
                value: value,
                valueType: valueType,
                remark: remark,
                status: status,
                unReadable: unReadable,
                lastSync: lastSync,
                createBy: createBy,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DocumentRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentRecordsTable,
      DbDocumentRecord,
      $$DocumentRecordsTableFilterComposer,
      $$DocumentRecordsTableOrderingComposer,
      $$DocumentRecordsTableAnnotationComposer,
      $$DocumentRecordsTableCreateCompanionBuilder,
      $$DocumentRecordsTableUpdateCompanionBuilder,
      (
        DbDocumentRecord,
        BaseReferences<_$AppDatabase, $DocumentRecordsTable, DbDocumentRecord>,
      ),
      DbDocumentRecord,
      PrefetchHooks Function()
    >;
typedef $$JobMachinesTableCreateCompanionBuilder =
    JobMachinesCompanion Function({
      Value<int> uid,
      Value<String?> jobId,
      Value<String?> machineId,
      Value<String?> machineName,
      Value<String?> machineType,
      Value<String?> description,
      Value<String?> specification,
      Value<int> status,
      Value<String?> lastSync,
      Value<String?> updatedAt,
    });
typedef $$JobMachinesTableUpdateCompanionBuilder =
    JobMachinesCompanion Function({
      Value<int> uid,
      Value<String?> jobId,
      Value<String?> machineId,
      Value<String?> machineName,
      Value<String?> machineType,
      Value<String?> description,
      Value<String?> specification,
      Value<int> status,
      Value<String?> lastSync,
      Value<String?> updatedAt,
    });

class $$JobMachinesTableFilterComposer
    extends Composer<_$AppDatabase, $JobMachinesTable> {
  $$JobMachinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineType => $composableBuilder(
    column: $table.machineType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JobMachinesTableOrderingComposer
    extends Composer<_$AppDatabase, $JobMachinesTable> {
  $$JobMachinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineType => $composableBuilder(
    column: $table.machineType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JobMachinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobMachinesTable> {
  $$JobMachinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get jobId =>
      $composableBuilder(column: $table.jobId, builder: (column) => column);

  GeneratedColumn<String> get machineId =>
      $composableBuilder(column: $table.machineId, builder: (column) => column);

  GeneratedColumn<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get machineType => $composableBuilder(
    column: $table.machineType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$JobMachinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JobMachinesTable,
          DbJobMachine,
          $$JobMachinesTableFilterComposer,
          $$JobMachinesTableOrderingComposer,
          $$JobMachinesTableAnnotationComposer,
          $$JobMachinesTableCreateCompanionBuilder,
          $$JobMachinesTableUpdateCompanionBuilder,
          (
            DbJobMachine,
            BaseReferences<_$AppDatabase, $JobMachinesTable, DbJobMachine>,
          ),
          DbJobMachine,
          PrefetchHooks Function()
        > {
  $$JobMachinesTableTableManager(_$AppDatabase db, $JobMachinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobMachinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobMachinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobMachinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> machineName = const Value.absent(),
                Value<String?> machineType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> specification = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => JobMachinesCompanion(
                uid: uid,
                jobId: jobId,
                machineId: machineId,
                machineName: machineName,
                machineType: machineType,
                description: description,
                specification: specification,
                status: status,
                lastSync: lastSync,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> machineName = const Value.absent(),
                Value<String?> machineType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> specification = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => JobMachinesCompanion.insert(
                uid: uid,
                jobId: jobId,
                machineId: machineId,
                machineName: machineName,
                machineType: machineType,
                description: description,
                specification: specification,
                status: status,
                lastSync: lastSync,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JobMachinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JobMachinesTable,
      DbJobMachine,
      $$JobMachinesTableFilterComposer,
      $$JobMachinesTableOrderingComposer,
      $$JobMachinesTableAnnotationComposer,
      $$JobMachinesTableCreateCompanionBuilder,
      $$JobMachinesTableUpdateCompanionBuilder,
      (
        DbJobMachine,
        BaseReferences<_$AppDatabase, $JobMachinesTable, DbJobMachine>,
      ),
      DbJobMachine,
      PrefetchHooks Function()
    >;
typedef $$JobTagsTableCreateCompanionBuilder =
    JobTagsCompanion Function({
      Value<int> uid,
      Value<String?> tagId,
      Value<String?> jobId,
      Value<String?> machineId,
      Value<String?> tagName,
      Value<String?> tagType,
      Value<String?> tagGroupId,
      Value<String?> tagGroupName,
      Value<String?> description,
      Value<String?> specification,
      Value<String?> specMin,
      Value<String?> specMax,
      Value<String?> unit,
      Value<String?> queryStr,
      Value<int> status,
      Value<String?> lastSync,
      Value<String?> driftQueryStr,
      Value<String?> note,
      Value<String?> value,
      Value<String?> remark,
      Value<String?> createDate,
      Value<String?> createBy,
      Value<String?> valueType,
      Value<String?> tagSelectionValue,
      Value<String?> updatedAt,
    });
typedef $$JobTagsTableUpdateCompanionBuilder =
    JobTagsCompanion Function({
      Value<int> uid,
      Value<String?> tagId,
      Value<String?> jobId,
      Value<String?> machineId,
      Value<String?> tagName,
      Value<String?> tagType,
      Value<String?> tagGroupId,
      Value<String?> tagGroupName,
      Value<String?> description,
      Value<String?> specification,
      Value<String?> specMin,
      Value<String?> specMax,
      Value<String?> unit,
      Value<String?> queryStr,
      Value<int> status,
      Value<String?> lastSync,
      Value<String?> driftQueryStr,
      Value<String?> note,
      Value<String?> value,
      Value<String?> remark,
      Value<String?> createDate,
      Value<String?> createBy,
      Value<String?> valueType,
      Value<String?> tagSelectionValue,
      Value<String?> updatedAt,
    });

class $$JobTagsTableFilterComposer
    extends Composer<_$AppDatabase, $JobTagsTable> {
  $$JobTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagName => $composableBuilder(
    column: $table.tagName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagType => $composableBuilder(
    column: $table.tagType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagGroupId => $composableBuilder(
    column: $table.tagGroupId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagGroupName => $composableBuilder(
    column: $table.tagGroupName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specMin => $composableBuilder(
    column: $table.specMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specMax => $composableBuilder(
    column: $table.specMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get queryStr => $composableBuilder(
    column: $table.queryStr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get driftQueryStr => $composableBuilder(
    column: $table.driftQueryStr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createBy => $composableBuilder(
    column: $table.createBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueType => $composableBuilder(
    column: $table.valueType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagSelectionValue => $composableBuilder(
    column: $table.tagSelectionValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JobTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $JobTagsTable> {
  $$JobTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagName => $composableBuilder(
    column: $table.tagName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagType => $composableBuilder(
    column: $table.tagType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagGroupId => $composableBuilder(
    column: $table.tagGroupId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagGroupName => $composableBuilder(
    column: $table.tagGroupName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specMin => $composableBuilder(
    column: $table.specMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specMax => $composableBuilder(
    column: $table.specMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get queryStr => $composableBuilder(
    column: $table.queryStr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get driftQueryStr => $composableBuilder(
    column: $table.driftQueryStr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createBy => $composableBuilder(
    column: $table.createBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueType => $composableBuilder(
    column: $table.valueType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagSelectionValue => $composableBuilder(
    column: $table.tagSelectionValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JobTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobTagsTable> {
  $$JobTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get tagId =>
      $composableBuilder(column: $table.tagId, builder: (column) => column);

  GeneratedColumn<String> get jobId =>
      $composableBuilder(column: $table.jobId, builder: (column) => column);

  GeneratedColumn<String> get machineId =>
      $composableBuilder(column: $table.machineId, builder: (column) => column);

  GeneratedColumn<String> get tagName =>
      $composableBuilder(column: $table.tagName, builder: (column) => column);

  GeneratedColumn<String> get tagType =>
      $composableBuilder(column: $table.tagType, builder: (column) => column);

  GeneratedColumn<String> get tagGroupId => $composableBuilder(
    column: $table.tagGroupId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tagGroupName => $composableBuilder(
    column: $table.tagGroupName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specMin =>
      $composableBuilder(column: $table.specMin, builder: (column) => column);

  GeneratedColumn<String> get specMax =>
      $composableBuilder(column: $table.specMax, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get queryStr =>
      $composableBuilder(column: $table.queryStr, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<String> get driftQueryStr => $composableBuilder(
    column: $table.driftQueryStr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createBy =>
      $composableBuilder(column: $table.createBy, builder: (column) => column);

  GeneratedColumn<String> get valueType =>
      $composableBuilder(column: $table.valueType, builder: (column) => column);

  GeneratedColumn<String> get tagSelectionValue => $composableBuilder(
    column: $table.tagSelectionValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$JobTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JobTagsTable,
          DbJobTag,
          $$JobTagsTableFilterComposer,
          $$JobTagsTableOrderingComposer,
          $$JobTagsTableAnnotationComposer,
          $$JobTagsTableCreateCompanionBuilder,
          $$JobTagsTableUpdateCompanionBuilder,
          (DbJobTag, BaseReferences<_$AppDatabase, $JobTagsTable, DbJobTag>),
          DbJobTag,
          PrefetchHooks Function()
        > {
  $$JobTagsTableTableManager(_$AppDatabase db, $JobTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> tagId = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> tagName = const Value.absent(),
                Value<String?> tagType = const Value.absent(),
                Value<String?> tagGroupId = const Value.absent(),
                Value<String?> tagGroupName = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> specification = const Value.absent(),
                Value<String?> specMin = const Value.absent(),
                Value<String?> specMax = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String?> queryStr = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> driftQueryStr = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> value = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String?> createDate = const Value.absent(),
                Value<String?> createBy = const Value.absent(),
                Value<String?> valueType = const Value.absent(),
                Value<String?> tagSelectionValue = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => JobTagsCompanion(
                uid: uid,
                tagId: tagId,
                jobId: jobId,
                machineId: machineId,
                tagName: tagName,
                tagType: tagType,
                tagGroupId: tagGroupId,
                tagGroupName: tagGroupName,
                description: description,
                specification: specification,
                specMin: specMin,
                specMax: specMax,
                unit: unit,
                queryStr: queryStr,
                status: status,
                lastSync: lastSync,
                driftQueryStr: driftQueryStr,
                note: note,
                value: value,
                remark: remark,
                createDate: createDate,
                createBy: createBy,
                valueType: valueType,
                tagSelectionValue: tagSelectionValue,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> tagId = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> tagName = const Value.absent(),
                Value<String?> tagType = const Value.absent(),
                Value<String?> tagGroupId = const Value.absent(),
                Value<String?> tagGroupName = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> specification = const Value.absent(),
                Value<String?> specMin = const Value.absent(),
                Value<String?> specMax = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String?> queryStr = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> driftQueryStr = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> value = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String?> createDate = const Value.absent(),
                Value<String?> createBy = const Value.absent(),
                Value<String?> valueType = const Value.absent(),
                Value<String?> tagSelectionValue = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => JobTagsCompanion.insert(
                uid: uid,
                tagId: tagId,
                jobId: jobId,
                machineId: machineId,
                tagName: tagName,
                tagType: tagType,
                tagGroupId: tagGroupId,
                tagGroupName: tagGroupName,
                description: description,
                specification: specification,
                specMin: specMin,
                specMax: specMax,
                unit: unit,
                queryStr: queryStr,
                status: status,
                lastSync: lastSync,
                driftQueryStr: driftQueryStr,
                note: note,
                value: value,
                remark: remark,
                createDate: createDate,
                createBy: createBy,
                valueType: valueType,
                tagSelectionValue: tagSelectionValue,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JobTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JobTagsTable,
      DbJobTag,
      $$JobTagsTableFilterComposer,
      $$JobTagsTableOrderingComposer,
      $$JobTagsTableAnnotationComposer,
      $$JobTagsTableCreateCompanionBuilder,
      $$JobTagsTableUpdateCompanionBuilder,
      (DbJobTag, BaseReferences<_$AppDatabase, $JobTagsTable, DbJobTag>),
      DbJobTag,
      PrefetchHooks Function()
    >;
typedef $$ProblemsTableCreateCompanionBuilder =
    ProblemsCompanion Function({
      Value<int> uid,
      Value<String?> problemId,
      Value<String?> problemName,
      Value<String?> problemDescription,
      Value<int> problemStatus,
      Value<String?> problemSolvingDescription,
      Value<String?> documentId,
      Value<String?> machineId,
      Value<String?> machineName,
      Value<String?> jobId,
      Value<String?> tagId,
      Value<String?> tagName,
      Value<String?> tagType,
      Value<String?> description,
      Value<String?> note,
      Value<String?> specification,
      Value<String?> specMin,
      Value<String?> specMax,
      Value<String?> unit,
      Value<String?> value,
      Value<String?> remark,
      Value<String> unReadable,
      Value<String?> lastSync,
      Value<String?> problemSolvingBy,
      Value<int> syncStatus,
      Value<String?> updatedAt,
    });
typedef $$ProblemsTableUpdateCompanionBuilder =
    ProblemsCompanion Function({
      Value<int> uid,
      Value<String?> problemId,
      Value<String?> problemName,
      Value<String?> problemDescription,
      Value<int> problemStatus,
      Value<String?> problemSolvingDescription,
      Value<String?> documentId,
      Value<String?> machineId,
      Value<String?> machineName,
      Value<String?> jobId,
      Value<String?> tagId,
      Value<String?> tagName,
      Value<String?> tagType,
      Value<String?> description,
      Value<String?> note,
      Value<String?> specification,
      Value<String?> specMin,
      Value<String?> specMax,
      Value<String?> unit,
      Value<String?> value,
      Value<String?> remark,
      Value<String> unReadable,
      Value<String?> lastSync,
      Value<String?> problemSolvingBy,
      Value<int> syncStatus,
      Value<String?> updatedAt,
    });

class $$ProblemsTableFilterComposer
    extends Composer<_$AppDatabase, $ProblemsTable> {
  $$ProblemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get problemId => $composableBuilder(
    column: $table.problemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get problemName => $composableBuilder(
    column: $table.problemName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get problemDescription => $composableBuilder(
    column: $table.problemDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get problemStatus => $composableBuilder(
    column: $table.problemStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get problemSolvingDescription => $composableBuilder(
    column: $table.problemSolvingDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagName => $composableBuilder(
    column: $table.tagName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagType => $composableBuilder(
    column: $table.tagType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specMin => $composableBuilder(
    column: $table.specMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specMax => $composableBuilder(
    column: $table.specMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unReadable => $composableBuilder(
    column: $table.unReadable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get problemSolvingBy => $composableBuilder(
    column: $table.problemSolvingBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProblemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProblemsTable> {
  $$ProblemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get problemId => $composableBuilder(
    column: $table.problemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get problemName => $composableBuilder(
    column: $table.problemName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get problemDescription => $composableBuilder(
    column: $table.problemDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get problemStatus => $composableBuilder(
    column: $table.problemStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get problemSolvingDescription => $composableBuilder(
    column: $table.problemSolvingDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagName => $composableBuilder(
    column: $table.tagName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagType => $composableBuilder(
    column: $table.tagType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specMin => $composableBuilder(
    column: $table.specMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specMax => $composableBuilder(
    column: $table.specMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unReadable => $composableBuilder(
    column: $table.unReadable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get problemSolvingBy => $composableBuilder(
    column: $table.problemSolvingBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProblemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProblemsTable> {
  $$ProblemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get problemId =>
      $composableBuilder(column: $table.problemId, builder: (column) => column);

  GeneratedColumn<String> get problemName => $composableBuilder(
    column: $table.problemName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get problemDescription => $composableBuilder(
    column: $table.problemDescription,
    builder: (column) => column,
  );

  GeneratedColumn<int> get problemStatus => $composableBuilder(
    column: $table.problemStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get problemSolvingDescription => $composableBuilder(
    column: $table.problemSolvingDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get machineId =>
      $composableBuilder(column: $table.machineId, builder: (column) => column);

  GeneratedColumn<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jobId =>
      $composableBuilder(column: $table.jobId, builder: (column) => column);

  GeneratedColumn<String> get tagId =>
      $composableBuilder(column: $table.tagId, builder: (column) => column);

  GeneratedColumn<String> get tagName =>
      $composableBuilder(column: $table.tagName, builder: (column) => column);

  GeneratedColumn<String> get tagType =>
      $composableBuilder(column: $table.tagType, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specMin =>
      $composableBuilder(column: $table.specMin, builder: (column) => column);

  GeneratedColumn<String> get specMax =>
      $composableBuilder(column: $table.specMax, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get unReadable => $composableBuilder(
    column: $table.unReadable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<String> get problemSolvingBy => $composableBuilder(
    column: $table.problemSolvingBy,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProblemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProblemsTable,
          DbProblem,
          $$ProblemsTableFilterComposer,
          $$ProblemsTableOrderingComposer,
          $$ProblemsTableAnnotationComposer,
          $$ProblemsTableCreateCompanionBuilder,
          $$ProblemsTableUpdateCompanionBuilder,
          (DbProblem, BaseReferences<_$AppDatabase, $ProblemsTable, DbProblem>),
          DbProblem,
          PrefetchHooks Function()
        > {
  $$ProblemsTableTableManager(_$AppDatabase db, $ProblemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProblemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProblemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProblemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> problemId = const Value.absent(),
                Value<String?> problemName = const Value.absent(),
                Value<String?> problemDescription = const Value.absent(),
                Value<int> problemStatus = const Value.absent(),
                Value<String?> problemSolvingDescription = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> machineName = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> tagId = const Value.absent(),
                Value<String?> tagName = const Value.absent(),
                Value<String?> tagType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> specification = const Value.absent(),
                Value<String?> specMin = const Value.absent(),
                Value<String?> specMax = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String?> value = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> unReadable = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> problemSolvingBy = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => ProblemsCompanion(
                uid: uid,
                problemId: problemId,
                problemName: problemName,
                problemDescription: problemDescription,
                problemStatus: problemStatus,
                problemSolvingDescription: problemSolvingDescription,
                documentId: documentId,
                machineId: machineId,
                machineName: machineName,
                jobId: jobId,
                tagId: tagId,
                tagName: tagName,
                tagType: tagType,
                description: description,
                note: note,
                specification: specification,
                specMin: specMin,
                specMax: specMax,
                unit: unit,
                value: value,
                remark: remark,
                unReadable: unReadable,
                lastSync: lastSync,
                problemSolvingBy: problemSolvingBy,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> problemId = const Value.absent(),
                Value<String?> problemName = const Value.absent(),
                Value<String?> problemDescription = const Value.absent(),
                Value<int> problemStatus = const Value.absent(),
                Value<String?> problemSolvingDescription = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> machineName = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> tagId = const Value.absent(),
                Value<String?> tagName = const Value.absent(),
                Value<String?> tagType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> specification = const Value.absent(),
                Value<String?> specMin = const Value.absent(),
                Value<String?> specMax = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<String?> value = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> unReadable = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> problemSolvingBy = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => ProblemsCompanion.insert(
                uid: uid,
                problemId: problemId,
                problemName: problemName,
                problemDescription: problemDescription,
                problemStatus: problemStatus,
                problemSolvingDescription: problemSolvingDescription,
                documentId: documentId,
                machineId: machineId,
                machineName: machineName,
                jobId: jobId,
                tagId: tagId,
                tagName: tagName,
                tagType: tagType,
                description: description,
                note: note,
                specification: specification,
                specMin: specMin,
                specMax: specMax,
                unit: unit,
                value: value,
                remark: remark,
                unReadable: unReadable,
                lastSync: lastSync,
                problemSolvingBy: problemSolvingBy,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProblemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProblemsTable,
      DbProblem,
      $$ProblemsTableFilterComposer,
      $$ProblemsTableOrderingComposer,
      $$ProblemsTableAnnotationComposer,
      $$ProblemsTableCreateCompanionBuilder,
      $$ProblemsTableUpdateCompanionBuilder,
      (DbProblem, BaseReferences<_$AppDatabase, $ProblemsTable, DbProblem>),
      DbProblem,
      PrefetchHooks Function()
    >;
typedef $$SyncsTableCreateCompanionBuilder =
    SyncsCompanion Function({
      Value<int> uid,
      Value<String?> syncId,
      Value<String?> syncName,
      Value<String?> lastSync,
      Value<int> syncStatus,
      Value<String?> nextSync,
      Value<String?> updatedAt,
    });
typedef $$SyncsTableUpdateCompanionBuilder =
    SyncsCompanion Function({
      Value<int> uid,
      Value<String?> syncId,
      Value<String?> syncName,
      Value<String?> lastSync,
      Value<int> syncStatus,
      Value<String?> nextSync,
      Value<String?> updatedAt,
    });

class $$SyncsTableFilterComposer extends Composer<_$AppDatabase, $SyncsTable> {
  $$SyncsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncId => $composableBuilder(
    column: $table.syncId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncName => $composableBuilder(
    column: $table.syncName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextSync => $composableBuilder(
    column: $table.nextSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncsTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncsTable> {
  $$SyncsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncId => $composableBuilder(
    column: $table.syncId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncName => $composableBuilder(
    column: $table.syncName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextSync => $composableBuilder(
    column: $table.nextSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncsTable> {
  $$SyncsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get syncId =>
      $composableBuilder(column: $table.syncId, builder: (column) => column);

  GeneratedColumn<String> get syncName =>
      $composableBuilder(column: $table.syncName, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nextSync =>
      $composableBuilder(column: $table.nextSync, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncsTable,
          DbSync,
          $$SyncsTableFilterComposer,
          $$SyncsTableOrderingComposer,
          $$SyncsTableAnnotationComposer,
          $$SyncsTableCreateCompanionBuilder,
          $$SyncsTableUpdateCompanionBuilder,
          (DbSync, BaseReferences<_$AppDatabase, $SyncsTable, DbSync>),
          DbSync,
          PrefetchHooks Function()
        > {
  $$SyncsTableTableManager(_$AppDatabase db, $SyncsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> syncId = const Value.absent(),
                Value<String?> syncName = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> nextSync = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => SyncsCompanion(
                uid: uid,
                syncId: syncId,
                syncName: syncName,
                lastSync: lastSync,
                syncStatus: syncStatus,
                nextSync: nextSync,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> syncId = const Value.absent(),
                Value<String?> syncName = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> nextSync = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => SyncsCompanion.insert(
                uid: uid,
                syncId: syncId,
                syncName: syncName,
                lastSync: lastSync,
                syncStatus: syncStatus,
                nextSync: nextSync,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncsTable,
      DbSync,
      $$SyncsTableFilterComposer,
      $$SyncsTableOrderingComposer,
      $$SyncsTableAnnotationComposer,
      $$SyncsTableCreateCompanionBuilder,
      $$SyncsTableUpdateCompanionBuilder,
      (DbSync, BaseReferences<_$AppDatabase, $SyncsTable, DbSync>),
      DbSync,
      PrefetchHooks Function()
    >;
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> uid,
      Value<String?> userId,
      Value<String?> userCode,
      Value<String?> password,
      Value<String?> userName,
      Value<String?> position,
      Value<int> status,
      Value<String?> lastSync,
      Value<String?> updatedAt,
      Value<bool> isLocalSessionActive,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> uid,
      Value<String?> userId,
      Value<String?> userCode,
      Value<String?> password,
      Value<String?> userName,
      Value<String?> position,
      Value<int> status,
      Value<String?> lastSync,
      Value<String?> updatedAt,
      Value<bool> isLocalSessionActive,
    });

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userCode => $composableBuilder(
    column: $table.userCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userName => $composableBuilder(
    column: $table.userName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLocalSessionActive => $composableBuilder(
    column: $table.isLocalSessionActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userCode => $composableBuilder(
    column: $table.userCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userName => $composableBuilder(
    column: $table.userName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLocalSessionActive => $composableBuilder(
    column: $table.isLocalSessionActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get userCode =>
      $composableBuilder(column: $table.userCode, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get userName =>
      $composableBuilder(column: $table.userName, builder: (column) => column);

  GeneratedColumn<String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isLocalSessionActive => $composableBuilder(
    column: $table.isLocalSessionActive,
    builder: (column) => column,
  );
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          DbUser,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (DbUser, BaseReferences<_$AppDatabase, $UsersTable, DbUser>),
          DbUser,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> userCode = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<String?> userName = const Value.absent(),
                Value<String?> position = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<bool> isLocalSessionActive = const Value.absent(),
              }) => UsersCompanion(
                uid: uid,
                userId: userId,
                userCode: userCode,
                password: password,
                userName: userName,
                position: position,
                status: status,
                lastSync: lastSync,
                updatedAt: updatedAt,
                isLocalSessionActive: isLocalSessionActive,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> userCode = const Value.absent(),
                Value<String?> password = const Value.absent(),
                Value<String?> userName = const Value.absent(),
                Value<String?> position = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<bool> isLocalSessionActive = const Value.absent(),
              }) => UsersCompanion.insert(
                uid: uid,
                userId: userId,
                userCode: userCode,
                password: password,
                userName: userName,
                position: position,
                status: status,
                lastSync: lastSync,
                updatedAt: updatedAt,
                isLocalSessionActive: isLocalSessionActive,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      DbUser,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (DbUser, BaseReferences<_$AppDatabase, $UsersTable, DbUser>),
      DbUser,
      PrefetchHooks Function()
    >;
typedef $$ImagesTableCreateCompanionBuilder =
    ImagesCompanion Function({
      Value<int> uid,
      Value<String?> guid,
      Value<String?> imageIndex,
      Value<String?> picture,
      Value<String?> imageUri,
      Value<String?> filename,
      Value<String?> filepath,
      Value<String?> documentId,
      Value<String?> jobId,
      Value<String?> machineId,
      Value<String?> tagId,
      Value<String?> problemId,
      Value<String?> createDate,
      Value<int> status,
      Value<String?> lastSync,
      Value<int> statusSync,
      Value<String?> updatedAt,
    });
typedef $$ImagesTableUpdateCompanionBuilder =
    ImagesCompanion Function({
      Value<int> uid,
      Value<String?> guid,
      Value<String?> imageIndex,
      Value<String?> picture,
      Value<String?> imageUri,
      Value<String?> filename,
      Value<String?> filepath,
      Value<String?> documentId,
      Value<String?> jobId,
      Value<String?> machineId,
      Value<String?> tagId,
      Value<String?> problemId,
      Value<String?> createDate,
      Value<int> status,
      Value<String?> lastSync,
      Value<int> statusSync,
      Value<String?> updatedAt,
    });

class $$ImagesTableFilterComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guid => $composableBuilder(
    column: $table.guid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageIndex => $composableBuilder(
    column: $table.imageIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get picture => $composableBuilder(
    column: $table.picture,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUri => $composableBuilder(
    column: $table.imageUri,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filepath => $composableBuilder(
    column: $table.filepath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get problemId => $composableBuilder(
    column: $table.problemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get statusSync => $composableBuilder(
    column: $table.statusSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guid => $composableBuilder(
    column: $table.guid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageIndex => $composableBuilder(
    column: $table.imageIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get picture => $composableBuilder(
    column: $table.picture,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUri => $composableBuilder(
    column: $table.imageUri,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filepath => $composableBuilder(
    column: $table.filepath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get problemId => $composableBuilder(
    column: $table.problemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get statusSync => $composableBuilder(
    column: $table.statusSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get guid =>
      $composableBuilder(column: $table.guid, builder: (column) => column);

  GeneratedColumn<String> get imageIndex => $composableBuilder(
    column: $table.imageIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get picture =>
      $composableBuilder(column: $table.picture, builder: (column) => column);

  GeneratedColumn<String> get imageUri =>
      $composableBuilder(column: $table.imageUri, builder: (column) => column);

  GeneratedColumn<String> get filename =>
      $composableBuilder(column: $table.filename, builder: (column) => column);

  GeneratedColumn<String> get filepath =>
      $composableBuilder(column: $table.filepath, builder: (column) => column);

  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jobId =>
      $composableBuilder(column: $table.jobId, builder: (column) => column);

  GeneratedColumn<String> get machineId =>
      $composableBuilder(column: $table.machineId, builder: (column) => column);

  GeneratedColumn<String> get tagId =>
      $composableBuilder(column: $table.tagId, builder: (column) => column);

  GeneratedColumn<String> get problemId =>
      $composableBuilder(column: $table.problemId, builder: (column) => column);

  GeneratedColumn<String> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<int> get statusSync => $composableBuilder(
    column: $table.statusSync,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ImagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ImagesTable,
          DbImage,
          $$ImagesTableFilterComposer,
          $$ImagesTableOrderingComposer,
          $$ImagesTableAnnotationComposer,
          $$ImagesTableCreateCompanionBuilder,
          $$ImagesTableUpdateCompanionBuilder,
          (DbImage, BaseReferences<_$AppDatabase, $ImagesTable, DbImage>),
          DbImage,
          PrefetchHooks Function()
        > {
  $$ImagesTableTableManager(_$AppDatabase db, $ImagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> guid = const Value.absent(),
                Value<String?> imageIndex = const Value.absent(),
                Value<String?> picture = const Value.absent(),
                Value<String?> imageUri = const Value.absent(),
                Value<String?> filename = const Value.absent(),
                Value<String?> filepath = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> tagId = const Value.absent(),
                Value<String?> problemId = const Value.absent(),
                Value<String?> createDate = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> statusSync = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => ImagesCompanion(
                uid: uid,
                guid: guid,
                imageIndex: imageIndex,
                picture: picture,
                imageUri: imageUri,
                filename: filename,
                filepath: filepath,
                documentId: documentId,
                jobId: jobId,
                machineId: machineId,
                tagId: tagId,
                problemId: problemId,
                createDate: createDate,
                status: status,
                lastSync: lastSync,
                statusSync: statusSync,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> guid = const Value.absent(),
                Value<String?> imageIndex = const Value.absent(),
                Value<String?> picture = const Value.absent(),
                Value<String?> imageUri = const Value.absent(),
                Value<String?> filename = const Value.absent(),
                Value<String?> filepath = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> jobId = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> tagId = const Value.absent(),
                Value<String?> problemId = const Value.absent(),
                Value<String?> createDate = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> statusSync = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => ImagesCompanion.insert(
                uid: uid,
                guid: guid,
                imageIndex: imageIndex,
                picture: picture,
                imageUri: imageUri,
                filename: filename,
                filepath: filepath,
                documentId: documentId,
                jobId: jobId,
                machineId: machineId,
                tagId: tagId,
                problemId: problemId,
                createDate: createDate,
                status: status,
                lastSync: lastSync,
                statusSync: statusSync,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ImagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ImagesTable,
      DbImage,
      $$ImagesTableFilterComposer,
      $$ImagesTableOrderingComposer,
      $$ImagesTableAnnotationComposer,
      $$ImagesTableCreateCompanionBuilder,
      $$ImagesTableUpdateCompanionBuilder,
      (DbImage, BaseReferences<_$AppDatabase, $ImagesTable, DbImage>),
      DbImage,
      PrefetchHooks Function()
    >;
typedef $$CheckSheetMasterImagesTableCreateCompanionBuilder =
    CheckSheetMasterImagesCompanion Function({
      Value<int> id,
      Value<int?> machineId,
      Value<int?> jobId,
      Value<int?> tagId,
      Value<String?> path,
      Value<int?> status,
      Value<DateTime?> createDate,
      Value<String?> createBy,
      Value<DateTime?> lastSync,
      Value<int?> syncStatus,
      Value<String?> updatedAt,
      Value<int> newImage,
    });
typedef $$CheckSheetMasterImagesTableUpdateCompanionBuilder =
    CheckSheetMasterImagesCompanion Function({
      Value<int> id,
      Value<int?> machineId,
      Value<int?> jobId,
      Value<int?> tagId,
      Value<String?> path,
      Value<int?> status,
      Value<DateTime?> createDate,
      Value<String?> createBy,
      Value<DateTime?> lastSync,
      Value<int?> syncStatus,
      Value<String?> updatedAt,
      Value<int> newImage,
    });

class $$CheckSheetMasterImagesTableFilterComposer
    extends Composer<_$AppDatabase, $CheckSheetMasterImagesTable> {
  $$CheckSheetMasterImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createBy => $composableBuilder(
    column: $table.createBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get newImage => $composableBuilder(
    column: $table.newImage,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CheckSheetMasterImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $CheckSheetMasterImagesTable> {
  $$CheckSheetMasterImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jobId => $composableBuilder(
    column: $table.jobId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tagId => $composableBuilder(
    column: $table.tagId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createBy => $composableBuilder(
    column: $table.createBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get newImage => $composableBuilder(
    column: $table.newImage,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CheckSheetMasterImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CheckSheetMasterImagesTable> {
  $$CheckSheetMasterImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get machineId =>
      $composableBuilder(column: $table.machineId, builder: (column) => column);

  GeneratedColumn<int> get jobId =>
      $composableBuilder(column: $table.jobId, builder: (column) => column);

  GeneratedColumn<int> get tagId =>
      $composableBuilder(column: $table.tagId, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createDate => $composableBuilder(
    column: $table.createDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createBy =>
      $composableBuilder(column: $table.createBy, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get newImage =>
      $composableBuilder(column: $table.newImage, builder: (column) => column);
}

class $$CheckSheetMasterImagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CheckSheetMasterImagesTable,
          DbCheckSheetMasterImage,
          $$CheckSheetMasterImagesTableFilterComposer,
          $$CheckSheetMasterImagesTableOrderingComposer,
          $$CheckSheetMasterImagesTableAnnotationComposer,
          $$CheckSheetMasterImagesTableCreateCompanionBuilder,
          $$CheckSheetMasterImagesTableUpdateCompanionBuilder,
          (
            DbCheckSheetMasterImage,
            BaseReferences<
              _$AppDatabase,
              $CheckSheetMasterImagesTable,
              DbCheckSheetMasterImage
            >,
          ),
          DbCheckSheetMasterImage,
          PrefetchHooks Function()
        > {
  $$CheckSheetMasterImagesTableTableManager(
    _$AppDatabase db,
    $CheckSheetMasterImagesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CheckSheetMasterImagesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CheckSheetMasterImagesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CheckSheetMasterImagesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> machineId = const Value.absent(),
                Value<int?> jobId = const Value.absent(),
                Value<int?> tagId = const Value.absent(),
                Value<String?> path = const Value.absent(),
                Value<int?> status = const Value.absent(),
                Value<DateTime?> createDate = const Value.absent(),
                Value<String?> createBy = const Value.absent(),
                Value<DateTime?> lastSync = const Value.absent(),
                Value<int?> syncStatus = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<int> newImage = const Value.absent(),
              }) => CheckSheetMasterImagesCompanion(
                id: id,
                machineId: machineId,
                jobId: jobId,
                tagId: tagId,
                path: path,
                status: status,
                createDate: createDate,
                createBy: createBy,
                lastSync: lastSync,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                newImage: newImage,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> machineId = const Value.absent(),
                Value<int?> jobId = const Value.absent(),
                Value<int?> tagId = const Value.absent(),
                Value<String?> path = const Value.absent(),
                Value<int?> status = const Value.absent(),
                Value<DateTime?> createDate = const Value.absent(),
                Value<String?> createBy = const Value.absent(),
                Value<DateTime?> lastSync = const Value.absent(),
                Value<int?> syncStatus = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<int> newImage = const Value.absent(),
              }) => CheckSheetMasterImagesCompanion.insert(
                id: id,
                machineId: machineId,
                jobId: jobId,
                tagId: tagId,
                path: path,
                status: status,
                createDate: createDate,
                createBy: createBy,
                lastSync: lastSync,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
                newImage: newImage,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CheckSheetMasterImagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CheckSheetMasterImagesTable,
      DbCheckSheetMasterImage,
      $$CheckSheetMasterImagesTableFilterComposer,
      $$CheckSheetMasterImagesTableOrderingComposer,
      $$CheckSheetMasterImagesTableAnnotationComposer,
      $$CheckSheetMasterImagesTableCreateCompanionBuilder,
      $$CheckSheetMasterImagesTableUpdateCompanionBuilder,
      (
        DbCheckSheetMasterImage,
        BaseReferences<
          _$AppDatabase,
          $CheckSheetMasterImagesTable,
          DbCheckSheetMasterImage
        >,
      ),
      DbCheckSheetMasterImage,
      PrefetchHooks Function()
    >;
typedef $$DocumentTimeLogsTableCreateCompanionBuilder =
    DocumentTimeLogsCompanion Function({
      Value<int> uid,
      Value<String?> documentId,
      Value<int> logType,
      Value<String?> logTime,
      Value<String?> remark,
    });
typedef $$DocumentTimeLogsTableUpdateCompanionBuilder =
    DocumentTimeLogsCompanion Function({
      Value<int> uid,
      Value<String?> documentId,
      Value<int> logType,
      Value<String?> logTime,
      Value<String?> remark,
    });

class $$DocumentTimeLogsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentTimeLogsTable> {
  $$DocumentTimeLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get logType => $composableBuilder(
    column: $table.logType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logTime => $composableBuilder(
    column: $table.logTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DocumentTimeLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentTimeLogsTable> {
  $$DocumentTimeLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get logType => $composableBuilder(
    column: $table.logType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logTime => $composableBuilder(
    column: $table.logTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentTimeLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentTimeLogsTable> {
  $$DocumentTimeLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get logType =>
      $composableBuilder(column: $table.logType, builder: (column) => column);

  GeneratedColumn<String> get logTime =>
      $composableBuilder(column: $table.logTime, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);
}

class $$DocumentTimeLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentTimeLogsTable,
          DbDocumentTimeLog,
          $$DocumentTimeLogsTableFilterComposer,
          $$DocumentTimeLogsTableOrderingComposer,
          $$DocumentTimeLogsTableAnnotationComposer,
          $$DocumentTimeLogsTableCreateCompanionBuilder,
          $$DocumentTimeLogsTableUpdateCompanionBuilder,
          (
            DbDocumentTimeLog,
            BaseReferences<
              _$AppDatabase,
              $DocumentTimeLogsTable,
              DbDocumentTimeLog
            >,
          ),
          DbDocumentTimeLog,
          PrefetchHooks Function()
        > {
  $$DocumentTimeLogsTableTableManager(
    _$AppDatabase db,
    $DocumentTimeLogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentTimeLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentTimeLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentTimeLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<int> logType = const Value.absent(),
                Value<String?> logTime = const Value.absent(),
                Value<String?> remark = const Value.absent(),
              }) => DocumentTimeLogsCompanion(
                uid: uid,
                documentId: documentId,
                logType: logType,
                logTime: logTime,
                remark: remark,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<int> logType = const Value.absent(),
                Value<String?> logTime = const Value.absent(),
                Value<String?> remark = const Value.absent(),
              }) => DocumentTimeLogsCompanion.insert(
                uid: uid,
                documentId: documentId,
                logType: logType,
                logTime: logTime,
                remark: remark,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DocumentTimeLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentTimeLogsTable,
      DbDocumentTimeLog,
      $$DocumentTimeLogsTableFilterComposer,
      $$DocumentTimeLogsTableOrderingComposer,
      $$DocumentTimeLogsTableAnnotationComposer,
      $$DocumentTimeLogsTableCreateCompanionBuilder,
      $$DocumentTimeLogsTableUpdateCompanionBuilder,
      (
        DbDocumentTimeLog,
        BaseReferences<
          _$AppDatabase,
          $DocumentTimeLogsTable,
          DbDocumentTimeLog
        >,
      ),
      DbDocumentTimeLog,
      PrefetchHooks Function()
    >;
typedef $$JobTestSetsTableCreateCompanionBuilder =
    JobTestSetsCompanion Function({
      Value<int> uid,
      required String recId,
      Value<String?> documentId,
      Value<String?> setItemNo,
      Value<String?> registerDateTime,
      Value<String?> registerUser,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
    });
typedef $$JobTestSetsTableUpdateCompanionBuilder =
    JobTestSetsCompanion Function({
      Value<int> uid,
      Value<String> recId,
      Value<String?> documentId,
      Value<String?> setItemNo,
      Value<String?> registerDateTime,
      Value<String?> registerUser,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
    });

class $$JobTestSetsTableFilterComposer
    extends Composer<_$AppDatabase, $JobTestSetsTable> {
  $$JobTestSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get setItemNo => $composableBuilder(
    column: $table.setItemNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registerDateTime => $composableBuilder(
    column: $table.registerDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registerUser => $composableBuilder(
    column: $table.registerUser,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JobTestSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $JobTestSetsTable> {
  $$JobTestSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get setItemNo => $composableBuilder(
    column: $table.setItemNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registerDateTime => $composableBuilder(
    column: $table.registerDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registerUser => $composableBuilder(
    column: $table.registerUser,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JobTestSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobTestSetsTable> {
  $$JobTestSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get recId =>
      $composableBuilder(column: $table.recId, builder: (column) => column);

  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get setItemNo =>
      $composableBuilder(column: $table.setItemNo, builder: (column) => column);

  GeneratedColumn<String> get registerDateTime => $composableBuilder(
    column: $table.registerDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registerUser => $composableBuilder(
    column: $table.registerUser,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$JobTestSetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JobTestSetsTable,
          DbJobTestSet,
          $$JobTestSetsTableFilterComposer,
          $$JobTestSetsTableOrderingComposer,
          $$JobTestSetsTableAnnotationComposer,
          $$JobTestSetsTableCreateCompanionBuilder,
          $$JobTestSetsTableUpdateCompanionBuilder,
          (
            DbJobTestSet,
            BaseReferences<_$AppDatabase, $JobTestSetsTable, DbJobTestSet>,
          ),
          DbJobTestSet,
          PrefetchHooks Function()
        > {
  $$JobTestSetsTableTableManager(_$AppDatabase db, $JobTestSetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobTestSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobTestSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobTestSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String> recId = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> setItemNo = const Value.absent(),
                Value<String?> registerDateTime = const Value.absent(),
                Value<String?> registerUser = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
              }) => JobTestSetsCompanion(
                uid: uid,
                recId: recId,
                documentId: documentId,
                setItemNo: setItemNo,
                registerDateTime: registerDateTime,
                registerUser: registerUser,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                required String recId,
                Value<String?> documentId = const Value.absent(),
                Value<String?> setItemNo = const Value.absent(),
                Value<String?> registerDateTime = const Value.absent(),
                Value<String?> registerUser = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
              }) => JobTestSetsCompanion.insert(
                uid: uid,
                recId: recId,
                documentId: documentId,
                setItemNo: setItemNo,
                registerDateTime: registerDateTime,
                registerUser: registerUser,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JobTestSetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JobTestSetsTable,
      DbJobTestSet,
      $$JobTestSetsTableFilterComposer,
      $$JobTestSetsTableOrderingComposer,
      $$JobTestSetsTableAnnotationComposer,
      $$JobTestSetsTableCreateCompanionBuilder,
      $$JobTestSetsTableUpdateCompanionBuilder,
      (
        DbJobTestSet,
        BaseReferences<_$AppDatabase, $JobTestSetsTable, DbJobTestSet>,
      ),
      DbJobTestSet,
      PrefetchHooks Function()
    >;
typedef $$RunningJobMachinesTableCreateCompanionBuilder =
    RunningJobMachinesCompanion Function({
      Value<int> uid,
      required String recId,
      Value<String?> documentId,
      Value<String?> machineNo,
      Value<String?> registerDateTime,
      Value<String?> registerUser,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
    });
typedef $$RunningJobMachinesTableUpdateCompanionBuilder =
    RunningJobMachinesCompanion Function({
      Value<int> uid,
      Value<String> recId,
      Value<String?> documentId,
      Value<String?> machineNo,
      Value<String?> registerDateTime,
      Value<String?> registerUser,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
    });

class $$RunningJobMachinesTableFilterComposer
    extends Composer<_$AppDatabase, $RunningJobMachinesTable> {
  $$RunningJobMachinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineNo => $composableBuilder(
    column: $table.machineNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registerDateTime => $composableBuilder(
    column: $table.registerDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registerUser => $composableBuilder(
    column: $table.registerUser,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RunningJobMachinesTableOrderingComposer
    extends Composer<_$AppDatabase, $RunningJobMachinesTable> {
  $$RunningJobMachinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineNo => $composableBuilder(
    column: $table.machineNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registerDateTime => $composableBuilder(
    column: $table.registerDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registerUser => $composableBuilder(
    column: $table.registerUser,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RunningJobMachinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RunningJobMachinesTable> {
  $$RunningJobMachinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get recId =>
      $composableBuilder(column: $table.recId, builder: (column) => column);

  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get machineNo =>
      $composableBuilder(column: $table.machineNo, builder: (column) => column);

  GeneratedColumn<String> get registerDateTime => $composableBuilder(
    column: $table.registerDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registerUser => $composableBuilder(
    column: $table.registerUser,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$RunningJobMachinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RunningJobMachinesTable,
          DbRunningJobMachine,
          $$RunningJobMachinesTableFilterComposer,
          $$RunningJobMachinesTableOrderingComposer,
          $$RunningJobMachinesTableAnnotationComposer,
          $$RunningJobMachinesTableCreateCompanionBuilder,
          $$RunningJobMachinesTableUpdateCompanionBuilder,
          (
            DbRunningJobMachine,
            BaseReferences<
              _$AppDatabase,
              $RunningJobMachinesTable,
              DbRunningJobMachine
            >,
          ),
          DbRunningJobMachine,
          PrefetchHooks Function()
        > {
  $$RunningJobMachinesTableTableManager(
    _$AppDatabase db,
    $RunningJobMachinesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RunningJobMachinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RunningJobMachinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RunningJobMachinesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String> recId = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> machineNo = const Value.absent(),
                Value<String?> registerDateTime = const Value.absent(),
                Value<String?> registerUser = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
              }) => RunningJobMachinesCompanion(
                uid: uid,
                recId: recId,
                documentId: documentId,
                machineNo: machineNo,
                registerDateTime: registerDateTime,
                registerUser: registerUser,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                required String recId,
                Value<String?> documentId = const Value.absent(),
                Value<String?> machineNo = const Value.absent(),
                Value<String?> registerDateTime = const Value.absent(),
                Value<String?> registerUser = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
              }) => RunningJobMachinesCompanion.insert(
                uid: uid,
                recId: recId,
                documentId: documentId,
                machineNo: machineNo,
                registerDateTime: registerDateTime,
                registerUser: registerUser,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RunningJobMachinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RunningJobMachinesTable,
      DbRunningJobMachine,
      $$RunningJobMachinesTableFilterComposer,
      $$RunningJobMachinesTableOrderingComposer,
      $$RunningJobMachinesTableAnnotationComposer,
      $$RunningJobMachinesTableCreateCompanionBuilder,
      $$RunningJobMachinesTableUpdateCompanionBuilder,
      (
        DbRunningJobMachine,
        BaseReferences<
          _$AppDatabase,
          $RunningJobMachinesTable,
          DbRunningJobMachine
        >,
      ),
      DbRunningJobMachine,
      PrefetchHooks Function()
    >;
typedef $$JobWorkingTimesTableCreateCompanionBuilder =
    JobWorkingTimesCompanion Function({
      Value<int> uid,
      Value<String?> documentId,
      Value<String?> userId,
      Value<String?> activityId,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
    });
typedef $$JobWorkingTimesTableUpdateCompanionBuilder =
    JobWorkingTimesCompanion Function({
      Value<int> uid,
      Value<String?> documentId,
      Value<String?> userId,
      Value<String?> activityId,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
    });

class $$JobWorkingTimesTableFilterComposer
    extends Composer<_$AppDatabase, $JobWorkingTimesTable> {
  $$JobWorkingTimesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JobWorkingTimesTableOrderingComposer
    extends Composer<_$AppDatabase, $JobWorkingTimesTable> {
  $$JobWorkingTimesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JobWorkingTimesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobWorkingTimesTable> {
  $$JobWorkingTimesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$JobWorkingTimesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JobWorkingTimesTable,
          DbJobWorkingTime,
          $$JobWorkingTimesTableFilterComposer,
          $$JobWorkingTimesTableOrderingComposer,
          $$JobWorkingTimesTableAnnotationComposer,
          $$JobWorkingTimesTableCreateCompanionBuilder,
          $$JobWorkingTimesTableUpdateCompanionBuilder,
          (
            DbJobWorkingTime,
            BaseReferences<
              _$AppDatabase,
              $JobWorkingTimesTable,
              DbJobWorkingTime
            >,
          ),
          DbJobWorkingTime,
          PrefetchHooks Function()
        > {
  $$JobWorkingTimesTableTableManager(
    _$AppDatabase db,
    $JobWorkingTimesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobWorkingTimesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobWorkingTimesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobWorkingTimesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> activityId = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
              }) => JobWorkingTimesCompanion(
                uid: uid,
                documentId: documentId,
                userId: userId,
                activityId: activityId,
                startTime: startTime,
                endTime: endTime,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> activityId = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
              }) => JobWorkingTimesCompanion.insert(
                uid: uid,
                documentId: documentId,
                userId: userId,
                activityId: activityId,
                startTime: startTime,
                endTime: endTime,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JobWorkingTimesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JobWorkingTimesTable,
      DbJobWorkingTime,
      $$JobWorkingTimesTableFilterComposer,
      $$JobWorkingTimesTableOrderingComposer,
      $$JobWorkingTimesTableAnnotationComposer,
      $$JobWorkingTimesTableCreateCompanionBuilder,
      $$JobWorkingTimesTableUpdateCompanionBuilder,
      (
        DbJobWorkingTime,
        BaseReferences<_$AppDatabase, $JobWorkingTimesTable, DbJobWorkingTime>,
      ),
      DbJobWorkingTime,
      PrefetchHooks Function()
    >;
typedef $$JobMachineEventLogsTableCreateCompanionBuilder =
    JobMachineEventLogsCompanion Function({
      Value<int> uid,
      Value<String?> jobMachineRecId,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
    });
typedef $$JobMachineEventLogsTableUpdateCompanionBuilder =
    JobMachineEventLogsCompanion Function({
      Value<int> uid,
      Value<String?> jobMachineRecId,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
    });

class $$JobMachineEventLogsTableFilterComposer
    extends Composer<_$AppDatabase, $JobMachineEventLogsTable> {
  $$JobMachineEventLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobMachineRecId => $composableBuilder(
    column: $table.jobMachineRecId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JobMachineEventLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $JobMachineEventLogsTable> {
  $$JobMachineEventLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobMachineRecId => $composableBuilder(
    column: $table.jobMachineRecId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JobMachineEventLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobMachineEventLogsTable> {
  $$JobMachineEventLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get jobMachineRecId => $composableBuilder(
    column: $table.jobMachineRecId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$JobMachineEventLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JobMachineEventLogsTable,
          DbJobMachineEventLog,
          $$JobMachineEventLogsTableFilterComposer,
          $$JobMachineEventLogsTableOrderingComposer,
          $$JobMachineEventLogsTableAnnotationComposer,
          $$JobMachineEventLogsTableCreateCompanionBuilder,
          $$JobMachineEventLogsTableUpdateCompanionBuilder,
          (
            DbJobMachineEventLog,
            BaseReferences<
              _$AppDatabase,
              $JobMachineEventLogsTable,
              DbJobMachineEventLog
            >,
          ),
          DbJobMachineEventLog,
          PrefetchHooks Function()
        > {
  $$JobMachineEventLogsTableTableManager(
    _$AppDatabase db,
    $JobMachineEventLogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobMachineEventLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobMachineEventLogsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$JobMachineEventLogsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> jobMachineRecId = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
              }) => JobMachineEventLogsCompanion(
                uid: uid,
                jobMachineRecId: jobMachineRecId,
                startTime: startTime,
                endTime: endTime,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> jobMachineRecId = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
              }) => JobMachineEventLogsCompanion.insert(
                uid: uid,
                jobMachineRecId: jobMachineRecId,
                startTime: startTime,
                endTime: endTime,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JobMachineEventLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JobMachineEventLogsTable,
      DbJobMachineEventLog,
      $$JobMachineEventLogsTableFilterComposer,
      $$JobMachineEventLogsTableOrderingComposer,
      $$JobMachineEventLogsTableAnnotationComposer,
      $$JobMachineEventLogsTableCreateCompanionBuilder,
      $$JobMachineEventLogsTableUpdateCompanionBuilder,
      (
        DbJobMachineEventLog,
        BaseReferences<
          _$AppDatabase,
          $JobMachineEventLogsTable,
          DbJobMachineEventLog
        >,
      ),
      DbJobMachineEventLog,
      PrefetchHooks Function()
    >;
typedef $$JobMachineItemsTableCreateCompanionBuilder =
    JobMachineItemsCompanion Function({
      Value<int> uid,
      required String recId,
      Value<String?> documentId,
      Value<String?> jobTestSetRecId,
      Value<String?> jobMachineRecId,
      Value<String?> registerDateTime,
      Value<String?> registerUser,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
    });
typedef $$JobMachineItemsTableUpdateCompanionBuilder =
    JobMachineItemsCompanion Function({
      Value<int> uid,
      Value<String> recId,
      Value<String?> documentId,
      Value<String?> jobTestSetRecId,
      Value<String?> jobMachineRecId,
      Value<String?> registerDateTime,
      Value<String?> registerUser,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
    });

class $$JobMachineItemsTableFilterComposer
    extends Composer<_$AppDatabase, $JobMachineItemsTable> {
  $$JobMachineItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobTestSetRecId => $composableBuilder(
    column: $table.jobTestSetRecId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobMachineRecId => $composableBuilder(
    column: $table.jobMachineRecId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registerDateTime => $composableBuilder(
    column: $table.registerDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registerUser => $composableBuilder(
    column: $table.registerUser,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JobMachineItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $JobMachineItemsTable> {
  $$JobMachineItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobTestSetRecId => $composableBuilder(
    column: $table.jobTestSetRecId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobMachineRecId => $composableBuilder(
    column: $table.jobMachineRecId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registerDateTime => $composableBuilder(
    column: $table.registerDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registerUser => $composableBuilder(
    column: $table.registerUser,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JobMachineItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobMachineItemsTable> {
  $$JobMachineItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get recId =>
      $composableBuilder(column: $table.recId, builder: (column) => column);

  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jobTestSetRecId => $composableBuilder(
    column: $table.jobTestSetRecId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jobMachineRecId => $composableBuilder(
    column: $table.jobMachineRecId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registerDateTime => $composableBuilder(
    column: $table.registerDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registerUser => $composableBuilder(
    column: $table.registerUser,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$JobMachineItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JobMachineItemsTable,
          DbJobMachineItem,
          $$JobMachineItemsTableFilterComposer,
          $$JobMachineItemsTableOrderingComposer,
          $$JobMachineItemsTableAnnotationComposer,
          $$JobMachineItemsTableCreateCompanionBuilder,
          $$JobMachineItemsTableUpdateCompanionBuilder,
          (
            DbJobMachineItem,
            BaseReferences<
              _$AppDatabase,
              $JobMachineItemsTable,
              DbJobMachineItem
            >,
          ),
          DbJobMachineItem,
          PrefetchHooks Function()
        > {
  $$JobMachineItemsTableTableManager(
    _$AppDatabase db,
    $JobMachineItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobMachineItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobMachineItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobMachineItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String> recId = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> jobTestSetRecId = const Value.absent(),
                Value<String?> jobMachineRecId = const Value.absent(),
                Value<String?> registerDateTime = const Value.absent(),
                Value<String?> registerUser = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
              }) => JobMachineItemsCompanion(
                uid: uid,
                recId: recId,
                documentId: documentId,
                jobTestSetRecId: jobTestSetRecId,
                jobMachineRecId: jobMachineRecId,
                registerDateTime: registerDateTime,
                registerUser: registerUser,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                required String recId,
                Value<String?> documentId = const Value.absent(),
                Value<String?> jobTestSetRecId = const Value.absent(),
                Value<String?> jobMachineRecId = const Value.absent(),
                Value<String?> registerDateTime = const Value.absent(),
                Value<String?> registerUser = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
              }) => JobMachineItemsCompanion.insert(
                uid: uid,
                recId: recId,
                documentId: documentId,
                jobTestSetRecId: jobTestSetRecId,
                jobMachineRecId: jobMachineRecId,
                registerDateTime: registerDateTime,
                registerUser: registerUser,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JobMachineItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JobMachineItemsTable,
      DbJobMachineItem,
      $$JobMachineItemsTableFilterComposer,
      $$JobMachineItemsTableOrderingComposer,
      $$JobMachineItemsTableAnnotationComposer,
      $$JobMachineItemsTableCreateCompanionBuilder,
      $$JobMachineItemsTableUpdateCompanionBuilder,
      (
        DbJobMachineItem,
        BaseReferences<_$AppDatabase, $JobMachineItemsTable, DbJobMachineItem>,
      ),
      DbJobMachineItem,
      PrefetchHooks Function()
    >;
typedef $$PauseReasonsTableCreateCompanionBuilder =
    PauseReasonsCompanion Function({
      Value<int> uid,
      Value<String?> reasonCode,
      Value<String?> reasonName,
      Value<int> status,
    });
typedef $$PauseReasonsTableUpdateCompanionBuilder =
    PauseReasonsCompanion Function({
      Value<int> uid,
      Value<String?> reasonCode,
      Value<String?> reasonName,
      Value<int> status,
    });

class $$PauseReasonsTableFilterComposer
    extends Composer<_$AppDatabase, $PauseReasonsTable> {
  $$PauseReasonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reasonCode => $composableBuilder(
    column: $table.reasonCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reasonName => $composableBuilder(
    column: $table.reasonName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PauseReasonsTableOrderingComposer
    extends Composer<_$AppDatabase, $PauseReasonsTable> {
  $$PauseReasonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reasonCode => $composableBuilder(
    column: $table.reasonCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reasonName => $composableBuilder(
    column: $table.reasonName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PauseReasonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PauseReasonsTable> {
  $$PauseReasonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get reasonCode => $composableBuilder(
    column: $table.reasonCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reasonName => $composableBuilder(
    column: $table.reasonName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$PauseReasonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PauseReasonsTable,
          DbPauseReason,
          $$PauseReasonsTableFilterComposer,
          $$PauseReasonsTableOrderingComposer,
          $$PauseReasonsTableAnnotationComposer,
          $$PauseReasonsTableCreateCompanionBuilder,
          $$PauseReasonsTableUpdateCompanionBuilder,
          (
            DbPauseReason,
            BaseReferences<_$AppDatabase, $PauseReasonsTable, DbPauseReason>,
          ),
          DbPauseReason,
          PrefetchHooks Function()
        > {
  $$PauseReasonsTableTableManager(_$AppDatabase db, $PauseReasonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PauseReasonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PauseReasonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PauseReasonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> reasonCode = const Value.absent(),
                Value<String?> reasonName = const Value.absent(),
                Value<int> status = const Value.absent(),
              }) => PauseReasonsCompanion(
                uid: uid,
                reasonCode: reasonCode,
                reasonName: reasonName,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> reasonCode = const Value.absent(),
                Value<String?> reasonName = const Value.absent(),
                Value<int> status = const Value.absent(),
              }) => PauseReasonsCompanion.insert(
                uid: uid,
                reasonCode: reasonCode,
                reasonName: reasonName,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PauseReasonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PauseReasonsTable,
      DbPauseReason,
      $$PauseReasonsTableFilterComposer,
      $$PauseReasonsTableOrderingComposer,
      $$PauseReasonsTableAnnotationComposer,
      $$PauseReasonsTableCreateCompanionBuilder,
      $$PauseReasonsTableUpdateCompanionBuilder,
      (
        DbPauseReason,
        BaseReferences<_$AppDatabase, $PauseReasonsTable, DbPauseReason>,
      ),
      DbPauseReason,
      PrefetchHooks Function()
    >;
typedef $$CheckInActivitiesTableCreateCompanionBuilder =
    CheckInActivitiesCompanion Function({
      Value<int> uid,
      Value<String?> activityName,
      Value<int> status,
    });
typedef $$CheckInActivitiesTableUpdateCompanionBuilder =
    CheckInActivitiesCompanion Function({
      Value<int> uid,
      Value<String?> activityName,
      Value<int> status,
    });

class $$CheckInActivitiesTableFilterComposer
    extends Composer<_$AppDatabase, $CheckInActivitiesTable> {
  $$CheckInActivitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityName => $composableBuilder(
    column: $table.activityName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CheckInActivitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $CheckInActivitiesTable> {
  $$CheckInActivitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityName => $composableBuilder(
    column: $table.activityName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CheckInActivitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CheckInActivitiesTable> {
  $$CheckInActivitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get activityName => $composableBuilder(
    column: $table.activityName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$CheckInActivitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CheckInActivitiesTable,
          DbCheckInActivity,
          $$CheckInActivitiesTableFilterComposer,
          $$CheckInActivitiesTableOrderingComposer,
          $$CheckInActivitiesTableAnnotationComposer,
          $$CheckInActivitiesTableCreateCompanionBuilder,
          $$CheckInActivitiesTableUpdateCompanionBuilder,
          (
            DbCheckInActivity,
            BaseReferences<
              _$AppDatabase,
              $CheckInActivitiesTable,
              DbCheckInActivity
            >,
          ),
          DbCheckInActivity,
          PrefetchHooks Function()
        > {
  $$CheckInActivitiesTableTableManager(
    _$AppDatabase db,
    $CheckInActivitiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CheckInActivitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CheckInActivitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CheckInActivitiesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> activityName = const Value.absent(),
                Value<int> status = const Value.absent(),
              }) => CheckInActivitiesCompanion(
                uid: uid,
                activityName: activityName,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> activityName = const Value.absent(),
                Value<int> status = const Value.absent(),
              }) => CheckInActivitiesCompanion.insert(
                uid: uid,
                activityName: activityName,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CheckInActivitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CheckInActivitiesTable,
      DbCheckInActivity,
      $$CheckInActivitiesTableFilterComposer,
      $$CheckInActivitiesTableOrderingComposer,
      $$CheckInActivitiesTableAnnotationComposer,
      $$CheckInActivitiesTableCreateCompanionBuilder,
      $$CheckInActivitiesTableUpdateCompanionBuilder,
      (
        DbCheckInActivity,
        BaseReferences<
          _$AppDatabase,
          $CheckInActivitiesTable,
          DbCheckInActivity
        >,
      ),
      DbCheckInActivity,
      PrefetchHooks Function()
    >;
typedef $$CheckInLogsTableCreateCompanionBuilder =
    CheckInLogsCompanion Function({
      Value<int> uid,
      Value<String?> locationCode,
      Value<String?> userId,
      Value<String?> activityName,
      Value<String?> remark,
      Value<String?> checkInTime,
      Value<String?> checkOutTime,
      Value<int> status,
      Value<int> syncStatus,
      Value<String?> lastSync,
    });
typedef $$CheckInLogsTableUpdateCompanionBuilder =
    CheckInLogsCompanion Function({
      Value<int> uid,
      Value<String?> locationCode,
      Value<String?> userId,
      Value<String?> activityName,
      Value<String?> remark,
      Value<String?> checkInTime,
      Value<String?> checkOutTime,
      Value<int> status,
      Value<int> syncStatus,
      Value<String?> lastSync,
    });

class $$CheckInLogsTableFilterComposer
    extends Composer<_$AppDatabase, $CheckInLogsTable> {
  $$CheckInLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationCode => $composableBuilder(
    column: $table.locationCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityName => $composableBuilder(
    column: $table.activityName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checkInTime => $composableBuilder(
    column: $table.checkInTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checkOutTime => $composableBuilder(
    column: $table.checkOutTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CheckInLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $CheckInLogsTable> {
  $$CheckInLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationCode => $composableBuilder(
    column: $table.locationCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityName => $composableBuilder(
    column: $table.activityName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checkInTime => $composableBuilder(
    column: $table.checkInTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checkOutTime => $composableBuilder(
    column: $table.checkOutTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CheckInLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CheckInLogsTable> {
  $$CheckInLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get locationCode => $composableBuilder(
    column: $table.locationCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get activityName => $composableBuilder(
    column: $table.activityName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get checkInTime => $composableBuilder(
    column: $table.checkInTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get checkOutTime => $composableBuilder(
    column: $table.checkOutTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);
}

class $$CheckInLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CheckInLogsTable,
          DbCheckInLog,
          $$CheckInLogsTableFilterComposer,
          $$CheckInLogsTableOrderingComposer,
          $$CheckInLogsTableAnnotationComposer,
          $$CheckInLogsTableCreateCompanionBuilder,
          $$CheckInLogsTableUpdateCompanionBuilder,
          (
            DbCheckInLog,
            BaseReferences<_$AppDatabase, $CheckInLogsTable, DbCheckInLog>,
          ),
          DbCheckInLog,
          PrefetchHooks Function()
        > {
  $$CheckInLogsTableTableManager(_$AppDatabase db, $CheckInLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CheckInLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CheckInLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CheckInLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> locationCode = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> activityName = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String?> checkInTime = const Value.absent(),
                Value<String?> checkOutTime = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
              }) => CheckInLogsCompanion(
                uid: uid,
                locationCode: locationCode,
                userId: userId,
                activityName: activityName,
                remark: remark,
                checkInTime: checkInTime,
                checkOutTime: checkOutTime,
                status: status,
                syncStatus: syncStatus,
                lastSync: lastSync,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> locationCode = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> activityName = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String?> checkInTime = const Value.absent(),
                Value<String?> checkOutTime = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
              }) => CheckInLogsCompanion.insert(
                uid: uid,
                locationCode: locationCode,
                userId: userId,
                activityName: activityName,
                remark: remark,
                checkInTime: checkInTime,
                checkOutTime: checkOutTime,
                status: status,
                syncStatus: syncStatus,
                lastSync: lastSync,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CheckInLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CheckInLogsTable,
      DbCheckInLog,
      $$CheckInLogsTableFilterComposer,
      $$CheckInLogsTableOrderingComposer,
      $$CheckInLogsTableAnnotationComposer,
      $$CheckInLogsTableCreateCompanionBuilder,
      $$CheckInLogsTableUpdateCompanionBuilder,
      (
        DbCheckInLog,
        BaseReferences<_$AppDatabase, $CheckInLogsTable, DbCheckInLog>,
      ),
      DbCheckInLog,
      PrefetchHooks Function()
    >;
typedef $$ActivityLogsTableCreateCompanionBuilder =
    ActivityLogsCompanion Function({
      Value<int> uid,
      required String recId,
      Value<String?> machineNo,
      Value<String?> activityType,
      Value<String?> operatorId,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<int> status,
      Value<String?> remark,
      Value<int> syncStatus,
      Value<String?> lastSync,
    });
typedef $$ActivityLogsTableUpdateCompanionBuilder =
    ActivityLogsCompanion Function({
      Value<int> uid,
      Value<String> recId,
      Value<String?> machineNo,
      Value<String?> activityType,
      Value<String?> operatorId,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<int> status,
      Value<String?> remark,
      Value<int> syncStatus,
      Value<String?> lastSync,
    });

class $$ActivityLogsTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityLogsTable> {
  $$ActivityLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineNo => $composableBuilder(
    column: $table.machineNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityType => $composableBuilder(
    column: $table.activityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operatorId => $composableBuilder(
    column: $table.operatorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActivityLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityLogsTable> {
  $$ActivityLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineNo => $composableBuilder(
    column: $table.machineNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityType => $composableBuilder(
    column: $table.activityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operatorId => $composableBuilder(
    column: $table.operatorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSync => $composableBuilder(
    column: $table.lastSync,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActivityLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityLogsTable> {
  $$ActivityLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get recId =>
      $composableBuilder(column: $table.recId, builder: (column) => column);

  GeneratedColumn<String> get machineNo =>
      $composableBuilder(column: $table.machineNo, builder: (column) => column);

  GeneratedColumn<String> get activityType => $composableBuilder(
    column: $table.activityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get operatorId => $composableBuilder(
    column: $table.operatorId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<int> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSync =>
      $composableBuilder(column: $table.lastSync, builder: (column) => column);
}

class $$ActivityLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityLogsTable,
          DbActivityLog,
          $$ActivityLogsTableFilterComposer,
          $$ActivityLogsTableOrderingComposer,
          $$ActivityLogsTableAnnotationComposer,
          $$ActivityLogsTableCreateCompanionBuilder,
          $$ActivityLogsTableUpdateCompanionBuilder,
          (
            DbActivityLog,
            BaseReferences<_$AppDatabase, $ActivityLogsTable, DbActivityLog>,
          ),
          DbActivityLog,
          PrefetchHooks Function()
        > {
  $$ActivityLogsTableTableManager(_$AppDatabase db, $ActivityLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivityLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String> recId = const Value.absent(),
                Value<String?> machineNo = const Value.absent(),
                Value<String?> activityType = const Value.absent(),
                Value<String?> operatorId = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
              }) => ActivityLogsCompanion(
                uid: uid,
                recId: recId,
                machineNo: machineNo,
                activityType: activityType,
                operatorId: operatorId,
                startTime: startTime,
                endTime: endTime,
                status: status,
                remark: remark,
                syncStatus: syncStatus,
                lastSync: lastSync,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                required String recId,
                Value<String?> machineNo = const Value.absent(),
                Value<String?> activityType = const Value.absent(),
                Value<String?> operatorId = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
              }) => ActivityLogsCompanion.insert(
                uid: uid,
                recId: recId,
                machineNo: machineNo,
                activityType: activityType,
                operatorId: operatorId,
                startTime: startTime,
                endTime: endTime,
                status: status,
                remark: remark,
                syncStatus: syncStatus,
                lastSync: lastSync,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActivityLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityLogsTable,
      DbActivityLog,
      $$ActivityLogsTableFilterComposer,
      $$ActivityLogsTableOrderingComposer,
      $$ActivityLogsTableAnnotationComposer,
      $$ActivityLogsTableCreateCompanionBuilder,
      $$ActivityLogsTableUpdateCompanionBuilder,
      (
        DbActivityLog,
        BaseReferences<_$AppDatabase, $ActivityLogsTable, DbActivityLog>,
      ),
      DbActivityLog,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$JobsTableTableManager get jobs => $$JobsTableTableManager(_db, _db.jobs);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db, _db.documents);
  $$DocumentMachinesTableTableManager get documentMachines =>
      $$DocumentMachinesTableTableManager(_db, _db.documentMachines);
  $$DocumentRecordsTableTableManager get documentRecords =>
      $$DocumentRecordsTableTableManager(_db, _db.documentRecords);
  $$JobMachinesTableTableManager get jobMachines =>
      $$JobMachinesTableTableManager(_db, _db.jobMachines);
  $$JobTagsTableTableManager get jobTags =>
      $$JobTagsTableTableManager(_db, _db.jobTags);
  $$ProblemsTableTableManager get problems =>
      $$ProblemsTableTableManager(_db, _db.problems);
  $$SyncsTableTableManager get syncs =>
      $$SyncsTableTableManager(_db, _db.syncs);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ImagesTableTableManager get images =>
      $$ImagesTableTableManager(_db, _db.images);
  $$CheckSheetMasterImagesTableTableManager get checkSheetMasterImages =>
      $$CheckSheetMasterImagesTableTableManager(
        _db,
        _db.checkSheetMasterImages,
      );
  $$DocumentTimeLogsTableTableManager get documentTimeLogs =>
      $$DocumentTimeLogsTableTableManager(_db, _db.documentTimeLogs);
  $$JobTestSetsTableTableManager get jobTestSets =>
      $$JobTestSetsTableTableManager(_db, _db.jobTestSets);
  $$RunningJobMachinesTableTableManager get runningJobMachines =>
      $$RunningJobMachinesTableTableManager(_db, _db.runningJobMachines);
  $$JobWorkingTimesTableTableManager get jobWorkingTimes =>
      $$JobWorkingTimesTableTableManager(_db, _db.jobWorkingTimes);
  $$JobMachineEventLogsTableTableManager get jobMachineEventLogs =>
      $$JobMachineEventLogsTableTableManager(_db, _db.jobMachineEventLogs);
  $$JobMachineItemsTableTableManager get jobMachineItems =>
      $$JobMachineItemsTableTableManager(_db, _db.jobMachineItems);
  $$PauseReasonsTableTableManager get pauseReasons =>
      $$PauseReasonsTableTableManager(_db, _db.pauseReasons);
  $$CheckInActivitiesTableTableManager get checkInActivities =>
      $$CheckInActivitiesTableTableManager(_db, _db.checkInActivities);
  $$CheckInLogsTableTableManager get checkInLogs =>
      $$CheckInLogsTableTableManager(_db, _db.checkInLogs);
  $$ActivityLogsTableTableManager get activityLogs =>
      $$ActivityLogsTableTableManager(_db, _db.activityLogs);
}
