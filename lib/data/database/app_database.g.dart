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
  static const VerificationMeta _isManualMeta = const VerificationMeta(
    'isManual',
  );
  @override
  late final GeneratedColumn<bool> isManual = GeneratedColumn<bool>(
    'IsManual',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("IsManual" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'IsSynced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("IsSynced" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _recordVersionMeta = const VerificationMeta(
    'recordVersion',
  );
  @override
  late final GeneratedColumn<int> recordVersion = GeneratedColumn<int>(
    'RecordVersion',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
    isManual,
    isSynced,
    recordVersion,
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
    if (data.containsKey('IsManual')) {
      context.handle(
        _isManualMeta,
        isManual.isAcceptableOrUnknown(data['IsManual']!, _isManualMeta),
      );
    }
    if (data.containsKey('IsSynced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['IsSynced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('RecordVersion')) {
      context.handle(
        _recordVersionMeta,
        recordVersion.isAcceptableOrUnknown(
          data['RecordVersion']!,
          _recordVersionMeta,
        ),
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
      isManual: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}IsManual'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}IsSynced'],
      )!,
      recordVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}RecordVersion'],
      )!,
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
  final bool isManual;
  final bool isSynced;
  final int recordVersion;
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
    required this.isManual,
    required this.isSynced,
    required this.recordVersion,
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
    map['IsManual'] = Variable<bool>(isManual);
    map['IsSynced'] = Variable<bool>(isSynced);
    map['RecordVersion'] = Variable<int>(recordVersion);
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
      isManual: Value(isManual),
      isSynced: Value(isSynced),
      recordVersion: Value(recordVersion),
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
      isManual: serializer.fromJson<bool>(json['isManual']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      recordVersion: serializer.fromJson<int>(json['recordVersion']),
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
      'isManual': serializer.toJson<bool>(isManual),
      'isSynced': serializer.toJson<bool>(isSynced),
      'recordVersion': serializer.toJson<int>(recordVersion),
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
    bool? isManual,
    bool? isSynced,
    int? recordVersion,
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
    isManual: isManual ?? this.isManual,
    isSynced: isSynced ?? this.isSynced,
    recordVersion: recordVersion ?? this.recordVersion,
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
      isManual: data.isManual.present ? data.isManual.value : this.isManual,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      recordVersion: data.recordVersion.present
          ? data.recordVersion.value
          : this.recordVersion,
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
          ..write('updatedAt: $updatedAt, ')
          ..write('isManual: $isManual, ')
          ..write('isSynced: $isSynced, ')
          ..write('recordVersion: $recordVersion')
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
    isManual,
    isSynced,
    recordVersion,
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
          other.updatedAt == this.updatedAt &&
          other.isManual == this.isManual &&
          other.isSynced == this.isSynced &&
          other.recordVersion == this.recordVersion);
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
  final Value<bool> isManual;
  final Value<bool> isSynced;
  final Value<int> recordVersion;
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
    this.isManual = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.recordVersion = const Value.absent(),
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
    this.isManual = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.recordVersion = const Value.absent(),
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
    Expression<bool>? isManual,
    Expression<bool>? isSynced,
    Expression<int>? recordVersion,
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
      if (isManual != null) 'IsManual': isManual,
      if (isSynced != null) 'IsSynced': isSynced,
      if (recordVersion != null) 'RecordVersion': recordVersion,
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
    Value<bool>? isManual,
    Value<bool>? isSynced,
    Value<int>? recordVersion,
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
      isManual: isManual ?? this.isManual,
      isSynced: isSynced ?? this.isSynced,
      recordVersion: recordVersion ?? this.recordVersion,
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
    if (isManual.present) {
      map['IsManual'] = Variable<bool>(isManual.value);
    }
    if (isSynced.present) {
      map['IsSynced'] = Variable<bool>(isSynced.value);
    }
    if (recordVersion.present) {
      map['RecordVersion'] = Variable<int>(recordVersion.value);
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
          ..write('updatedAt: $updatedAt, ')
          ..write('isManual: $isManual, ')
          ..write('isSynced: $isSynced, ')
          ..write('recordVersion: $recordVersion')
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
  static const VerificationMeta _recordVersionMeta = const VerificationMeta(
    'recordVersion',
  );
  @override
  late final GeneratedColumn<int> recordVersion = GeneratedColumn<int>(
    'RecordVersion',
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
    recordVersion,
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
    if (data.containsKey('RecordVersion')) {
      context.handle(
        _recordVersionMeta,
        recordVersion.isAcceptableOrUnknown(
          data['RecordVersion']!,
          _recordVersionMeta,
        ),
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
      recordVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}RecordVersion'],
      )!,
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
  final int recordVersion;
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
    required this.recordVersion,
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
    map['RecordVersion'] = Variable<int>(recordVersion);
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
      recordVersion: Value(recordVersion),
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
      recordVersion: serializer.fromJson<int>(json['recordVersion']),
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
      'recordVersion': serializer.toJson<int>(recordVersion),
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
    int? recordVersion,
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
    recordVersion: recordVersion ?? this.recordVersion,
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
      recordVersion: data.recordVersion.present
          ? data.recordVersion.value
          : this.recordVersion,
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
          ..write('postDate: $postDate, ')
          ..write('recordVersion: $recordVersion')
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
    recordVersion,
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
          other.postDate == this.postDate &&
          other.recordVersion == this.recordVersion);
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
  final Value<int> recordVersion;
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
    this.recordVersion = const Value.absent(),
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
    this.recordVersion = const Value.absent(),
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
    Expression<int>? recordVersion,
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
      if (recordVersion != null) 'RecordVersion': recordVersion,
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
    Value<int>? recordVersion,
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
      recordVersion: recordVersion ?? this.recordVersion,
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
    if (recordVersion.present) {
      map['RecordVersion'] = Variable<int>(recordVersion.value);
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
          ..write('postDate: $postDate, ')
          ..write('recordVersion: $recordVersion')
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
  static const VerificationMeta _recordVersionMeta = const VerificationMeta(
    'recordVersion',
  );
  @override
  late final GeneratedColumn<int> recordVersion = GeneratedColumn<int>(
    'RecordVersion',
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
    recordVersion,
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
    if (data.containsKey('RecordVersion')) {
      context.handle(
        _recordVersionMeta,
        recordVersion.isAcceptableOrUnknown(
          data['RecordVersion']!,
          _recordVersionMeta,
        ),
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
      recordVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}RecordVersion'],
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
  final int recordVersion;
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
    required this.recordVersion,
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
    map['RecordVersion'] = Variable<int>(recordVersion);
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
      recordVersion: Value(recordVersion),
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
      recordVersion: serializer.fromJson<int>(json['recordVersion']),
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
      'recordVersion': serializer.toJson<int>(recordVersion),
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
    int? recordVersion,
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
    recordVersion: recordVersion ?? this.recordVersion,
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
      recordVersion: data.recordVersion.present
          ? data.recordVersion.value
          : this.recordVersion,
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
          ..write('syncStatus: $syncStatus, ')
          ..write('recordVersion: $recordVersion')
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
    recordVersion,
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
          other.syncStatus == this.syncStatus &&
          other.recordVersion == this.recordVersion);
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
  final Value<int> recordVersion;
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
    this.recordVersion = const Value.absent(),
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
    this.recordVersion = const Value.absent(),
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
    Expression<int>? recordVersion,
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
      if (recordVersion != null) 'RecordVersion': recordVersion,
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
    Value<int>? recordVersion,
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
      recordVersion: recordVersion ?? this.recordVersion,
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
    if (recordVersion.present) {
      map['RecordVersion'] = Variable<int>(recordVersion.value);
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
          ..write('syncStatus: $syncStatus, ')
          ..write('recordVersion: $recordVersion')
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
  static const VerificationMeta _recordVersionMeta = const VerificationMeta(
    'recordVersion',
  );
  @override
  late final GeneratedColumn<int> recordVersion = GeneratedColumn<int>(
    'RecordVersion',
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
    recordVersion,
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
    if (data.containsKey('RecordVersion')) {
      context.handle(
        _recordVersionMeta,
        recordVersion.isAcceptableOrUnknown(
          data['RecordVersion']!,
          _recordVersionMeta,
        ),
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
      recordVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}RecordVersion'],
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
  final int recordVersion;
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
    required this.recordVersion,
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
    map['RecordVersion'] = Variable<int>(recordVersion);
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
      recordVersion: Value(recordVersion),
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
      recordVersion: serializer.fromJson<int>(json['recordVersion']),
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
      'recordVersion': serializer.toJson<int>(recordVersion),
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
    int? recordVersion,
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
    recordVersion: recordVersion ?? this.recordVersion,
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
      recordVersion: data.recordVersion.present
          ? data.recordVersion.value
          : this.recordVersion,
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
          ..write('syncStatus: $syncStatus, ')
          ..write('recordVersion: $recordVersion')
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
    recordVersion,
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
          other.syncStatus == this.syncStatus &&
          other.recordVersion == this.recordVersion);
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
  final Value<int> recordVersion;
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
    this.recordVersion = const Value.absent(),
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
    this.recordVersion = const Value.absent(),
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
    Expression<int>? recordVersion,
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
      if (recordVersion != null) 'RecordVersion': recordVersion,
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
    Value<int>? recordVersion,
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
      recordVersion: recordVersion ?? this.recordVersion,
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
    if (recordVersion.present) {
      map['RecordVersion'] = Variable<int>(recordVersion.value);
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
          ..write('syncStatus: $syncStatus, ')
          ..write('recordVersion: $recordVersion')
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
  static const VerificationMeta _recIdMeta = const VerificationMeta('recId');
  @override
  late final GeneratedColumn<String> recId = GeneratedColumn<String>(
    'recID',
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
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'UserId',
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
    'JobTestSetRecID',
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
  static const VerificationMeta _recordVersionMeta = const VerificationMeta(
    'recordVersion',
  );
  @override
  late final GeneratedColumn<int> recordVersion = GeneratedColumn<int>(
    'RecordVersion',
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
    userId,
    jobTestSetRecId,
    activityId,
    activityName,
    startTime,
    endTime,
    status,
    updatedAt,
    lastSync,
    syncStatus,
    recordVersion,
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
    if (data.containsKey('recID')) {
      context.handle(
        _recIdMeta,
        recId.isAcceptableOrUnknown(data['recID']!, _recIdMeta),
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
    if (data.containsKey('JobTestSetRecID')) {
      context.handle(
        _jobTestSetRecIdMeta,
        jobTestSetRecId.isAcceptableOrUnknown(
          data['JobTestSetRecID']!,
          _jobTestSetRecIdMeta,
        ),
      );
    }
    if (data.containsKey('ActivityID')) {
      context.handle(
        _activityIdMeta,
        activityId.isAcceptableOrUnknown(data['ActivityID']!, _activityIdMeta),
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
    if (data.containsKey('RecordVersion')) {
      context.handle(
        _recordVersionMeta,
        recordVersion.isAcceptableOrUnknown(
          data['RecordVersion']!,
          _recordVersionMeta,
        ),
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
      recId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recID'],
      ),
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentId'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}UserId'],
      ),
      jobTestSetRecId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}JobTestSetRecID'],
      ),
      activityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ActivityID'],
      ),
      activityName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ActivityName'],
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
      recordVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}RecordVersion'],
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
  final String? recId;
  final String? documentId;
  final String? userId;
  final String? jobTestSetRecId;
  final String? activityId;
  final String? activityName;
  final String? startTime;
  final String? endTime;
  final int status;
  final String? updatedAt;
  final String? lastSync;
  final int syncStatus;
  final int recordVersion;
  const DbJobWorkingTime({
    required this.uid,
    this.recId,
    this.documentId,
    this.userId,
    this.jobTestSetRecId,
    this.activityId,
    this.activityName,
    this.startTime,
    this.endTime,
    required this.status,
    this.updatedAt,
    this.lastSync,
    required this.syncStatus,
    required this.recordVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || recId != null) {
      map['recID'] = Variable<String>(recId);
    }
    if (!nullToAbsent || documentId != null) {
      map['documentId'] = Variable<String>(documentId);
    }
    if (!nullToAbsent || userId != null) {
      map['UserId'] = Variable<String>(userId);
    }
    if (!nullToAbsent || jobTestSetRecId != null) {
      map['JobTestSetRecID'] = Variable<String>(jobTestSetRecId);
    }
    if (!nullToAbsent || activityId != null) {
      map['ActivityID'] = Variable<String>(activityId);
    }
    if (!nullToAbsent || activityName != null) {
      map['ActivityName'] = Variable<String>(activityName);
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
    map['RecordVersion'] = Variable<int>(recordVersion);
    return map;
  }

  JobWorkingTimesCompanion toCompanion(bool nullToAbsent) {
    return JobWorkingTimesCompanion(
      uid: Value(uid),
      recId: recId == null && nullToAbsent
          ? const Value.absent()
          : Value(recId),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      jobTestSetRecId: jobTestSetRecId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobTestSetRecId),
      activityId: activityId == null && nullToAbsent
          ? const Value.absent()
          : Value(activityId),
      activityName: activityName == null && nullToAbsent
          ? const Value.absent()
          : Value(activityName),
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
      recordVersion: Value(recordVersion),
    );
  }

  factory DbJobWorkingTime.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbJobWorkingTime(
      uid: serializer.fromJson<int>(json['uid']),
      recId: serializer.fromJson<String?>(json['recId']),
      documentId: serializer.fromJson<String?>(json['documentId']),
      userId: serializer.fromJson<String?>(json['userId']),
      jobTestSetRecId: serializer.fromJson<String?>(json['jobTestSetRecId']),
      activityId: serializer.fromJson<String?>(json['activityId']),
      activityName: serializer.fromJson<String?>(json['activityName']),
      startTime: serializer.fromJson<String?>(json['startTime']),
      endTime: serializer.fromJson<String?>(json['endTime']),
      status: serializer.fromJson<int>(json['status']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
      recordVersion: serializer.fromJson<int>(json['recordVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'recId': serializer.toJson<String?>(recId),
      'documentId': serializer.toJson<String?>(documentId),
      'userId': serializer.toJson<String?>(userId),
      'jobTestSetRecId': serializer.toJson<String?>(jobTestSetRecId),
      'activityId': serializer.toJson<String?>(activityId),
      'activityName': serializer.toJson<String?>(activityName),
      'startTime': serializer.toJson<String?>(startTime),
      'endTime': serializer.toJson<String?>(endTime),
      'status': serializer.toJson<int>(status),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'lastSync': serializer.toJson<String?>(lastSync),
      'syncStatus': serializer.toJson<int>(syncStatus),
      'recordVersion': serializer.toJson<int>(recordVersion),
    };
  }

  DbJobWorkingTime copyWith({
    int? uid,
    Value<String?> recId = const Value.absent(),
    Value<String?> documentId = const Value.absent(),
    Value<String?> userId = const Value.absent(),
    Value<String?> jobTestSetRecId = const Value.absent(),
    Value<String?> activityId = const Value.absent(),
    Value<String?> activityName = const Value.absent(),
    Value<String?> startTime = const Value.absent(),
    Value<String?> endTime = const Value.absent(),
    int? status,
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> lastSync = const Value.absent(),
    int? syncStatus,
    int? recordVersion,
  }) => DbJobWorkingTime(
    uid: uid ?? this.uid,
    recId: recId.present ? recId.value : this.recId,
    documentId: documentId.present ? documentId.value : this.documentId,
    userId: userId.present ? userId.value : this.userId,
    jobTestSetRecId: jobTestSetRecId.present
        ? jobTestSetRecId.value
        : this.jobTestSetRecId,
    activityId: activityId.present ? activityId.value : this.activityId,
    activityName: activityName.present ? activityName.value : this.activityName,
    startTime: startTime.present ? startTime.value : this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    status: status ?? this.status,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    syncStatus: syncStatus ?? this.syncStatus,
    recordVersion: recordVersion ?? this.recordVersion,
  );
  DbJobWorkingTime copyWithCompanion(JobWorkingTimesCompanion data) {
    return DbJobWorkingTime(
      uid: data.uid.present ? data.uid.value : this.uid,
      recId: data.recId.present ? data.recId.value : this.recId,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      userId: data.userId.present ? data.userId.value : this.userId,
      jobTestSetRecId: data.jobTestSetRecId.present
          ? data.jobTestSetRecId.value
          : this.jobTestSetRecId,
      activityId: data.activityId.present
          ? data.activityId.value
          : this.activityId,
      activityName: data.activityName.present
          ? data.activityName.value
          : this.activityName,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      status: data.status.present ? data.status.value : this.status,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      recordVersion: data.recordVersion.present
          ? data.recordVersion.value
          : this.recordVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbJobWorkingTime(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('documentId: $documentId, ')
          ..write('userId: $userId, ')
          ..write('jobTestSetRecId: $jobTestSetRecId, ')
          ..write('activityId: $activityId, ')
          ..write('activityName: $activityName, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('recordVersion: $recordVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    recId,
    documentId,
    userId,
    jobTestSetRecId,
    activityId,
    activityName,
    startTime,
    endTime,
    status,
    updatedAt,
    lastSync,
    syncStatus,
    recordVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbJobWorkingTime &&
          other.uid == this.uid &&
          other.recId == this.recId &&
          other.documentId == this.documentId &&
          other.userId == this.userId &&
          other.jobTestSetRecId == this.jobTestSetRecId &&
          other.activityId == this.activityId &&
          other.activityName == this.activityName &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.status == this.status &&
          other.updatedAt == this.updatedAt &&
          other.lastSync == this.lastSync &&
          other.syncStatus == this.syncStatus &&
          other.recordVersion == this.recordVersion);
}

class JobWorkingTimesCompanion extends UpdateCompanion<DbJobWorkingTime> {
  final Value<int> uid;
  final Value<String?> recId;
  final Value<String?> documentId;
  final Value<String?> userId;
  final Value<String?> jobTestSetRecId;
  final Value<String?> activityId;
  final Value<String?> activityName;
  final Value<String?> startTime;
  final Value<String?> endTime;
  final Value<int> status;
  final Value<String?> updatedAt;
  final Value<String?> lastSync;
  final Value<int> syncStatus;
  final Value<int> recordVersion;
  const JobWorkingTimesCompanion({
    this.uid = const Value.absent(),
    this.recId = const Value.absent(),
    this.documentId = const Value.absent(),
    this.userId = const Value.absent(),
    this.jobTestSetRecId = const Value.absent(),
    this.activityId = const Value.absent(),
    this.activityName = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.recordVersion = const Value.absent(),
  });
  JobWorkingTimesCompanion.insert({
    this.uid = const Value.absent(),
    this.recId = const Value.absent(),
    this.documentId = const Value.absent(),
    this.userId = const Value.absent(),
    this.jobTestSetRecId = const Value.absent(),
    this.activityId = const Value.absent(),
    this.activityName = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.recordVersion = const Value.absent(),
  });
  static Insertable<DbJobWorkingTime> custom({
    Expression<int>? uid,
    Expression<String>? recId,
    Expression<String>? documentId,
    Expression<String>? userId,
    Expression<String>? jobTestSetRecId,
    Expression<String>? activityId,
    Expression<String>? activityName,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<int>? status,
    Expression<String>? updatedAt,
    Expression<String>? lastSync,
    Expression<int>? syncStatus,
    Expression<int>? recordVersion,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (recId != null) 'recID': recId,
      if (documentId != null) 'documentId': documentId,
      if (userId != null) 'UserId': userId,
      if (jobTestSetRecId != null) 'JobTestSetRecID': jobTestSetRecId,
      if (activityId != null) 'ActivityID': activityId,
      if (activityName != null) 'ActivityName': activityName,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (status != null) 'status': status,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (lastSync != null) 'lastSync': lastSync,
      if (syncStatus != null) 'syncStatus': syncStatus,
      if (recordVersion != null) 'RecordVersion': recordVersion,
    });
  }

  JobWorkingTimesCompanion copyWith({
    Value<int>? uid,
    Value<String?>? recId,
    Value<String?>? documentId,
    Value<String?>? userId,
    Value<String?>? jobTestSetRecId,
    Value<String?>? activityId,
    Value<String?>? activityName,
    Value<String?>? startTime,
    Value<String?>? endTime,
    Value<int>? status,
    Value<String?>? updatedAt,
    Value<String?>? lastSync,
    Value<int>? syncStatus,
    Value<int>? recordVersion,
  }) {
    return JobWorkingTimesCompanion(
      uid: uid ?? this.uid,
      recId: recId ?? this.recId,
      documentId: documentId ?? this.documentId,
      userId: userId ?? this.userId,
      jobTestSetRecId: jobTestSetRecId ?? this.jobTestSetRecId,
      activityId: activityId ?? this.activityId,
      activityName: activityName ?? this.activityName,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSync: lastSync ?? this.lastSync,
      syncStatus: syncStatus ?? this.syncStatus,
      recordVersion: recordVersion ?? this.recordVersion,
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
    if (userId.present) {
      map['UserId'] = Variable<String>(userId.value);
    }
    if (jobTestSetRecId.present) {
      map['JobTestSetRecID'] = Variable<String>(jobTestSetRecId.value);
    }
    if (activityId.present) {
      map['ActivityID'] = Variable<String>(activityId.value);
    }
    if (activityName.present) {
      map['ActivityName'] = Variable<String>(activityName.value);
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
    if (recordVersion.present) {
      map['RecordVersion'] = Variable<int>(recordVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobWorkingTimesCompanion(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('documentId: $documentId, ')
          ..write('userId: $userId, ')
          ..write('jobTestSetRecId: $jobTestSetRecId, ')
          ..write('activityId: $activityId, ')
          ..write('activityName: $activityName, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('recordVersion: $recordVersion')
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
  static const VerificationMeta _recordUserIdMeta = const VerificationMeta(
    'recordUserId',
  );
  @override
  late final GeneratedColumn<String> recordUserId = GeneratedColumn<String>(
    'RecordUserId',
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
  static const VerificationMeta _eventTypeMeta = const VerificationMeta(
    'eventType',
  );
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
    'EventType',
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
  static const VerificationMeta _recordVersionMeta = const VerificationMeta(
    'recordVersion',
  );
  @override
  late final GeneratedColumn<int> recordVersion = GeneratedColumn<int>(
    'RecordVersion',
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
    jobMachineRecId,
    recordUserId,
    startTime,
    endTime,
    eventType,
    status,
    updatedAt,
    lastSync,
    syncStatus,
    recordVersion,
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
    if (data.containsKey('recID')) {
      context.handle(
        _recIdMeta,
        recId.isAcceptableOrUnknown(data['recID']!, _recIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recIdMeta);
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
    if (data.containsKey('RecordUserId')) {
      context.handle(
        _recordUserIdMeta,
        recordUserId.isAcceptableOrUnknown(
          data['RecordUserId']!,
          _recordUserIdMeta,
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
    if (data.containsKey('EventType')) {
      context.handle(
        _eventTypeMeta,
        eventType.isAcceptableOrUnknown(data['EventType']!, _eventTypeMeta),
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
    if (data.containsKey('RecordVersion')) {
      context.handle(
        _recordVersionMeta,
        recordVersion.isAcceptableOrUnknown(
          data['RecordVersion']!,
          _recordVersionMeta,
        ),
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
      recId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recID'],
      )!,
      jobMachineRecId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}JobMachineRef'],
      ),
      recordUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}RecordUserId'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}StartTime'],
      ),
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}EndTime'],
      ),
      eventType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}EventType'],
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
      recordVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}RecordVersion'],
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
  final String recId;
  final String? jobMachineRecId;
  final String? recordUserId;
  final String? startTime;
  final String? endTime;
  final String? eventType;
  final int status;
  final String? updatedAt;
  final String? lastSync;
  final int syncStatus;
  final int recordVersion;
  const DbJobMachineEventLog({
    required this.uid,
    required this.recId,
    this.jobMachineRecId,
    this.recordUserId,
    this.startTime,
    this.endTime,
    this.eventType,
    required this.status,
    this.updatedAt,
    this.lastSync,
    required this.syncStatus,
    required this.recordVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    map['recID'] = Variable<String>(recId);
    if (!nullToAbsent || jobMachineRecId != null) {
      map['JobMachineRef'] = Variable<String>(jobMachineRecId);
    }
    if (!nullToAbsent || recordUserId != null) {
      map['RecordUserId'] = Variable<String>(recordUserId);
    }
    if (!nullToAbsent || startTime != null) {
      map['StartTime'] = Variable<String>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['EndTime'] = Variable<String>(endTime);
    }
    if (!nullToAbsent || eventType != null) {
      map['EventType'] = Variable<String>(eventType);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    map['syncStatus'] = Variable<int>(syncStatus);
    map['RecordVersion'] = Variable<int>(recordVersion);
    return map;
  }

  JobMachineEventLogsCompanion toCompanion(bool nullToAbsent) {
    return JobMachineEventLogsCompanion(
      uid: Value(uid),
      recId: Value(recId),
      jobMachineRecId: jobMachineRecId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobMachineRecId),
      recordUserId: recordUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(recordUserId),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      eventType: eventType == null && nullToAbsent
          ? const Value.absent()
          : Value(eventType),
      status: Value(status),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      syncStatus: Value(syncStatus),
      recordVersion: Value(recordVersion),
    );
  }

  factory DbJobMachineEventLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbJobMachineEventLog(
      uid: serializer.fromJson<int>(json['uid']),
      recId: serializer.fromJson<String>(json['recId']),
      jobMachineRecId: serializer.fromJson<String?>(json['jobMachineRecId']),
      recordUserId: serializer.fromJson<String?>(json['recordUserId']),
      startTime: serializer.fromJson<String?>(json['startTime']),
      endTime: serializer.fromJson<String?>(json['endTime']),
      eventType: serializer.fromJson<String?>(json['eventType']),
      status: serializer.fromJson<int>(json['status']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
      recordVersion: serializer.fromJson<int>(json['recordVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'recId': serializer.toJson<String>(recId),
      'jobMachineRecId': serializer.toJson<String?>(jobMachineRecId),
      'recordUserId': serializer.toJson<String?>(recordUserId),
      'startTime': serializer.toJson<String?>(startTime),
      'endTime': serializer.toJson<String?>(endTime),
      'eventType': serializer.toJson<String?>(eventType),
      'status': serializer.toJson<int>(status),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'lastSync': serializer.toJson<String?>(lastSync),
      'syncStatus': serializer.toJson<int>(syncStatus),
      'recordVersion': serializer.toJson<int>(recordVersion),
    };
  }

  DbJobMachineEventLog copyWith({
    int? uid,
    String? recId,
    Value<String?> jobMachineRecId = const Value.absent(),
    Value<String?> recordUserId = const Value.absent(),
    Value<String?> startTime = const Value.absent(),
    Value<String?> endTime = const Value.absent(),
    Value<String?> eventType = const Value.absent(),
    int? status,
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> lastSync = const Value.absent(),
    int? syncStatus,
    int? recordVersion,
  }) => DbJobMachineEventLog(
    uid: uid ?? this.uid,
    recId: recId ?? this.recId,
    jobMachineRecId: jobMachineRecId.present
        ? jobMachineRecId.value
        : this.jobMachineRecId,
    recordUserId: recordUserId.present ? recordUserId.value : this.recordUserId,
    startTime: startTime.present ? startTime.value : this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    eventType: eventType.present ? eventType.value : this.eventType,
    status: status ?? this.status,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    syncStatus: syncStatus ?? this.syncStatus,
    recordVersion: recordVersion ?? this.recordVersion,
  );
  DbJobMachineEventLog copyWithCompanion(JobMachineEventLogsCompanion data) {
    return DbJobMachineEventLog(
      uid: data.uid.present ? data.uid.value : this.uid,
      recId: data.recId.present ? data.recId.value : this.recId,
      jobMachineRecId: data.jobMachineRecId.present
          ? data.jobMachineRecId.value
          : this.jobMachineRecId,
      recordUserId: data.recordUserId.present
          ? data.recordUserId.value
          : this.recordUserId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
      status: data.status.present ? data.status.value : this.status,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      recordVersion: data.recordVersion.present
          ? data.recordVersion.value
          : this.recordVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbJobMachineEventLog(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('jobMachineRecId: $jobMachineRecId, ')
          ..write('recordUserId: $recordUserId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('eventType: $eventType, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('recordVersion: $recordVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    recId,
    jobMachineRecId,
    recordUserId,
    startTime,
    endTime,
    eventType,
    status,
    updatedAt,
    lastSync,
    syncStatus,
    recordVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbJobMachineEventLog &&
          other.uid == this.uid &&
          other.recId == this.recId &&
          other.jobMachineRecId == this.jobMachineRecId &&
          other.recordUserId == this.recordUserId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.eventType == this.eventType &&
          other.status == this.status &&
          other.updatedAt == this.updatedAt &&
          other.lastSync == this.lastSync &&
          other.syncStatus == this.syncStatus &&
          other.recordVersion == this.recordVersion);
}

class JobMachineEventLogsCompanion
    extends UpdateCompanion<DbJobMachineEventLog> {
  final Value<int> uid;
  final Value<String> recId;
  final Value<String?> jobMachineRecId;
  final Value<String?> recordUserId;
  final Value<String?> startTime;
  final Value<String?> endTime;
  final Value<String?> eventType;
  final Value<int> status;
  final Value<String?> updatedAt;
  final Value<String?> lastSync;
  final Value<int> syncStatus;
  final Value<int> recordVersion;
  const JobMachineEventLogsCompanion({
    this.uid = const Value.absent(),
    this.recId = const Value.absent(),
    this.jobMachineRecId = const Value.absent(),
    this.recordUserId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.eventType = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.recordVersion = const Value.absent(),
  });
  JobMachineEventLogsCompanion.insert({
    this.uid = const Value.absent(),
    required String recId,
    this.jobMachineRecId = const Value.absent(),
    this.recordUserId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.eventType = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.recordVersion = const Value.absent(),
  }) : recId = Value(recId);
  static Insertable<DbJobMachineEventLog> custom({
    Expression<int>? uid,
    Expression<String>? recId,
    Expression<String>? jobMachineRecId,
    Expression<String>? recordUserId,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<String>? eventType,
    Expression<int>? status,
    Expression<String>? updatedAt,
    Expression<String>? lastSync,
    Expression<int>? syncStatus,
    Expression<int>? recordVersion,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (recId != null) 'recID': recId,
      if (jobMachineRecId != null) 'JobMachineRef': jobMachineRecId,
      if (recordUserId != null) 'RecordUserId': recordUserId,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (eventType != null) 'EventType': eventType,
      if (status != null) 'status': status,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (lastSync != null) 'lastSync': lastSync,
      if (syncStatus != null) 'syncStatus': syncStatus,
      if (recordVersion != null) 'RecordVersion': recordVersion,
    });
  }

  JobMachineEventLogsCompanion copyWith({
    Value<int>? uid,
    Value<String>? recId,
    Value<String?>? jobMachineRecId,
    Value<String?>? recordUserId,
    Value<String?>? startTime,
    Value<String?>? endTime,
    Value<String?>? eventType,
    Value<int>? status,
    Value<String?>? updatedAt,
    Value<String?>? lastSync,
    Value<int>? syncStatus,
    Value<int>? recordVersion,
  }) {
    return JobMachineEventLogsCompanion(
      uid: uid ?? this.uid,
      recId: recId ?? this.recId,
      jobMachineRecId: jobMachineRecId ?? this.jobMachineRecId,
      recordUserId: recordUserId ?? this.recordUserId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      eventType: eventType ?? this.eventType,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSync: lastSync ?? this.lastSync,
      syncStatus: syncStatus ?? this.syncStatus,
      recordVersion: recordVersion ?? this.recordVersion,
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
    if (jobMachineRecId.present) {
      map['JobMachineRef'] = Variable<String>(jobMachineRecId.value);
    }
    if (recordUserId.present) {
      map['RecordUserId'] = Variable<String>(recordUserId.value);
    }
    if (startTime.present) {
      map['StartTime'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['EndTime'] = Variable<String>(endTime.value);
    }
    if (eventType.present) {
      map['EventType'] = Variable<String>(eventType.value);
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
    if (recordVersion.present) {
      map['RecordVersion'] = Variable<int>(recordVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobMachineEventLogsCompanion(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('jobMachineRecId: $jobMachineRecId, ')
          ..write('recordUserId: $recordUserId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('eventType: $eventType, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('recordVersion: $recordVersion')
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
  static const VerificationMeta _recordVersionMeta = const VerificationMeta(
    'recordVersion',
  );
  @override
  late final GeneratedColumn<int> recordVersion = GeneratedColumn<int>(
    'RecordVersion',
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
    recordVersion,
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
    if (data.containsKey('RecordVersion')) {
      context.handle(
        _recordVersionMeta,
        recordVersion.isAcceptableOrUnknown(
          data['RecordVersion']!,
          _recordVersionMeta,
        ),
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
      recordVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}RecordVersion'],
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
  final int recordVersion;
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
    required this.recordVersion,
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
    map['RecordVersion'] = Variable<int>(recordVersion);
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
      recordVersion: Value(recordVersion),
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
      recordVersion: serializer.fromJson<int>(json['recordVersion']),
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
      'recordVersion': serializer.toJson<int>(recordVersion),
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
    int? recordVersion,
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
    recordVersion: recordVersion ?? this.recordVersion,
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
      recordVersion: data.recordVersion.present
          ? data.recordVersion.value
          : this.recordVersion,
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
          ..write('syncStatus: $syncStatus, ')
          ..write('recordVersion: $recordVersion')
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
    recordVersion,
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
          other.syncStatus == this.syncStatus &&
          other.recordVersion == this.recordVersion);
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
  final Value<int> recordVersion;
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
    this.recordVersion = const Value.absent(),
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
    this.recordVersion = const Value.absent(),
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
    Expression<int>? recordVersion,
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
      if (recordVersion != null) 'RecordVersion': recordVersion,
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
    Value<int>? recordVersion,
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
      recordVersion: recordVersion ?? this.recordVersion,
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
    if (recordVersion.present) {
      map['RecordVersion'] = Variable<int>(recordVersion.value);
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
          ..write('syncStatus: $syncStatus, ')
          ..write('recordVersion: $recordVersion')
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
  static const VerificationMeta _recIdMeta = const VerificationMeta('recId');
  @override
  late final GeneratedColumn<String> recId = GeneratedColumn<String>(
    'RecId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _recordVersionMeta = const VerificationMeta(
    'recordVersion',
  );
  @override
  late final GeneratedColumn<int> recordVersion = GeneratedColumn<int>(
    'RecordVersion',
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
    locationCode,
    userId,
    activityName,
    remark,
    checkInTime,
    checkOutTime,
    status,
    syncStatus,
    lastSync,
    recordVersion,
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
    if (data.containsKey('RecId')) {
      context.handle(
        _recIdMeta,
        recId.isAcceptableOrUnknown(data['RecId']!, _recIdMeta),
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
    if (data.containsKey('RecordVersion')) {
      context.handle(
        _recordVersionMeta,
        recordVersion.isAcceptableOrUnknown(
          data['RecordVersion']!,
          _recordVersionMeta,
        ),
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
      recId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}RecId'],
      ),
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
      recordVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}RecordVersion'],
      )!,
    );
  }

  @override
  $CheckInLogsTable createAlias(String alias) {
    return $CheckInLogsTable(attachedDatabase, alias);
  }
}

class DbCheckInLog extends DataClass implements Insertable<DbCheckInLog> {
  final int uid;
  final String? recId;
  final String? locationCode;
  final String? userId;
  final String? activityName;
  final String? remark;
  final String? checkInTime;
  final String? checkOutTime;
  final int status;
  final int syncStatus;
  final String? lastSync;
  final int recordVersion;
  const DbCheckInLog({
    required this.uid,
    this.recId,
    this.locationCode,
    this.userId,
    this.activityName,
    this.remark,
    this.checkInTime,
    this.checkOutTime,
    required this.status,
    required this.syncStatus,
    this.lastSync,
    required this.recordVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || recId != null) {
      map['RecId'] = Variable<String>(recId);
    }
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
    map['RecordVersion'] = Variable<int>(recordVersion);
    return map;
  }

  CheckInLogsCompanion toCompanion(bool nullToAbsent) {
    return CheckInLogsCompanion(
      uid: Value(uid),
      recId: recId == null && nullToAbsent
          ? const Value.absent()
          : Value(recId),
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
      recordVersion: Value(recordVersion),
    );
  }

  factory DbCheckInLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbCheckInLog(
      uid: serializer.fromJson<int>(json['uid']),
      recId: serializer.fromJson<String?>(json['recId']),
      locationCode: serializer.fromJson<String?>(json['locationCode']),
      userId: serializer.fromJson<String?>(json['userId']),
      activityName: serializer.fromJson<String?>(json['activityName']),
      remark: serializer.fromJson<String?>(json['remark']),
      checkInTime: serializer.fromJson<String?>(json['checkInTime']),
      checkOutTime: serializer.fromJson<String?>(json['checkOutTime']),
      status: serializer.fromJson<int>(json['status']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      recordVersion: serializer.fromJson<int>(json['recordVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'recId': serializer.toJson<String?>(recId),
      'locationCode': serializer.toJson<String?>(locationCode),
      'userId': serializer.toJson<String?>(userId),
      'activityName': serializer.toJson<String?>(activityName),
      'remark': serializer.toJson<String?>(remark),
      'checkInTime': serializer.toJson<String?>(checkInTime),
      'checkOutTime': serializer.toJson<String?>(checkOutTime),
      'status': serializer.toJson<int>(status),
      'syncStatus': serializer.toJson<int>(syncStatus),
      'lastSync': serializer.toJson<String?>(lastSync),
      'recordVersion': serializer.toJson<int>(recordVersion),
    };
  }

  DbCheckInLog copyWith({
    int? uid,
    Value<String?> recId = const Value.absent(),
    Value<String?> locationCode = const Value.absent(),
    Value<String?> userId = const Value.absent(),
    Value<String?> activityName = const Value.absent(),
    Value<String?> remark = const Value.absent(),
    Value<String?> checkInTime = const Value.absent(),
    Value<String?> checkOutTime = const Value.absent(),
    int? status,
    int? syncStatus,
    Value<String?> lastSync = const Value.absent(),
    int? recordVersion,
  }) => DbCheckInLog(
    uid: uid ?? this.uid,
    recId: recId.present ? recId.value : this.recId,
    locationCode: locationCode.present ? locationCode.value : this.locationCode,
    userId: userId.present ? userId.value : this.userId,
    activityName: activityName.present ? activityName.value : this.activityName,
    remark: remark.present ? remark.value : this.remark,
    checkInTime: checkInTime.present ? checkInTime.value : this.checkInTime,
    checkOutTime: checkOutTime.present ? checkOutTime.value : this.checkOutTime,
    status: status ?? this.status,
    syncStatus: syncStatus ?? this.syncStatus,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    recordVersion: recordVersion ?? this.recordVersion,
  );
  DbCheckInLog copyWithCompanion(CheckInLogsCompanion data) {
    return DbCheckInLog(
      uid: data.uid.present ? data.uid.value : this.uid,
      recId: data.recId.present ? data.recId.value : this.recId,
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
      recordVersion: data.recordVersion.present
          ? data.recordVersion.value
          : this.recordVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbCheckInLog(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('locationCode: $locationCode, ')
          ..write('userId: $userId, ')
          ..write('activityName: $activityName, ')
          ..write('remark: $remark, ')
          ..write('checkInTime: $checkInTime, ')
          ..write('checkOutTime: $checkOutTime, ')
          ..write('status: $status, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSync: $lastSync, ')
          ..write('recordVersion: $recordVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    recId,
    locationCode,
    userId,
    activityName,
    remark,
    checkInTime,
    checkOutTime,
    status,
    syncStatus,
    lastSync,
    recordVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbCheckInLog &&
          other.uid == this.uid &&
          other.recId == this.recId &&
          other.locationCode == this.locationCode &&
          other.userId == this.userId &&
          other.activityName == this.activityName &&
          other.remark == this.remark &&
          other.checkInTime == this.checkInTime &&
          other.checkOutTime == this.checkOutTime &&
          other.status == this.status &&
          other.syncStatus == this.syncStatus &&
          other.lastSync == this.lastSync &&
          other.recordVersion == this.recordVersion);
}

class CheckInLogsCompanion extends UpdateCompanion<DbCheckInLog> {
  final Value<int> uid;
  final Value<String?> recId;
  final Value<String?> locationCode;
  final Value<String?> userId;
  final Value<String?> activityName;
  final Value<String?> remark;
  final Value<String?> checkInTime;
  final Value<String?> checkOutTime;
  final Value<int> status;
  final Value<int> syncStatus;
  final Value<String?> lastSync;
  final Value<int> recordVersion;
  const CheckInLogsCompanion({
    this.uid = const Value.absent(),
    this.recId = const Value.absent(),
    this.locationCode = const Value.absent(),
    this.userId = const Value.absent(),
    this.activityName = const Value.absent(),
    this.remark = const Value.absent(),
    this.checkInTime = const Value.absent(),
    this.checkOutTime = const Value.absent(),
    this.status = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.recordVersion = const Value.absent(),
  });
  CheckInLogsCompanion.insert({
    this.uid = const Value.absent(),
    this.recId = const Value.absent(),
    this.locationCode = const Value.absent(),
    this.userId = const Value.absent(),
    this.activityName = const Value.absent(),
    this.remark = const Value.absent(),
    this.checkInTime = const Value.absent(),
    this.checkOutTime = const Value.absent(),
    this.status = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.recordVersion = const Value.absent(),
  });
  static Insertable<DbCheckInLog> custom({
    Expression<int>? uid,
    Expression<String>? recId,
    Expression<String>? locationCode,
    Expression<String>? userId,
    Expression<String>? activityName,
    Expression<String>? remark,
    Expression<String>? checkInTime,
    Expression<String>? checkOutTime,
    Expression<int>? status,
    Expression<int>? syncStatus,
    Expression<String>? lastSync,
    Expression<int>? recordVersion,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (recId != null) 'RecId': recId,
      if (locationCode != null) 'LocationCode': locationCode,
      if (userId != null) 'UserId': userId,
      if (activityName != null) 'ActivityName': activityName,
      if (remark != null) 'Remark': remark,
      if (checkInTime != null) 'CheckInTime': checkInTime,
      if (checkOutTime != null) 'CheckOutTime': checkOutTime,
      if (status != null) 'Status': status,
      if (syncStatus != null) 'SyncStatus': syncStatus,
      if (lastSync != null) 'LastSync': lastSync,
      if (recordVersion != null) 'RecordVersion': recordVersion,
    });
  }

  CheckInLogsCompanion copyWith({
    Value<int>? uid,
    Value<String?>? recId,
    Value<String?>? locationCode,
    Value<String?>? userId,
    Value<String?>? activityName,
    Value<String?>? remark,
    Value<String?>? checkInTime,
    Value<String?>? checkOutTime,
    Value<int>? status,
    Value<int>? syncStatus,
    Value<String?>? lastSync,
    Value<int>? recordVersion,
  }) {
    return CheckInLogsCompanion(
      uid: uid ?? this.uid,
      recId: recId ?? this.recId,
      locationCode: locationCode ?? this.locationCode,
      userId: userId ?? this.userId,
      activityName: activityName ?? this.activityName,
      remark: remark ?? this.remark,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      status: status ?? this.status,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSync: lastSync ?? this.lastSync,
      recordVersion: recordVersion ?? this.recordVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (recId.present) {
      map['RecId'] = Variable<String>(recId.value);
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
    if (recordVersion.present) {
      map['RecordVersion'] = Variable<int>(recordVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckInLogsCompanion(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('locationCode: $locationCode, ')
          ..write('userId: $userId, ')
          ..write('activityName: $activityName, ')
          ..write('remark: $remark, ')
          ..write('checkInTime: $checkInTime, ')
          ..write('checkOutTime: $checkOutTime, ')
          ..write('status: $status, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSync: $lastSync, ')
          ..write('recordVersion: $recordVersion')
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
  static const VerificationMeta _recordVersionMeta = const VerificationMeta(
    'recordVersion',
  );
  @override
  late final GeneratedColumn<int> recordVersion = GeneratedColumn<int>(
    'RecordVersion',
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
    machineNo,
    activityType,
    operatorId,
    startTime,
    endTime,
    status,
    remark,
    syncStatus,
    lastSync,
    recordVersion,
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
    if (data.containsKey('RecordVersion')) {
      context.handle(
        _recordVersionMeta,
        recordVersion.isAcceptableOrUnknown(
          data['RecordVersion']!,
          _recordVersionMeta,
        ),
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
      recordVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}RecordVersion'],
      )!,
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
  final int recordVersion;
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
    required this.recordVersion,
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
    map['RecordVersion'] = Variable<int>(recordVersion);
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
      recordVersion: Value(recordVersion),
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
      recordVersion: serializer.fromJson<int>(json['recordVersion']),
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
      'recordVersion': serializer.toJson<int>(recordVersion),
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
    int? recordVersion,
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
    recordVersion: recordVersion ?? this.recordVersion,
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
      recordVersion: data.recordVersion.present
          ? data.recordVersion.value
          : this.recordVersion,
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
          ..write('lastSync: $lastSync, ')
          ..write('recordVersion: $recordVersion')
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
    recordVersion,
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
          other.lastSync == this.lastSync &&
          other.recordVersion == this.recordVersion);
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
  final Value<int> recordVersion;
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
    this.recordVersion = const Value.absent(),
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
    this.recordVersion = const Value.absent(),
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
    Expression<int>? recordVersion,
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
      if (recordVersion != null) 'RecordVersion': recordVersion,
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
    Value<int>? recordVersion,
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
      recordVersion: recordVersion ?? this.recordVersion,
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
    if (recordVersion.present) {
      map['RecordVersion'] = Variable<int>(recordVersion.value);
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
          ..write('lastSync: $lastSync, ')
          ..write('recordVersion: $recordVersion')
          ..write(')'))
        .toString();
  }
}

class $MachinesTable extends Machines
    with TableInfo<$MachinesTable, DbMachine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MachinesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _barcodeGuidMeta = const VerificationMeta(
    'barcodeGuid',
  );
  @override
  late final GeneratedColumn<String> barcodeGuid = GeneratedColumn<String>(
    'barcodeGuid',
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
    'machineNo',
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
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
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
    machineId,
    barcodeGuid,
    machineNo,
    machineName,
    status,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'machines';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbMachine> instance, {
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
    if (data.containsKey('machineId')) {
      context.handle(
        _machineIdMeta,
        machineId.isAcceptableOrUnknown(data['machineId']!, _machineIdMeta),
      );
    }
    if (data.containsKey('barcodeGuid')) {
      context.handle(
        _barcodeGuidMeta,
        barcodeGuid.isAcceptableOrUnknown(
          data['barcodeGuid']!,
          _barcodeGuidMeta,
        ),
      );
    }
    if (data.containsKey('machineNo')) {
      context.handle(
        _machineNoMeta,
        machineNo.isAcceptableOrUnknown(data['machineNo']!, _machineNoMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbMachine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbMachine(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      machineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}machineId'],
      ),
      barcodeGuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcodeGuid'],
      ),
      machineNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}machineNo'],
      ),
      machineName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}machineName'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updatedAt'],
      ),
    );
  }

  @override
  $MachinesTable createAlias(String alias) {
    return $MachinesTable(attachedDatabase, alias);
  }
}

class DbMachine extends DataClass implements Insertable<DbMachine> {
  final int uid;
  final String? machineId;
  final String? barcodeGuid;
  final String? machineNo;
  final String? machineName;
  final String? status;
  final String? updatedAt;
  const DbMachine({
    required this.uid,
    this.machineId,
    this.barcodeGuid,
    this.machineNo,
    this.machineName,
    this.status,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || machineId != null) {
      map['machineId'] = Variable<String>(machineId);
    }
    if (!nullToAbsent || barcodeGuid != null) {
      map['barcodeGuid'] = Variable<String>(barcodeGuid);
    }
    if (!nullToAbsent || machineNo != null) {
      map['machineNo'] = Variable<String>(machineNo);
    }
    if (!nullToAbsent || machineName != null) {
      map['machineName'] = Variable<String>(machineName);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    return map;
  }

  MachinesCompanion toCompanion(bool nullToAbsent) {
    return MachinesCompanion(
      uid: Value(uid),
      machineId: machineId == null && nullToAbsent
          ? const Value.absent()
          : Value(machineId),
      barcodeGuid: barcodeGuid == null && nullToAbsent
          ? const Value.absent()
          : Value(barcodeGuid),
      machineNo: machineNo == null && nullToAbsent
          ? const Value.absent()
          : Value(machineNo),
      machineName: machineName == null && nullToAbsent
          ? const Value.absent()
          : Value(machineName),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbMachine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbMachine(
      uid: serializer.fromJson<int>(json['uid']),
      machineId: serializer.fromJson<String?>(json['machineId']),
      barcodeGuid: serializer.fromJson<String?>(json['barcodeGuid']),
      machineNo: serializer.fromJson<String?>(json['machineNo']),
      machineName: serializer.fromJson<String?>(json['machineName']),
      status: serializer.fromJson<String?>(json['status']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'machineId': serializer.toJson<String?>(machineId),
      'barcodeGuid': serializer.toJson<String?>(barcodeGuid),
      'machineNo': serializer.toJson<String?>(machineNo),
      'machineName': serializer.toJson<String?>(machineName),
      'status': serializer.toJson<String?>(status),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  DbMachine copyWith({
    int? uid,
    Value<String?> machineId = const Value.absent(),
    Value<String?> barcodeGuid = const Value.absent(),
    Value<String?> machineNo = const Value.absent(),
    Value<String?> machineName = const Value.absent(),
    Value<String?> status = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
  }) => DbMachine(
    uid: uid ?? this.uid,
    machineId: machineId.present ? machineId.value : this.machineId,
    barcodeGuid: barcodeGuid.present ? barcodeGuid.value : this.barcodeGuid,
    machineNo: machineNo.present ? machineNo.value : this.machineNo,
    machineName: machineName.present ? machineName.value : this.machineName,
    status: status.present ? status.value : this.status,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbMachine copyWithCompanion(MachinesCompanion data) {
    return DbMachine(
      uid: data.uid.present ? data.uid.value : this.uid,
      machineId: data.machineId.present ? data.machineId.value : this.machineId,
      barcodeGuid: data.barcodeGuid.present
          ? data.barcodeGuid.value
          : this.barcodeGuid,
      machineNo: data.machineNo.present ? data.machineNo.value : this.machineNo,
      machineName: data.machineName.present
          ? data.machineName.value
          : this.machineName,
      status: data.status.present ? data.status.value : this.status,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbMachine(')
          ..write('uid: $uid, ')
          ..write('machineId: $machineId, ')
          ..write('barcodeGuid: $barcodeGuid, ')
          ..write('machineNo: $machineNo, ')
          ..write('machineName: $machineName, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    machineId,
    barcodeGuid,
    machineNo,
    machineName,
    status,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbMachine &&
          other.uid == this.uid &&
          other.machineId == this.machineId &&
          other.barcodeGuid == this.barcodeGuid &&
          other.machineNo == this.machineNo &&
          other.machineName == this.machineName &&
          other.status == this.status &&
          other.updatedAt == this.updatedAt);
}

class MachinesCompanion extends UpdateCompanion<DbMachine> {
  final Value<int> uid;
  final Value<String?> machineId;
  final Value<String?> barcodeGuid;
  final Value<String?> machineNo;
  final Value<String?> machineName;
  final Value<String?> status;
  final Value<String?> updatedAt;
  const MachinesCompanion({
    this.uid = const Value.absent(),
    this.machineId = const Value.absent(),
    this.barcodeGuid = const Value.absent(),
    this.machineNo = const Value.absent(),
    this.machineName = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MachinesCompanion.insert({
    this.uid = const Value.absent(),
    this.machineId = const Value.absent(),
    this.barcodeGuid = const Value.absent(),
    this.machineNo = const Value.absent(),
    this.machineName = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<DbMachine> custom({
    Expression<int>? uid,
    Expression<String>? machineId,
    Expression<String>? barcodeGuid,
    Expression<String>? machineNo,
    Expression<String>? machineName,
    Expression<String>? status,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (machineId != null) 'machineId': machineId,
      if (barcodeGuid != null) 'barcodeGuid': barcodeGuid,
      if (machineNo != null) 'machineNo': machineNo,
      if (machineName != null) 'machineName': machineName,
      if (status != null) 'status': status,
      if (updatedAt != null) 'updatedAt': updatedAt,
    });
  }

  MachinesCompanion copyWith({
    Value<int>? uid,
    Value<String?>? machineId,
    Value<String?>? barcodeGuid,
    Value<String?>? machineNo,
    Value<String?>? machineName,
    Value<String?>? status,
    Value<String?>? updatedAt,
  }) {
    return MachinesCompanion(
      uid: uid ?? this.uid,
      machineId: machineId ?? this.machineId,
      barcodeGuid: barcodeGuid ?? this.barcodeGuid,
      machineNo: machineNo ?? this.machineNo,
      machineName: machineName ?? this.machineName,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (machineId.present) {
      map['machineId'] = Variable<String>(machineId.value);
    }
    if (barcodeGuid.present) {
      map['barcodeGuid'] = Variable<String>(barcodeGuid.value);
    }
    if (machineNo.present) {
      map['machineNo'] = Variable<String>(machineNo.value);
    }
    if (machineName.present) {
      map['machineName'] = Variable<String>(machineName.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (updatedAt.present) {
      map['updatedAt'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MachinesCompanion(')
          ..write('uid: $uid, ')
          ..write('machineId: $machineId, ')
          ..write('barcodeGuid: $barcodeGuid, ')
          ..write('machineNo: $machineNo, ')
          ..write('machineName: $machineName, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SyncLogsTable extends SyncLogs
    with TableInfo<$SyncLogsTable, DbSyncLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncLogsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _syncTypeMeta = const VerificationMeta(
    'syncType',
  );
  @override
  late final GeneratedColumn<String> syncType = GeneratedColumn<String>(
    'SyncType',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'Status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'Message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<String> timestamp = GeneratedColumn<String>(
    'Timestamp',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    syncType,
    status,
    message,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbSyncLog> instance, {
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
    if (data.containsKey('SyncType')) {
      context.handle(
        _syncTypeMeta,
        syncType.isAcceptableOrUnknown(data['SyncType']!, _syncTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_syncTypeMeta);
    }
    if (data.containsKey('Status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['Status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('Message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['Message']!, _messageMeta),
      );
    }
    if (data.containsKey('Timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['Timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbSyncLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbSyncLog(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      syncType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}SyncType'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}Status'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Message'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Timestamp'],
      )!,
    );
  }

  @override
  $SyncLogsTable createAlias(String alias) {
    return $SyncLogsTable(attachedDatabase, alias);
  }
}

class DbSyncLog extends DataClass implements Insertable<DbSyncLog> {
  final int uid;
  final String syncType;
  final int status;
  final String? message;
  final String timestamp;
  const DbSyncLog({
    required this.uid,
    required this.syncType,
    required this.status,
    this.message,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    map['SyncType'] = Variable<String>(syncType);
    map['Status'] = Variable<int>(status);
    if (!nullToAbsent || message != null) {
      map['Message'] = Variable<String>(message);
    }
    map['Timestamp'] = Variable<String>(timestamp);
    return map;
  }

  SyncLogsCompanion toCompanion(bool nullToAbsent) {
    return SyncLogsCompanion(
      uid: Value(uid),
      syncType: Value(syncType),
      status: Value(status),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      timestamp: Value(timestamp),
    );
  }

  factory DbSyncLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSyncLog(
      uid: serializer.fromJson<int>(json['uid']),
      syncType: serializer.fromJson<String>(json['syncType']),
      status: serializer.fromJson<int>(json['status']),
      message: serializer.fromJson<String?>(json['message']),
      timestamp: serializer.fromJson<String>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'syncType': serializer.toJson<String>(syncType),
      'status': serializer.toJson<int>(status),
      'message': serializer.toJson<String?>(message),
      'timestamp': serializer.toJson<String>(timestamp),
    };
  }

  DbSyncLog copyWith({
    int? uid,
    String? syncType,
    int? status,
    Value<String?> message = const Value.absent(),
    String? timestamp,
  }) => DbSyncLog(
    uid: uid ?? this.uid,
    syncType: syncType ?? this.syncType,
    status: status ?? this.status,
    message: message.present ? message.value : this.message,
    timestamp: timestamp ?? this.timestamp,
  );
  DbSyncLog copyWithCompanion(SyncLogsCompanion data) {
    return DbSyncLog(
      uid: data.uid.present ? data.uid.value : this.uid,
      syncType: data.syncType.present ? data.syncType.value : this.syncType,
      status: data.status.present ? data.status.value : this.status,
      message: data.message.present ? data.message.value : this.message,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbSyncLog(')
          ..write('uid: $uid, ')
          ..write('syncType: $syncType, ')
          ..write('status: $status, ')
          ..write('message: $message, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, syncType, status, message, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSyncLog &&
          other.uid == this.uid &&
          other.syncType == this.syncType &&
          other.status == this.status &&
          other.message == this.message &&
          other.timestamp == this.timestamp);
}

class SyncLogsCompanion extends UpdateCompanion<DbSyncLog> {
  final Value<int> uid;
  final Value<String> syncType;
  final Value<int> status;
  final Value<String?> message;
  final Value<String> timestamp;
  const SyncLogsCompanion({
    this.uid = const Value.absent(),
    this.syncType = const Value.absent(),
    this.status = const Value.absent(),
    this.message = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  SyncLogsCompanion.insert({
    this.uid = const Value.absent(),
    required String syncType,
    required int status,
    this.message = const Value.absent(),
    required String timestamp,
  }) : syncType = Value(syncType),
       status = Value(status),
       timestamp = Value(timestamp);
  static Insertable<DbSyncLog> custom({
    Expression<int>? uid,
    Expression<String>? syncType,
    Expression<int>? status,
    Expression<String>? message,
    Expression<String>? timestamp,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (syncType != null) 'SyncType': syncType,
      if (status != null) 'Status': status,
      if (message != null) 'Message': message,
      if (timestamp != null) 'Timestamp': timestamp,
    });
  }

  SyncLogsCompanion copyWith({
    Value<int>? uid,
    Value<String>? syncType,
    Value<int>? status,
    Value<String?>? message,
    Value<String>? timestamp,
  }) {
    return SyncLogsCompanion(
      uid: uid ?? this.uid,
      syncType: syncType ?? this.syncType,
      status: status ?? this.status,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (syncType.present) {
      map['SyncType'] = Variable<String>(syncType.value);
    }
    if (status.present) {
      map['Status'] = Variable<int>(status.value);
    }
    if (message.present) {
      map['Message'] = Variable<String>(message.value);
    }
    if (timestamp.present) {
      map['Timestamp'] = Variable<String>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncLogsCompanion(')
          ..write('uid: $uid, ')
          ..write('syncType: $syncType, ')
          ..write('status: $status, ')
          ..write('message: $message, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $MachineSummariesTable extends MachineSummaries
    with TableInfo<$MachineSummariesTable, DbMachineSummary> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MachineSummariesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _machineIdMeta = const VerificationMeta(
    'machineId',
  );
  @override
  late final GeneratedColumn<String> machineId = GeneratedColumn<String>(
    'MachineID',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
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
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'Status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentJobIdMeta = const VerificationMeta(
    'currentJobId',
  );
  @override
  late final GeneratedColumn<String> currentJobId = GeneratedColumn<String>(
    'CurrentJobID',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentJobNameMeta = const VerificationMeta(
    'currentJobName',
  );
  @override
  late final GeneratedColumn<String> currentJobName = GeneratedColumn<String>(
    'CurrentJobName',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _oeePercentMeta = const VerificationMeta(
    'oeePercent',
  );
  @override
  late final GeneratedColumn<double> oeePercent = GeneratedColumn<double>(
    'OEE',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _availabilityMeta = const VerificationMeta(
    'availability',
  );
  @override
  late final GeneratedColumn<double> availability = GeneratedColumn<double>(
    'Availability',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _performanceMeta = const VerificationMeta(
    'performance',
  );
  @override
  late final GeneratedColumn<double> performance = GeneratedColumn<double>(
    'Performance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _qualityMeta = const VerificationMeta(
    'quality',
  );
  @override
  late final GeneratedColumn<double> quality = GeneratedColumn<double>(
    'Quality',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'UpdatedAt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    machineId,
    machineName,
    status,
    currentJobId,
    currentJobName,
    oeePercent,
    availability,
    performance,
    quality,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'machine_summaries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbMachineSummary> instance, {
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
    if (data.containsKey('MachineID')) {
      context.handle(
        _machineIdMeta,
        machineId.isAcceptableOrUnknown(data['MachineID']!, _machineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_machineIdMeta);
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
    if (data.containsKey('Status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['Status']!, _statusMeta),
      );
    }
    if (data.containsKey('CurrentJobID')) {
      context.handle(
        _currentJobIdMeta,
        currentJobId.isAcceptableOrUnknown(
          data['CurrentJobID']!,
          _currentJobIdMeta,
        ),
      );
    }
    if (data.containsKey('CurrentJobName')) {
      context.handle(
        _currentJobNameMeta,
        currentJobName.isAcceptableOrUnknown(
          data['CurrentJobName']!,
          _currentJobNameMeta,
        ),
      );
    }
    if (data.containsKey('OEE')) {
      context.handle(
        _oeePercentMeta,
        oeePercent.isAcceptableOrUnknown(data['OEE']!, _oeePercentMeta),
      );
    }
    if (data.containsKey('Availability')) {
      context.handle(
        _availabilityMeta,
        availability.isAcceptableOrUnknown(
          data['Availability']!,
          _availabilityMeta,
        ),
      );
    }
    if (data.containsKey('Performance')) {
      context.handle(
        _performanceMeta,
        performance.isAcceptableOrUnknown(
          data['Performance']!,
          _performanceMeta,
        ),
      );
    }
    if (data.containsKey('Quality')) {
      context.handle(
        _qualityMeta,
        quality.isAcceptableOrUnknown(data['Quality']!, _qualityMeta),
      );
    }
    if (data.containsKey('UpdatedAt')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['UpdatedAt']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbMachineSummary map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbMachineSummary(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      machineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineID'],
      )!,
      machineName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineName'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Status'],
      ),
      currentJobId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CurrentJobID'],
      ),
      currentJobName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CurrentJobName'],
      ),
      oeePercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}OEE'],
      )!,
      availability: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}Availability'],
      )!,
      performance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}Performance'],
      )!,
      quality: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}Quality'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}UpdatedAt'],
      ),
    );
  }

  @override
  $MachineSummariesTable createAlias(String alias) {
    return $MachineSummariesTable(attachedDatabase, alias);
  }
}

class DbMachineSummary extends DataClass
    implements Insertable<DbMachineSummary> {
  final int uid;
  final String machineId;
  final String? machineName;
  final String? status;
  final String? currentJobId;
  final String? currentJobName;
  final double oeePercent;
  final double availability;
  final double performance;
  final double quality;
  final String? updatedAt;
  const DbMachineSummary({
    required this.uid,
    required this.machineId,
    this.machineName,
    this.status,
    this.currentJobId,
    this.currentJobName,
    required this.oeePercent,
    required this.availability,
    required this.performance,
    required this.quality,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    map['MachineID'] = Variable<String>(machineId);
    if (!nullToAbsent || machineName != null) {
      map['MachineName'] = Variable<String>(machineName);
    }
    if (!nullToAbsent || status != null) {
      map['Status'] = Variable<String>(status);
    }
    if (!nullToAbsent || currentJobId != null) {
      map['CurrentJobID'] = Variable<String>(currentJobId);
    }
    if (!nullToAbsent || currentJobName != null) {
      map['CurrentJobName'] = Variable<String>(currentJobName);
    }
    map['OEE'] = Variable<double>(oeePercent);
    map['Availability'] = Variable<double>(availability);
    map['Performance'] = Variable<double>(performance);
    map['Quality'] = Variable<double>(quality);
    if (!nullToAbsent || updatedAt != null) {
      map['UpdatedAt'] = Variable<String>(updatedAt);
    }
    return map;
  }

  MachineSummariesCompanion toCompanion(bool nullToAbsent) {
    return MachineSummariesCompanion(
      uid: Value(uid),
      machineId: Value(machineId),
      machineName: machineName == null && nullToAbsent
          ? const Value.absent()
          : Value(machineName),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      currentJobId: currentJobId == null && nullToAbsent
          ? const Value.absent()
          : Value(currentJobId),
      currentJobName: currentJobName == null && nullToAbsent
          ? const Value.absent()
          : Value(currentJobName),
      oeePercent: Value(oeePercent),
      availability: Value(availability),
      performance: Value(performance),
      quality: Value(quality),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbMachineSummary.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbMachineSummary(
      uid: serializer.fromJson<int>(json['uid']),
      machineId: serializer.fromJson<String>(json['machineId']),
      machineName: serializer.fromJson<String?>(json['machineName']),
      status: serializer.fromJson<String?>(json['status']),
      currentJobId: serializer.fromJson<String?>(json['currentJobId']),
      currentJobName: serializer.fromJson<String?>(json['currentJobName']),
      oeePercent: serializer.fromJson<double>(json['oeePercent']),
      availability: serializer.fromJson<double>(json['availability']),
      performance: serializer.fromJson<double>(json['performance']),
      quality: serializer.fromJson<double>(json['quality']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'machineId': serializer.toJson<String>(machineId),
      'machineName': serializer.toJson<String?>(machineName),
      'status': serializer.toJson<String?>(status),
      'currentJobId': serializer.toJson<String?>(currentJobId),
      'currentJobName': serializer.toJson<String?>(currentJobName),
      'oeePercent': serializer.toJson<double>(oeePercent),
      'availability': serializer.toJson<double>(availability),
      'performance': serializer.toJson<double>(performance),
      'quality': serializer.toJson<double>(quality),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  DbMachineSummary copyWith({
    int? uid,
    String? machineId,
    Value<String?> machineName = const Value.absent(),
    Value<String?> status = const Value.absent(),
    Value<String?> currentJobId = const Value.absent(),
    Value<String?> currentJobName = const Value.absent(),
    double? oeePercent,
    double? availability,
    double? performance,
    double? quality,
    Value<String?> updatedAt = const Value.absent(),
  }) => DbMachineSummary(
    uid: uid ?? this.uid,
    machineId: machineId ?? this.machineId,
    machineName: machineName.present ? machineName.value : this.machineName,
    status: status.present ? status.value : this.status,
    currentJobId: currentJobId.present ? currentJobId.value : this.currentJobId,
    currentJobName: currentJobName.present
        ? currentJobName.value
        : this.currentJobName,
    oeePercent: oeePercent ?? this.oeePercent,
    availability: availability ?? this.availability,
    performance: performance ?? this.performance,
    quality: quality ?? this.quality,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  DbMachineSummary copyWithCompanion(MachineSummariesCompanion data) {
    return DbMachineSummary(
      uid: data.uid.present ? data.uid.value : this.uid,
      machineId: data.machineId.present ? data.machineId.value : this.machineId,
      machineName: data.machineName.present
          ? data.machineName.value
          : this.machineName,
      status: data.status.present ? data.status.value : this.status,
      currentJobId: data.currentJobId.present
          ? data.currentJobId.value
          : this.currentJobId,
      currentJobName: data.currentJobName.present
          ? data.currentJobName.value
          : this.currentJobName,
      oeePercent: data.oeePercent.present
          ? data.oeePercent.value
          : this.oeePercent,
      availability: data.availability.present
          ? data.availability.value
          : this.availability,
      performance: data.performance.present
          ? data.performance.value
          : this.performance,
      quality: data.quality.present ? data.quality.value : this.quality,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbMachineSummary(')
          ..write('uid: $uid, ')
          ..write('machineId: $machineId, ')
          ..write('machineName: $machineName, ')
          ..write('status: $status, ')
          ..write('currentJobId: $currentJobId, ')
          ..write('currentJobName: $currentJobName, ')
          ..write('oeePercent: $oeePercent, ')
          ..write('availability: $availability, ')
          ..write('performance: $performance, ')
          ..write('quality: $quality, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    machineId,
    machineName,
    status,
    currentJobId,
    currentJobName,
    oeePercent,
    availability,
    performance,
    quality,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbMachineSummary &&
          other.uid == this.uid &&
          other.machineId == this.machineId &&
          other.machineName == this.machineName &&
          other.status == this.status &&
          other.currentJobId == this.currentJobId &&
          other.currentJobName == this.currentJobName &&
          other.oeePercent == this.oeePercent &&
          other.availability == this.availability &&
          other.performance == this.performance &&
          other.quality == this.quality &&
          other.updatedAt == this.updatedAt);
}

class MachineSummariesCompanion extends UpdateCompanion<DbMachineSummary> {
  final Value<int> uid;
  final Value<String> machineId;
  final Value<String?> machineName;
  final Value<String?> status;
  final Value<String?> currentJobId;
  final Value<String?> currentJobName;
  final Value<double> oeePercent;
  final Value<double> availability;
  final Value<double> performance;
  final Value<double> quality;
  final Value<String?> updatedAt;
  const MachineSummariesCompanion({
    this.uid = const Value.absent(),
    this.machineId = const Value.absent(),
    this.machineName = const Value.absent(),
    this.status = const Value.absent(),
    this.currentJobId = const Value.absent(),
    this.currentJobName = const Value.absent(),
    this.oeePercent = const Value.absent(),
    this.availability = const Value.absent(),
    this.performance = const Value.absent(),
    this.quality = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MachineSummariesCompanion.insert({
    this.uid = const Value.absent(),
    required String machineId,
    this.machineName = const Value.absent(),
    this.status = const Value.absent(),
    this.currentJobId = const Value.absent(),
    this.currentJobName = const Value.absent(),
    this.oeePercent = const Value.absent(),
    this.availability = const Value.absent(),
    this.performance = const Value.absent(),
    this.quality = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : machineId = Value(machineId);
  static Insertable<DbMachineSummary> custom({
    Expression<int>? uid,
    Expression<String>? machineId,
    Expression<String>? machineName,
    Expression<String>? status,
    Expression<String>? currentJobId,
    Expression<String>? currentJobName,
    Expression<double>? oeePercent,
    Expression<double>? availability,
    Expression<double>? performance,
    Expression<double>? quality,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (machineId != null) 'MachineID': machineId,
      if (machineName != null) 'MachineName': machineName,
      if (status != null) 'Status': status,
      if (currentJobId != null) 'CurrentJobID': currentJobId,
      if (currentJobName != null) 'CurrentJobName': currentJobName,
      if (oeePercent != null) 'OEE': oeePercent,
      if (availability != null) 'Availability': availability,
      if (performance != null) 'Performance': performance,
      if (quality != null) 'Quality': quality,
      if (updatedAt != null) 'UpdatedAt': updatedAt,
    });
  }

  MachineSummariesCompanion copyWith({
    Value<int>? uid,
    Value<String>? machineId,
    Value<String?>? machineName,
    Value<String?>? status,
    Value<String?>? currentJobId,
    Value<String?>? currentJobName,
    Value<double>? oeePercent,
    Value<double>? availability,
    Value<double>? performance,
    Value<double>? quality,
    Value<String?>? updatedAt,
  }) {
    return MachineSummariesCompanion(
      uid: uid ?? this.uid,
      machineId: machineId ?? this.machineId,
      machineName: machineName ?? this.machineName,
      status: status ?? this.status,
      currentJobId: currentJobId ?? this.currentJobId,
      currentJobName: currentJobName ?? this.currentJobName,
      oeePercent: oeePercent ?? this.oeePercent,
      availability: availability ?? this.availability,
      performance: performance ?? this.performance,
      quality: quality ?? this.quality,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (machineId.present) {
      map['MachineID'] = Variable<String>(machineId.value);
    }
    if (machineName.present) {
      map['MachineName'] = Variable<String>(machineName.value);
    }
    if (status.present) {
      map['Status'] = Variable<String>(status.value);
    }
    if (currentJobId.present) {
      map['CurrentJobID'] = Variable<String>(currentJobId.value);
    }
    if (currentJobName.present) {
      map['CurrentJobName'] = Variable<String>(currentJobName.value);
    }
    if (oeePercent.present) {
      map['OEE'] = Variable<double>(oeePercent.value);
    }
    if (availability.present) {
      map['Availability'] = Variable<double>(availability.value);
    }
    if (performance.present) {
      map['Performance'] = Variable<double>(performance.value);
    }
    if (quality.present) {
      map['Quality'] = Variable<double>(quality.value);
    }
    if (updatedAt.present) {
      map['UpdatedAt'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MachineSummariesCompanion(')
          ..write('uid: $uid, ')
          ..write('machineId: $machineId, ')
          ..write('machineName: $machineName, ')
          ..write('status: $status, ')
          ..write('currentJobId: $currentJobId, ')
          ..write('currentJobName: $currentJobName, ')
          ..write('oeePercent: $oeePercent, ')
          ..write('availability: $availability, ')
          ..write('performance: $performance, ')
          ..write('quality: $quality, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MachineSummaryItemsTable extends MachineSummaryItems
    with TableInfo<$MachineSummaryItemsTable, DbMachineSummaryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MachineSummaryItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _machineIdMeta = const VerificationMeta(
    'machineId',
  );
  @override
  late final GeneratedColumn<String> machineId = GeneratedColumn<String>(
    'MachineID',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recIdMeta = const VerificationMeta('recId');
  @override
  late final GeneratedColumn<String> recId = GeneratedColumn<String>(
    'RecID',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jobTestSetRecIdMeta = const VerificationMeta(
    'jobTestSetRecId',
  );
  @override
  late final GeneratedColumn<String> jobTestSetRecId = GeneratedColumn<String>(
    'JobTestSetRecID',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _testSetNameMeta = const VerificationMeta(
    'testSetName',
  );
  @override
  late final GeneratedColumn<String> testSetName = GeneratedColumn<String>(
    'TestSetName',
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
  static const VerificationMeta _registerDateTimeMeta = const VerificationMeta(
    'registerDateTime',
  );
  @override
  late final GeneratedColumn<String> registerDateTime = GeneratedColumn<String>(
    'RegisterDateTime',
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
    'RegisterUser',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'Status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    machineId,
    recId,
    jobTestSetRecId,
    testSetName,
    jobName,
    registerDateTime,
    registerUser,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'machine_summary_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbMachineSummaryItem> instance, {
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
    if (data.containsKey('MachineID')) {
      context.handle(
        _machineIdMeta,
        machineId.isAcceptableOrUnknown(data['MachineID']!, _machineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_machineIdMeta);
    }
    if (data.containsKey('RecID')) {
      context.handle(
        _recIdMeta,
        recId.isAcceptableOrUnknown(data['RecID']!, _recIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recIdMeta);
    }
    if (data.containsKey('JobTestSetRecID')) {
      context.handle(
        _jobTestSetRecIdMeta,
        jobTestSetRecId.isAcceptableOrUnknown(
          data['JobTestSetRecID']!,
          _jobTestSetRecIdMeta,
        ),
      );
    }
    if (data.containsKey('TestSetName')) {
      context.handle(
        _testSetNameMeta,
        testSetName.isAcceptableOrUnknown(
          data['TestSetName']!,
          _testSetNameMeta,
        ),
      );
    }
    if (data.containsKey('JobName')) {
      context.handle(
        _jobNameMeta,
        jobName.isAcceptableOrUnknown(data['JobName']!, _jobNameMeta),
      );
    }
    if (data.containsKey('RegisterDateTime')) {
      context.handle(
        _registerDateTimeMeta,
        registerDateTime.isAcceptableOrUnknown(
          data['RegisterDateTime']!,
          _registerDateTimeMeta,
        ),
      );
    }
    if (data.containsKey('RegisterUser')) {
      context.handle(
        _registerUserMeta,
        registerUser.isAcceptableOrUnknown(
          data['RegisterUser']!,
          _registerUserMeta,
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
  DbMachineSummaryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbMachineSummaryItem(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      machineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineID'],
      )!,
      recId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}RecID'],
      )!,
      jobTestSetRecId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}JobTestSetRecID'],
      ),
      testSetName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}TestSetName'],
      ),
      jobName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}JobName'],
      ),
      registerDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}RegisterDateTime'],
      ),
      registerUser: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}RegisterUser'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}Status'],
      ),
    );
  }

  @override
  $MachineSummaryItemsTable createAlias(String alias) {
    return $MachineSummaryItemsTable(attachedDatabase, alias);
  }
}

class DbMachineSummaryItem extends DataClass
    implements Insertable<DbMachineSummaryItem> {
  final int uid;
  final String machineId;
  final String recId;
  final String? jobTestSetRecId;
  final String? testSetName;
  final String? jobName;
  final String? registerDateTime;
  final String? registerUser;
  final String? status;
  const DbMachineSummaryItem({
    required this.uid,
    required this.machineId,
    required this.recId,
    this.jobTestSetRecId,
    this.testSetName,
    this.jobName,
    this.registerDateTime,
    this.registerUser,
    this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    map['MachineID'] = Variable<String>(machineId);
    map['RecID'] = Variable<String>(recId);
    if (!nullToAbsent || jobTestSetRecId != null) {
      map['JobTestSetRecID'] = Variable<String>(jobTestSetRecId);
    }
    if (!nullToAbsent || testSetName != null) {
      map['TestSetName'] = Variable<String>(testSetName);
    }
    if (!nullToAbsent || jobName != null) {
      map['JobName'] = Variable<String>(jobName);
    }
    if (!nullToAbsent || registerDateTime != null) {
      map['RegisterDateTime'] = Variable<String>(registerDateTime);
    }
    if (!nullToAbsent || registerUser != null) {
      map['RegisterUser'] = Variable<String>(registerUser);
    }
    if (!nullToAbsent || status != null) {
      map['Status'] = Variable<String>(status);
    }
    return map;
  }

  MachineSummaryItemsCompanion toCompanion(bool nullToAbsent) {
    return MachineSummaryItemsCompanion(
      uid: Value(uid),
      machineId: Value(machineId),
      recId: Value(recId),
      jobTestSetRecId: jobTestSetRecId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobTestSetRecId),
      testSetName: testSetName == null && nullToAbsent
          ? const Value.absent()
          : Value(testSetName),
      jobName: jobName == null && nullToAbsent
          ? const Value.absent()
          : Value(jobName),
      registerDateTime: registerDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(registerDateTime),
      registerUser: registerUser == null && nullToAbsent
          ? const Value.absent()
          : Value(registerUser),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
    );
  }

  factory DbMachineSummaryItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbMachineSummaryItem(
      uid: serializer.fromJson<int>(json['uid']),
      machineId: serializer.fromJson<String>(json['machineId']),
      recId: serializer.fromJson<String>(json['recId']),
      jobTestSetRecId: serializer.fromJson<String?>(json['jobTestSetRecId']),
      testSetName: serializer.fromJson<String?>(json['testSetName']),
      jobName: serializer.fromJson<String?>(json['jobName']),
      registerDateTime: serializer.fromJson<String?>(json['registerDateTime']),
      registerUser: serializer.fromJson<String?>(json['registerUser']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'machineId': serializer.toJson<String>(machineId),
      'recId': serializer.toJson<String>(recId),
      'jobTestSetRecId': serializer.toJson<String?>(jobTestSetRecId),
      'testSetName': serializer.toJson<String?>(testSetName),
      'jobName': serializer.toJson<String?>(jobName),
      'registerDateTime': serializer.toJson<String?>(registerDateTime),
      'registerUser': serializer.toJson<String?>(registerUser),
      'status': serializer.toJson<String?>(status),
    };
  }

  DbMachineSummaryItem copyWith({
    int? uid,
    String? machineId,
    String? recId,
    Value<String?> jobTestSetRecId = const Value.absent(),
    Value<String?> testSetName = const Value.absent(),
    Value<String?> jobName = const Value.absent(),
    Value<String?> registerDateTime = const Value.absent(),
    Value<String?> registerUser = const Value.absent(),
    Value<String?> status = const Value.absent(),
  }) => DbMachineSummaryItem(
    uid: uid ?? this.uid,
    machineId: machineId ?? this.machineId,
    recId: recId ?? this.recId,
    jobTestSetRecId: jobTestSetRecId.present
        ? jobTestSetRecId.value
        : this.jobTestSetRecId,
    testSetName: testSetName.present ? testSetName.value : this.testSetName,
    jobName: jobName.present ? jobName.value : this.jobName,
    registerDateTime: registerDateTime.present
        ? registerDateTime.value
        : this.registerDateTime,
    registerUser: registerUser.present ? registerUser.value : this.registerUser,
    status: status.present ? status.value : this.status,
  );
  DbMachineSummaryItem copyWithCompanion(MachineSummaryItemsCompanion data) {
    return DbMachineSummaryItem(
      uid: data.uid.present ? data.uid.value : this.uid,
      machineId: data.machineId.present ? data.machineId.value : this.machineId,
      recId: data.recId.present ? data.recId.value : this.recId,
      jobTestSetRecId: data.jobTestSetRecId.present
          ? data.jobTestSetRecId.value
          : this.jobTestSetRecId,
      testSetName: data.testSetName.present
          ? data.testSetName.value
          : this.testSetName,
      jobName: data.jobName.present ? data.jobName.value : this.jobName,
      registerDateTime: data.registerDateTime.present
          ? data.registerDateTime.value
          : this.registerDateTime,
      registerUser: data.registerUser.present
          ? data.registerUser.value
          : this.registerUser,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbMachineSummaryItem(')
          ..write('uid: $uid, ')
          ..write('machineId: $machineId, ')
          ..write('recId: $recId, ')
          ..write('jobTestSetRecId: $jobTestSetRecId, ')
          ..write('testSetName: $testSetName, ')
          ..write('jobName: $jobName, ')
          ..write('registerDateTime: $registerDateTime, ')
          ..write('registerUser: $registerUser, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    machineId,
    recId,
    jobTestSetRecId,
    testSetName,
    jobName,
    registerDateTime,
    registerUser,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbMachineSummaryItem &&
          other.uid == this.uid &&
          other.machineId == this.machineId &&
          other.recId == this.recId &&
          other.jobTestSetRecId == this.jobTestSetRecId &&
          other.testSetName == this.testSetName &&
          other.jobName == this.jobName &&
          other.registerDateTime == this.registerDateTime &&
          other.registerUser == this.registerUser &&
          other.status == this.status);
}

class MachineSummaryItemsCompanion
    extends UpdateCompanion<DbMachineSummaryItem> {
  final Value<int> uid;
  final Value<String> machineId;
  final Value<String> recId;
  final Value<String?> jobTestSetRecId;
  final Value<String?> testSetName;
  final Value<String?> jobName;
  final Value<String?> registerDateTime;
  final Value<String?> registerUser;
  final Value<String?> status;
  const MachineSummaryItemsCompanion({
    this.uid = const Value.absent(),
    this.machineId = const Value.absent(),
    this.recId = const Value.absent(),
    this.jobTestSetRecId = const Value.absent(),
    this.testSetName = const Value.absent(),
    this.jobName = const Value.absent(),
    this.registerDateTime = const Value.absent(),
    this.registerUser = const Value.absent(),
    this.status = const Value.absent(),
  });
  MachineSummaryItemsCompanion.insert({
    this.uid = const Value.absent(),
    required String machineId,
    required String recId,
    this.jobTestSetRecId = const Value.absent(),
    this.testSetName = const Value.absent(),
    this.jobName = const Value.absent(),
    this.registerDateTime = const Value.absent(),
    this.registerUser = const Value.absent(),
    this.status = const Value.absent(),
  }) : machineId = Value(machineId),
       recId = Value(recId);
  static Insertable<DbMachineSummaryItem> custom({
    Expression<int>? uid,
    Expression<String>? machineId,
    Expression<String>? recId,
    Expression<String>? jobTestSetRecId,
    Expression<String>? testSetName,
    Expression<String>? jobName,
    Expression<String>? registerDateTime,
    Expression<String>? registerUser,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (machineId != null) 'MachineID': machineId,
      if (recId != null) 'RecID': recId,
      if (jobTestSetRecId != null) 'JobTestSetRecID': jobTestSetRecId,
      if (testSetName != null) 'TestSetName': testSetName,
      if (jobName != null) 'JobName': jobName,
      if (registerDateTime != null) 'RegisterDateTime': registerDateTime,
      if (registerUser != null) 'RegisterUser': registerUser,
      if (status != null) 'Status': status,
    });
  }

  MachineSummaryItemsCompanion copyWith({
    Value<int>? uid,
    Value<String>? machineId,
    Value<String>? recId,
    Value<String?>? jobTestSetRecId,
    Value<String?>? testSetName,
    Value<String?>? jobName,
    Value<String?>? registerDateTime,
    Value<String?>? registerUser,
    Value<String?>? status,
  }) {
    return MachineSummaryItemsCompanion(
      uid: uid ?? this.uid,
      machineId: machineId ?? this.machineId,
      recId: recId ?? this.recId,
      jobTestSetRecId: jobTestSetRecId ?? this.jobTestSetRecId,
      testSetName: testSetName ?? this.testSetName,
      jobName: jobName ?? this.jobName,
      registerDateTime: registerDateTime ?? this.registerDateTime,
      registerUser: registerUser ?? this.registerUser,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (machineId.present) {
      map['MachineID'] = Variable<String>(machineId.value);
    }
    if (recId.present) {
      map['RecID'] = Variable<String>(recId.value);
    }
    if (jobTestSetRecId.present) {
      map['JobTestSetRecID'] = Variable<String>(jobTestSetRecId.value);
    }
    if (testSetName.present) {
      map['TestSetName'] = Variable<String>(testSetName.value);
    }
    if (jobName.present) {
      map['JobName'] = Variable<String>(jobName.value);
    }
    if (registerDateTime.present) {
      map['RegisterDateTime'] = Variable<String>(registerDateTime.value);
    }
    if (registerUser.present) {
      map['RegisterUser'] = Variable<String>(registerUser.value);
    }
    if (status.present) {
      map['Status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MachineSummaryItemsCompanion(')
          ..write('uid: $uid, ')
          ..write('machineId: $machineId, ')
          ..write('recId: $recId, ')
          ..write('jobTestSetRecId: $jobTestSetRecId, ')
          ..write('testSetName: $testSetName, ')
          ..write('jobName: $jobName, ')
          ..write('registerDateTime: $registerDateTime, ')
          ..write('registerUser: $registerUser, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $MachineSummaryEventsTable extends MachineSummaryEvents
    with TableInfo<$MachineSummaryEventsTable, DbMachineSummaryEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MachineSummaryEventsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _machineIdMeta = const VerificationMeta(
    'machineId',
  );
  @override
  late final GeneratedColumn<String> machineId = GeneratedColumn<String>(
    'MachineID',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recIdMeta = const VerificationMeta('recId');
  @override
  late final GeneratedColumn<String> recId = GeneratedColumn<String>(
    'RecID',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eventTypeMeta = const VerificationMeta(
    'eventType',
  );
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
    'EventType',
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
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'DurationSeconds',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordUserIdMeta = const VerificationMeta(
    'recordUserId',
  );
  @override
  late final GeneratedColumn<String> recordUserId = GeneratedColumn<String>(
    'RecordUserId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    machineId,
    recId,
    eventType,
    startTime,
    endTime,
    durationSeconds,
    recordUserId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'machine_summary_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbMachineSummaryEvent> instance, {
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
    if (data.containsKey('MachineID')) {
      context.handle(
        _machineIdMeta,
        machineId.isAcceptableOrUnknown(data['MachineID']!, _machineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_machineIdMeta);
    }
    if (data.containsKey('RecID')) {
      context.handle(
        _recIdMeta,
        recId.isAcceptableOrUnknown(data['RecID']!, _recIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recIdMeta);
    }
    if (data.containsKey('EventType')) {
      context.handle(
        _eventTypeMeta,
        eventType.isAcceptableOrUnknown(data['EventType']!, _eventTypeMeta),
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
    if (data.containsKey('DurationSeconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['DurationSeconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('RecordUserId')) {
      context.handle(
        _recordUserIdMeta,
        recordUserId.isAcceptableOrUnknown(
          data['RecordUserId']!,
          _recordUserIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbMachineSummaryEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbMachineSummaryEvent(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      machineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MachineID'],
      )!,
      recId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}RecID'],
      )!,
      eventType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}EventType'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}StartTime'],
      ),
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}EndTime'],
      ),
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}DurationSeconds'],
      ),
      recordUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}RecordUserId'],
      ),
    );
  }

  @override
  $MachineSummaryEventsTable createAlias(String alias) {
    return $MachineSummaryEventsTable(attachedDatabase, alias);
  }
}

class DbMachineSummaryEvent extends DataClass
    implements Insertable<DbMachineSummaryEvent> {
  final int uid;
  final String machineId;
  final String recId;
  final String? eventType;
  final String? startTime;
  final String? endTime;
  final int? durationSeconds;
  final String? recordUserId;
  const DbMachineSummaryEvent({
    required this.uid,
    required this.machineId,
    required this.recId,
    this.eventType,
    this.startTime,
    this.endTime,
    this.durationSeconds,
    this.recordUserId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    map['MachineID'] = Variable<String>(machineId);
    map['RecID'] = Variable<String>(recId);
    if (!nullToAbsent || eventType != null) {
      map['EventType'] = Variable<String>(eventType);
    }
    if (!nullToAbsent || startTime != null) {
      map['StartTime'] = Variable<String>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['EndTime'] = Variable<String>(endTime);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['DurationSeconds'] = Variable<int>(durationSeconds);
    }
    if (!nullToAbsent || recordUserId != null) {
      map['RecordUserId'] = Variable<String>(recordUserId);
    }
    return map;
  }

  MachineSummaryEventsCompanion toCompanion(bool nullToAbsent) {
    return MachineSummaryEventsCompanion(
      uid: Value(uid),
      machineId: Value(machineId),
      recId: Value(recId),
      eventType: eventType == null && nullToAbsent
          ? const Value.absent()
          : Value(eventType),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      recordUserId: recordUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(recordUserId),
    );
  }

  factory DbMachineSummaryEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbMachineSummaryEvent(
      uid: serializer.fromJson<int>(json['uid']),
      machineId: serializer.fromJson<String>(json['machineId']),
      recId: serializer.fromJson<String>(json['recId']),
      eventType: serializer.fromJson<String?>(json['eventType']),
      startTime: serializer.fromJson<String?>(json['startTime']),
      endTime: serializer.fromJson<String?>(json['endTime']),
      durationSeconds: serializer.fromJson<int?>(json['durationSeconds']),
      recordUserId: serializer.fromJson<String?>(json['recordUserId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'machineId': serializer.toJson<String>(machineId),
      'recId': serializer.toJson<String>(recId),
      'eventType': serializer.toJson<String?>(eventType),
      'startTime': serializer.toJson<String?>(startTime),
      'endTime': serializer.toJson<String?>(endTime),
      'durationSeconds': serializer.toJson<int?>(durationSeconds),
      'recordUserId': serializer.toJson<String?>(recordUserId),
    };
  }

  DbMachineSummaryEvent copyWith({
    int? uid,
    String? machineId,
    String? recId,
    Value<String?> eventType = const Value.absent(),
    Value<String?> startTime = const Value.absent(),
    Value<String?> endTime = const Value.absent(),
    Value<int?> durationSeconds = const Value.absent(),
    Value<String?> recordUserId = const Value.absent(),
  }) => DbMachineSummaryEvent(
    uid: uid ?? this.uid,
    machineId: machineId ?? this.machineId,
    recId: recId ?? this.recId,
    eventType: eventType.present ? eventType.value : this.eventType,
    startTime: startTime.present ? startTime.value : this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    durationSeconds: durationSeconds.present
        ? durationSeconds.value
        : this.durationSeconds,
    recordUserId: recordUserId.present ? recordUserId.value : this.recordUserId,
  );
  DbMachineSummaryEvent copyWithCompanion(MachineSummaryEventsCompanion data) {
    return DbMachineSummaryEvent(
      uid: data.uid.present ? data.uid.value : this.uid,
      machineId: data.machineId.present ? data.machineId.value : this.machineId,
      recId: data.recId.present ? data.recId.value : this.recId,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      recordUserId: data.recordUserId.present
          ? data.recordUserId.value
          : this.recordUserId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbMachineSummaryEvent(')
          ..write('uid: $uid, ')
          ..write('machineId: $machineId, ')
          ..write('recId: $recId, ')
          ..write('eventType: $eventType, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('recordUserId: $recordUserId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    machineId,
    recId,
    eventType,
    startTime,
    endTime,
    durationSeconds,
    recordUserId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbMachineSummaryEvent &&
          other.uid == this.uid &&
          other.machineId == this.machineId &&
          other.recId == this.recId &&
          other.eventType == this.eventType &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.durationSeconds == this.durationSeconds &&
          other.recordUserId == this.recordUserId);
}

class MachineSummaryEventsCompanion
    extends UpdateCompanion<DbMachineSummaryEvent> {
  final Value<int> uid;
  final Value<String> machineId;
  final Value<String> recId;
  final Value<String?> eventType;
  final Value<String?> startTime;
  final Value<String?> endTime;
  final Value<int?> durationSeconds;
  final Value<String?> recordUserId;
  const MachineSummaryEventsCompanion({
    this.uid = const Value.absent(),
    this.machineId = const Value.absent(),
    this.recId = const Value.absent(),
    this.eventType = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.recordUserId = const Value.absent(),
  });
  MachineSummaryEventsCompanion.insert({
    this.uid = const Value.absent(),
    required String machineId,
    required String recId,
    this.eventType = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.recordUserId = const Value.absent(),
  }) : machineId = Value(machineId),
       recId = Value(recId);
  static Insertable<DbMachineSummaryEvent> custom({
    Expression<int>? uid,
    Expression<String>? machineId,
    Expression<String>? recId,
    Expression<String>? eventType,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<int>? durationSeconds,
    Expression<String>? recordUserId,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (machineId != null) 'MachineID': machineId,
      if (recId != null) 'RecID': recId,
      if (eventType != null) 'EventType': eventType,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (durationSeconds != null) 'DurationSeconds': durationSeconds,
      if (recordUserId != null) 'RecordUserId': recordUserId,
    });
  }

  MachineSummaryEventsCompanion copyWith({
    Value<int>? uid,
    Value<String>? machineId,
    Value<String>? recId,
    Value<String?>? eventType,
    Value<String?>? startTime,
    Value<String?>? endTime,
    Value<int?>? durationSeconds,
    Value<String?>? recordUserId,
  }) {
    return MachineSummaryEventsCompanion(
      uid: uid ?? this.uid,
      machineId: machineId ?? this.machineId,
      recId: recId ?? this.recId,
      eventType: eventType ?? this.eventType,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      recordUserId: recordUserId ?? this.recordUserId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (machineId.present) {
      map['MachineID'] = Variable<String>(machineId.value);
    }
    if (recId.present) {
      map['RecID'] = Variable<String>(recId.value);
    }
    if (eventType.present) {
      map['EventType'] = Variable<String>(eventType.value);
    }
    if (startTime.present) {
      map['StartTime'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['EndTime'] = Variable<String>(endTime.value);
    }
    if (durationSeconds.present) {
      map['DurationSeconds'] = Variable<int>(durationSeconds.value);
    }
    if (recordUserId.present) {
      map['RecordUserId'] = Variable<String>(recordUserId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MachineSummaryEventsCompanion(')
          ..write('uid: $uid, ')
          ..write('machineId: $machineId, ')
          ..write('recId: $recId, ')
          ..write('eventType: $eventType, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('recordUserId: $recordUserId')
          ..write(')'))
        .toString();
  }
}

class $HumanActivityTypesTable extends HumanActivityTypes
    with TableInfo<$HumanActivityTypesTable, DbHumanActivityType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HumanActivityTypesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'UserId',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activityCodeMeta = const VerificationMeta(
    'activityCode',
  );
  @override
  late final GeneratedColumn<String> activityCode = GeneratedColumn<String>(
    'ActivityCode',
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
    'JobTestSetRecID',
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
  static const VerificationMeta _recordVersionMeta = const VerificationMeta(
    'recordVersion',
  );
  @override
  late final GeneratedColumn<int> recordVersion = GeneratedColumn<int>(
    'RecordVersion',
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
    userId,
    activityCode,
    jobTestSetRecId,
    activityName,
    status,
    updatedAt,
    lastSync,
    syncStatus,
    recordVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'human_activity_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<DbHumanActivityType> instance, {
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
    if (data.containsKey('ActivityCode')) {
      context.handle(
        _activityCodeMeta,
        activityCode.isAcceptableOrUnknown(
          data['ActivityCode']!,
          _activityCodeMeta,
        ),
      );
    }
    if (data.containsKey('JobTestSetRecID')) {
      context.handle(
        _jobTestSetRecIdMeta,
        jobTestSetRecId.isAcceptableOrUnknown(
          data['JobTestSetRecID']!,
          _jobTestSetRecIdMeta,
        ),
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
    if (data.containsKey('RecordVersion')) {
      context.handle(
        _recordVersionMeta,
        recordVersion.isAcceptableOrUnknown(
          data['RecordVersion']!,
          _recordVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DbHumanActivityType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbHumanActivityType(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uid'],
      )!,
      recId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recID'],
      ),
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}documentId'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}UserId'],
      ),
      activityCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ActivityCode'],
      ),
      jobTestSetRecId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}JobTestSetRecID'],
      ),
      activityName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ActivityName'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}Status'],
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
      recordVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}RecordVersion'],
      )!,
    );
  }

  @override
  $HumanActivityTypesTable createAlias(String alias) {
    return $HumanActivityTypesTable(attachedDatabase, alias);
  }
}

class DbHumanActivityType extends DataClass
    implements Insertable<DbHumanActivityType> {
  final int uid;
  final String? recId;
  final String? documentId;
  final String? userId;
  final String? activityCode;
  final String? jobTestSetRecId;
  final String? activityName;
  final int status;
  final String? updatedAt;
  final String? lastSync;
  final int syncStatus;
  final int recordVersion;
  const DbHumanActivityType({
    required this.uid,
    this.recId,
    this.documentId,
    this.userId,
    this.activityCode,
    this.jobTestSetRecId,
    this.activityName,
    required this.status,
    this.updatedAt,
    this.lastSync,
    required this.syncStatus,
    required this.recordVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    if (!nullToAbsent || recId != null) {
      map['recID'] = Variable<String>(recId);
    }
    if (!nullToAbsent || documentId != null) {
      map['documentId'] = Variable<String>(documentId);
    }
    if (!nullToAbsent || userId != null) {
      map['UserId'] = Variable<String>(userId);
    }
    if (!nullToAbsent || activityCode != null) {
      map['ActivityCode'] = Variable<String>(activityCode);
    }
    if (!nullToAbsent || jobTestSetRecId != null) {
      map['JobTestSetRecID'] = Variable<String>(jobTestSetRecId);
    }
    if (!nullToAbsent || activityName != null) {
      map['ActivityName'] = Variable<String>(activityName);
    }
    map['Status'] = Variable<int>(status);
    if (!nullToAbsent || updatedAt != null) {
      map['updatedAt'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || lastSync != null) {
      map['lastSync'] = Variable<String>(lastSync);
    }
    map['syncStatus'] = Variable<int>(syncStatus);
    map['RecordVersion'] = Variable<int>(recordVersion);
    return map;
  }

  HumanActivityTypesCompanion toCompanion(bool nullToAbsent) {
    return HumanActivityTypesCompanion(
      uid: Value(uid),
      recId: recId == null && nullToAbsent
          ? const Value.absent()
          : Value(recId),
      documentId: documentId == null && nullToAbsent
          ? const Value.absent()
          : Value(documentId),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      activityCode: activityCode == null && nullToAbsent
          ? const Value.absent()
          : Value(activityCode),
      jobTestSetRecId: jobTestSetRecId == null && nullToAbsent
          ? const Value.absent()
          : Value(jobTestSetRecId),
      activityName: activityName == null && nullToAbsent
          ? const Value.absent()
          : Value(activityName),
      status: Value(status),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      lastSync: lastSync == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSync),
      syncStatus: Value(syncStatus),
      recordVersion: Value(recordVersion),
    );
  }

  factory DbHumanActivityType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbHumanActivityType(
      uid: serializer.fromJson<int>(json['uid']),
      recId: serializer.fromJson<String?>(json['recId']),
      documentId: serializer.fromJson<String?>(json['documentId']),
      userId: serializer.fromJson<String?>(json['userId']),
      activityCode: serializer.fromJson<String?>(json['activityCode']),
      jobTestSetRecId: serializer.fromJson<String?>(json['jobTestSetRecId']),
      activityName: serializer.fromJson<String?>(json['activityName']),
      status: serializer.fromJson<int>(json['status']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      lastSync: serializer.fromJson<String?>(json['lastSync']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
      recordVersion: serializer.fromJson<int>(json['recordVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'recId': serializer.toJson<String?>(recId),
      'documentId': serializer.toJson<String?>(documentId),
      'userId': serializer.toJson<String?>(userId),
      'activityCode': serializer.toJson<String?>(activityCode),
      'jobTestSetRecId': serializer.toJson<String?>(jobTestSetRecId),
      'activityName': serializer.toJson<String?>(activityName),
      'status': serializer.toJson<int>(status),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'lastSync': serializer.toJson<String?>(lastSync),
      'syncStatus': serializer.toJson<int>(syncStatus),
      'recordVersion': serializer.toJson<int>(recordVersion),
    };
  }

  DbHumanActivityType copyWith({
    int? uid,
    Value<String?> recId = const Value.absent(),
    Value<String?> documentId = const Value.absent(),
    Value<String?> userId = const Value.absent(),
    Value<String?> activityCode = const Value.absent(),
    Value<String?> jobTestSetRecId = const Value.absent(),
    Value<String?> activityName = const Value.absent(),
    int? status,
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> lastSync = const Value.absent(),
    int? syncStatus,
    int? recordVersion,
  }) => DbHumanActivityType(
    uid: uid ?? this.uid,
    recId: recId.present ? recId.value : this.recId,
    documentId: documentId.present ? documentId.value : this.documentId,
    userId: userId.present ? userId.value : this.userId,
    activityCode: activityCode.present ? activityCode.value : this.activityCode,
    jobTestSetRecId: jobTestSetRecId.present
        ? jobTestSetRecId.value
        : this.jobTestSetRecId,
    activityName: activityName.present ? activityName.value : this.activityName,
    status: status ?? this.status,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    lastSync: lastSync.present ? lastSync.value : this.lastSync,
    syncStatus: syncStatus ?? this.syncStatus,
    recordVersion: recordVersion ?? this.recordVersion,
  );
  DbHumanActivityType copyWithCompanion(HumanActivityTypesCompanion data) {
    return DbHumanActivityType(
      uid: data.uid.present ? data.uid.value : this.uid,
      recId: data.recId.present ? data.recId.value : this.recId,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      userId: data.userId.present ? data.userId.value : this.userId,
      activityCode: data.activityCode.present
          ? data.activityCode.value
          : this.activityCode,
      jobTestSetRecId: data.jobTestSetRecId.present
          ? data.jobTestSetRecId.value
          : this.jobTestSetRecId,
      activityName: data.activityName.present
          ? data.activityName.value
          : this.activityName,
      status: data.status.present ? data.status.value : this.status,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastSync: data.lastSync.present ? data.lastSync.value : this.lastSync,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      recordVersion: data.recordVersion.present
          ? data.recordVersion.value
          : this.recordVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbHumanActivityType(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('documentId: $documentId, ')
          ..write('userId: $userId, ')
          ..write('activityCode: $activityCode, ')
          ..write('jobTestSetRecId: $jobTestSetRecId, ')
          ..write('activityName: $activityName, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('recordVersion: $recordVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    recId,
    documentId,
    userId,
    activityCode,
    jobTestSetRecId,
    activityName,
    status,
    updatedAt,
    lastSync,
    syncStatus,
    recordVersion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbHumanActivityType &&
          other.uid == this.uid &&
          other.recId == this.recId &&
          other.documentId == this.documentId &&
          other.userId == this.userId &&
          other.activityCode == this.activityCode &&
          other.jobTestSetRecId == this.jobTestSetRecId &&
          other.activityName == this.activityName &&
          other.status == this.status &&
          other.updatedAt == this.updatedAt &&
          other.lastSync == this.lastSync &&
          other.syncStatus == this.syncStatus &&
          other.recordVersion == this.recordVersion);
}

class HumanActivityTypesCompanion extends UpdateCompanion<DbHumanActivityType> {
  final Value<int> uid;
  final Value<String?> recId;
  final Value<String?> documentId;
  final Value<String?> userId;
  final Value<String?> activityCode;
  final Value<String?> jobTestSetRecId;
  final Value<String?> activityName;
  final Value<int> status;
  final Value<String?> updatedAt;
  final Value<String?> lastSync;
  final Value<int> syncStatus;
  final Value<int> recordVersion;
  const HumanActivityTypesCompanion({
    this.uid = const Value.absent(),
    this.recId = const Value.absent(),
    this.documentId = const Value.absent(),
    this.userId = const Value.absent(),
    this.activityCode = const Value.absent(),
    this.jobTestSetRecId = const Value.absent(),
    this.activityName = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.recordVersion = const Value.absent(),
  });
  HumanActivityTypesCompanion.insert({
    this.uid = const Value.absent(),
    this.recId = const Value.absent(),
    this.documentId = const Value.absent(),
    this.userId = const Value.absent(),
    this.activityCode = const Value.absent(),
    this.jobTestSetRecId = const Value.absent(),
    this.activityName = const Value.absent(),
    this.status = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSync = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.recordVersion = const Value.absent(),
  });
  static Insertable<DbHumanActivityType> custom({
    Expression<int>? uid,
    Expression<String>? recId,
    Expression<String>? documentId,
    Expression<String>? userId,
    Expression<String>? activityCode,
    Expression<String>? jobTestSetRecId,
    Expression<String>? activityName,
    Expression<int>? status,
    Expression<String>? updatedAt,
    Expression<String>? lastSync,
    Expression<int>? syncStatus,
    Expression<int>? recordVersion,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (recId != null) 'recID': recId,
      if (documentId != null) 'documentId': documentId,
      if (userId != null) 'UserId': userId,
      if (activityCode != null) 'ActivityCode': activityCode,
      if (jobTestSetRecId != null) 'JobTestSetRecID': jobTestSetRecId,
      if (activityName != null) 'ActivityName': activityName,
      if (status != null) 'Status': status,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (lastSync != null) 'lastSync': lastSync,
      if (syncStatus != null) 'syncStatus': syncStatus,
      if (recordVersion != null) 'RecordVersion': recordVersion,
    });
  }

  HumanActivityTypesCompanion copyWith({
    Value<int>? uid,
    Value<String?>? recId,
    Value<String?>? documentId,
    Value<String?>? userId,
    Value<String?>? activityCode,
    Value<String?>? jobTestSetRecId,
    Value<String?>? activityName,
    Value<int>? status,
    Value<String?>? updatedAt,
    Value<String?>? lastSync,
    Value<int>? syncStatus,
    Value<int>? recordVersion,
  }) {
    return HumanActivityTypesCompanion(
      uid: uid ?? this.uid,
      recId: recId ?? this.recId,
      documentId: documentId ?? this.documentId,
      userId: userId ?? this.userId,
      activityCode: activityCode ?? this.activityCode,
      jobTestSetRecId: jobTestSetRecId ?? this.jobTestSetRecId,
      activityName: activityName ?? this.activityName,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSync: lastSync ?? this.lastSync,
      syncStatus: syncStatus ?? this.syncStatus,
      recordVersion: recordVersion ?? this.recordVersion,
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
    if (userId.present) {
      map['UserId'] = Variable<String>(userId.value);
    }
    if (activityCode.present) {
      map['ActivityCode'] = Variable<String>(activityCode.value);
    }
    if (jobTestSetRecId.present) {
      map['JobTestSetRecID'] = Variable<String>(jobTestSetRecId.value);
    }
    if (activityName.present) {
      map['ActivityName'] = Variable<String>(activityName.value);
    }
    if (status.present) {
      map['Status'] = Variable<int>(status.value);
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
    if (recordVersion.present) {
      map['RecordVersion'] = Variable<int>(recordVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HumanActivityTypesCompanion(')
          ..write('uid: $uid, ')
          ..write('recId: $recId, ')
          ..write('documentId: $documentId, ')
          ..write('userId: $userId, ')
          ..write('activityCode: $activityCode, ')
          ..write('jobTestSetRecId: $jobTestSetRecId, ')
          ..write('activityName: $activityName, ')
          ..write('status: $status, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSync: $lastSync, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('recordVersion: $recordVersion')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $JobsTable jobs = $JobsTable(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  late final $UsersTable users = $UsersTable(this);
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
  late final $MachinesTable machines = $MachinesTable(this);
  late final $SyncLogsTable syncLogs = $SyncLogsTable(this);
  late final $MachineSummariesTable machineSummaries = $MachineSummariesTable(
    this,
  );
  late final $MachineSummaryItemsTable machineSummaryItems =
      $MachineSummaryItemsTable(this);
  late final $MachineSummaryEventsTable machineSummaryEvents =
      $MachineSummaryEventsTable(this);
  late final $HumanActivityTypesTable humanActivityTypes =
      $HumanActivityTypesTable(this);
  late final JobDao jobDao = JobDao(this as AppDatabase);
  late final DocumentDao documentDao = DocumentDao(this as AppDatabase);
  late final UserDao userDao = UserDao(this as AppDatabase);
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
  late final MachineDao machineDao = MachineDao(this as AppDatabase);
  late final SyncLogDao syncLogDao = SyncLogDao(this as AppDatabase);
  late final MachineSummaryDao machineSummaryDao = MachineSummaryDao(
    this as AppDatabase,
  );
  late final HumanActivityTypeDao humanActivityTypeDao = HumanActivityTypeDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    jobs,
    documents,
    users,
    jobTestSets,
    runningJobMachines,
    jobWorkingTimes,
    jobMachineEventLogs,
    jobMachineItems,
    pauseReasons,
    checkInActivities,
    checkInLogs,
    activityLogs,
    machines,
    syncLogs,
    machineSummaries,
    machineSummaryItems,
    machineSummaryEvents,
    humanActivityTypes,
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
      Value<bool> isManual,
      Value<bool> isSynced,
      Value<int> recordVersion,
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
      Value<bool> isManual,
      Value<bool> isSynced,
      Value<int> recordVersion,
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

  ColumnFilters<bool> get isManual => $composableBuilder(
    column: $table.isManual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  ColumnOrderings<bool> get isManual => $composableBuilder(
    column: $table.isManual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  GeneratedColumn<bool> get isManual =>
      $composableBuilder(column: $table.isManual, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
    builder: (column) => column,
  );
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
                Value<bool> isManual = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> recordVersion = const Value.absent(),
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
                isManual: isManual,
                isSynced: isSynced,
                recordVersion: recordVersion,
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
                Value<bool> isManual = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> recordVersion = const Value.absent(),
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
                isManual: isManual,
                isSynced: isSynced,
                recordVersion: recordVersion,
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
      Value<int> recordVersion,
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
      Value<int> recordVersion,
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

  ColumnFilters<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  ColumnOrderings<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  GeneratedColumn<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
    builder: (column) => column,
  );
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
                Value<int> recordVersion = const Value.absent(),
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
                recordVersion: recordVersion,
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
                Value<int> recordVersion = const Value.absent(),
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
                recordVersion: recordVersion,
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
      Value<int> recordVersion,
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
      Value<int> recordVersion,
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

  ColumnFilters<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  ColumnOrderings<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  GeneratedColumn<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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
                Value<int> recordVersion = const Value.absent(),
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
                recordVersion: recordVersion,
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
                Value<int> recordVersion = const Value.absent(),
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
                recordVersion: recordVersion,
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
      Value<int> recordVersion,
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
      Value<int> recordVersion,
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

  ColumnFilters<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  ColumnOrderings<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  GeneratedColumn<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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
                Value<int> recordVersion = const Value.absent(),
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
                recordVersion: recordVersion,
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
                Value<int> recordVersion = const Value.absent(),
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
                recordVersion: recordVersion,
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
      Value<String?> recId,
      Value<String?> documentId,
      Value<String?> userId,
      Value<String?> jobTestSetRecId,
      Value<String?> activityId,
      Value<String?> activityName,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
      Value<int> recordVersion,
    });
typedef $$JobWorkingTimesTableUpdateCompanionBuilder =
    JobWorkingTimesCompanion Function({
      Value<int> uid,
      Value<String?> recId,
      Value<String?> documentId,
      Value<String?> userId,
      Value<String?> jobTestSetRecId,
      Value<String?> activityId,
      Value<String?> activityName,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
      Value<int> recordVersion,
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

  ColumnFilters<String> get recId => $composableBuilder(
    column: $table.recId,
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

  ColumnFilters<String> get jobTestSetRecId => $composableBuilder(
    column: $table.jobTestSetRecId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityName => $composableBuilder(
    column: $table.activityName,
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

  ColumnFilters<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  ColumnOrderings<String> get recId => $composableBuilder(
    column: $table.recId,
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

  ColumnOrderings<String> get jobTestSetRecId => $composableBuilder(
    column: $table.jobTestSetRecId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityName => $composableBuilder(
    column: $table.activityName,
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

  ColumnOrderings<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  GeneratedColumn<String> get recId =>
      $composableBuilder(column: $table.recId, builder: (column) => column);

  GeneratedColumn<String> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get jobTestSetRecId => $composableBuilder(
    column: $table.jobTestSetRecId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get activityName => $composableBuilder(
    column: $table.activityName,
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

  GeneratedColumn<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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
                Value<String?> recId = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> jobTestSetRecId = const Value.absent(),
                Value<String?> activityId = const Value.absent(),
                Value<String?> activityName = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<int> recordVersion = const Value.absent(),
              }) => JobWorkingTimesCompanion(
                uid: uid,
                recId: recId,
                documentId: documentId,
                userId: userId,
                jobTestSetRecId: jobTestSetRecId,
                activityId: activityId,
                activityName: activityName,
                startTime: startTime,
                endTime: endTime,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
                recordVersion: recordVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> recId = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> jobTestSetRecId = const Value.absent(),
                Value<String?> activityId = const Value.absent(),
                Value<String?> activityName = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<int> recordVersion = const Value.absent(),
              }) => JobWorkingTimesCompanion.insert(
                uid: uid,
                recId: recId,
                documentId: documentId,
                userId: userId,
                jobTestSetRecId: jobTestSetRecId,
                activityId: activityId,
                activityName: activityName,
                startTime: startTime,
                endTime: endTime,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
                recordVersion: recordVersion,
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
      required String recId,
      Value<String?> jobMachineRecId,
      Value<String?> recordUserId,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<String?> eventType,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
      Value<int> recordVersion,
    });
typedef $$JobMachineEventLogsTableUpdateCompanionBuilder =
    JobMachineEventLogsCompanion Function({
      Value<int> uid,
      Value<String> recId,
      Value<String?> jobMachineRecId,
      Value<String?> recordUserId,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<String?> eventType,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
      Value<int> recordVersion,
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

  ColumnFilters<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobMachineRecId => $composableBuilder(
    column: $table.jobMachineRecId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordUserId => $composableBuilder(
    column: $table.recordUserId,
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

  ColumnFilters<String> get eventType => $composableBuilder(
    column: $table.eventType,
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

  ColumnFilters<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  ColumnOrderings<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobMachineRecId => $composableBuilder(
    column: $table.jobMachineRecId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordUserId => $composableBuilder(
    column: $table.recordUserId,
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

  ColumnOrderings<String> get eventType => $composableBuilder(
    column: $table.eventType,
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

  ColumnOrderings<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  GeneratedColumn<String> get recId =>
      $composableBuilder(column: $table.recId, builder: (column) => column);

  GeneratedColumn<String> get jobMachineRecId => $composableBuilder(
    column: $table.jobMachineRecId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordUserId => $composableBuilder(
    column: $table.recordUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

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

  GeneratedColumn<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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
                Value<String> recId = const Value.absent(),
                Value<String?> jobMachineRecId = const Value.absent(),
                Value<String?> recordUserId = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<String?> eventType = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<int> recordVersion = const Value.absent(),
              }) => JobMachineEventLogsCompanion(
                uid: uid,
                recId: recId,
                jobMachineRecId: jobMachineRecId,
                recordUserId: recordUserId,
                startTime: startTime,
                endTime: endTime,
                eventType: eventType,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
                recordVersion: recordVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                required String recId,
                Value<String?> jobMachineRecId = const Value.absent(),
                Value<String?> recordUserId = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<String?> eventType = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<int> recordVersion = const Value.absent(),
              }) => JobMachineEventLogsCompanion.insert(
                uid: uid,
                recId: recId,
                jobMachineRecId: jobMachineRecId,
                recordUserId: recordUserId,
                startTime: startTime,
                endTime: endTime,
                eventType: eventType,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
                recordVersion: recordVersion,
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
      Value<int> recordVersion,
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
      Value<int> recordVersion,
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

  ColumnFilters<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  ColumnOrderings<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  GeneratedColumn<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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
                Value<int> recordVersion = const Value.absent(),
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
                recordVersion: recordVersion,
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
                Value<int> recordVersion = const Value.absent(),
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
                recordVersion: recordVersion,
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
      Value<String?> recId,
      Value<String?> locationCode,
      Value<String?> userId,
      Value<String?> activityName,
      Value<String?> remark,
      Value<String?> checkInTime,
      Value<String?> checkOutTime,
      Value<int> status,
      Value<int> syncStatus,
      Value<String?> lastSync,
      Value<int> recordVersion,
    });
typedef $$CheckInLogsTableUpdateCompanionBuilder =
    CheckInLogsCompanion Function({
      Value<int> uid,
      Value<String?> recId,
      Value<String?> locationCode,
      Value<String?> userId,
      Value<String?> activityName,
      Value<String?> remark,
      Value<String?> checkInTime,
      Value<String?> checkOutTime,
      Value<int> status,
      Value<int> syncStatus,
      Value<String?> lastSync,
      Value<int> recordVersion,
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

  ColumnFilters<String> get recId => $composableBuilder(
    column: $table.recId,
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

  ColumnFilters<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  ColumnOrderings<String> get recId => $composableBuilder(
    column: $table.recId,
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

  ColumnOrderings<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  GeneratedColumn<String> get recId =>
      $composableBuilder(column: $table.recId, builder: (column) => column);

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

  GeneratedColumn<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
    builder: (column) => column,
  );
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
                Value<String?> recId = const Value.absent(),
                Value<String?> locationCode = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> activityName = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String?> checkInTime = const Value.absent(),
                Value<String?> checkOutTime = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> recordVersion = const Value.absent(),
              }) => CheckInLogsCompanion(
                uid: uid,
                recId: recId,
                locationCode: locationCode,
                userId: userId,
                activityName: activityName,
                remark: remark,
                checkInTime: checkInTime,
                checkOutTime: checkOutTime,
                status: status,
                syncStatus: syncStatus,
                lastSync: lastSync,
                recordVersion: recordVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> recId = const Value.absent(),
                Value<String?> locationCode = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> activityName = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String?> checkInTime = const Value.absent(),
                Value<String?> checkOutTime = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> recordVersion = const Value.absent(),
              }) => CheckInLogsCompanion.insert(
                uid: uid,
                recId: recId,
                locationCode: locationCode,
                userId: userId,
                activityName: activityName,
                remark: remark,
                checkInTime: checkInTime,
                checkOutTime: checkOutTime,
                status: status,
                syncStatus: syncStatus,
                lastSync: lastSync,
                recordVersion: recordVersion,
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
      Value<int> recordVersion,
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
      Value<int> recordVersion,
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

  ColumnFilters<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  ColumnOrderings<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
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

  GeneratedColumn<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
    builder: (column) => column,
  );
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
                Value<int> recordVersion = const Value.absent(),
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
                recordVersion: recordVersion,
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
                Value<int> recordVersion = const Value.absent(),
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
                recordVersion: recordVersion,
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
typedef $$MachinesTableCreateCompanionBuilder =
    MachinesCompanion Function({
      Value<int> uid,
      Value<String?> machineId,
      Value<String?> barcodeGuid,
      Value<String?> machineNo,
      Value<String?> machineName,
      Value<String?> status,
      Value<String?> updatedAt,
    });
typedef $$MachinesTableUpdateCompanionBuilder =
    MachinesCompanion Function({
      Value<int> uid,
      Value<String?> machineId,
      Value<String?> barcodeGuid,
      Value<String?> machineNo,
      Value<String?> machineName,
      Value<String?> status,
      Value<String?> updatedAt,
    });

class $$MachinesTableFilterComposer
    extends Composer<_$AppDatabase, $MachinesTable> {
  $$MachinesTableFilterComposer({
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

  ColumnFilters<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcodeGuid => $composableBuilder(
    column: $table.barcodeGuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineNo => $composableBuilder(
    column: $table.machineNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MachinesTableOrderingComposer
    extends Composer<_$AppDatabase, $MachinesTable> {
  $$MachinesTableOrderingComposer({
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

  ColumnOrderings<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcodeGuid => $composableBuilder(
    column: $table.barcodeGuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineNo => $composableBuilder(
    column: $table.machineNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MachinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MachinesTable> {
  $$MachinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get machineId =>
      $composableBuilder(column: $table.machineId, builder: (column) => column);

  GeneratedColumn<String> get barcodeGuid => $composableBuilder(
    column: $table.barcodeGuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get machineNo =>
      $composableBuilder(column: $table.machineNo, builder: (column) => column);

  GeneratedColumn<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MachinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MachinesTable,
          DbMachine,
          $$MachinesTableFilterComposer,
          $$MachinesTableOrderingComposer,
          $$MachinesTableAnnotationComposer,
          $$MachinesTableCreateCompanionBuilder,
          $$MachinesTableUpdateCompanionBuilder,
          (DbMachine, BaseReferences<_$AppDatabase, $MachinesTable, DbMachine>),
          DbMachine,
          PrefetchHooks Function()
        > {
  $$MachinesTableTableManager(_$AppDatabase db, $MachinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MachinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MachinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MachinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> barcodeGuid = const Value.absent(),
                Value<String?> machineNo = const Value.absent(),
                Value<String?> machineName = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => MachinesCompanion(
                uid: uid,
                machineId: machineId,
                barcodeGuid: barcodeGuid,
                machineNo: machineNo,
                machineName: machineName,
                status: status,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> machineId = const Value.absent(),
                Value<String?> barcodeGuid = const Value.absent(),
                Value<String?> machineNo = const Value.absent(),
                Value<String?> machineName = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => MachinesCompanion.insert(
                uid: uid,
                machineId: machineId,
                barcodeGuid: barcodeGuid,
                machineNo: machineNo,
                machineName: machineName,
                status: status,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MachinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MachinesTable,
      DbMachine,
      $$MachinesTableFilterComposer,
      $$MachinesTableOrderingComposer,
      $$MachinesTableAnnotationComposer,
      $$MachinesTableCreateCompanionBuilder,
      $$MachinesTableUpdateCompanionBuilder,
      (DbMachine, BaseReferences<_$AppDatabase, $MachinesTable, DbMachine>),
      DbMachine,
      PrefetchHooks Function()
    >;
typedef $$SyncLogsTableCreateCompanionBuilder =
    SyncLogsCompanion Function({
      Value<int> uid,
      required String syncType,
      required int status,
      Value<String?> message,
      required String timestamp,
    });
typedef $$SyncLogsTableUpdateCompanionBuilder =
    SyncLogsCompanion Function({
      Value<int> uid,
      Value<String> syncType,
      Value<int> status,
      Value<String?> message,
      Value<String> timestamp,
    });

class $$SyncLogsTableFilterComposer
    extends Composer<_$AppDatabase, $SyncLogsTable> {
  $$SyncLogsTableFilterComposer({
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

  ColumnFilters<String> get syncType => $composableBuilder(
    column: $table.syncType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncLogsTable> {
  $$SyncLogsTableOrderingComposer({
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

  ColumnOrderings<String> get syncType => $composableBuilder(
    column: $table.syncType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncLogsTable> {
  $$SyncLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get syncType =>
      $composableBuilder(column: $table.syncType, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$SyncLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncLogsTable,
          DbSyncLog,
          $$SyncLogsTableFilterComposer,
          $$SyncLogsTableOrderingComposer,
          $$SyncLogsTableAnnotationComposer,
          $$SyncLogsTableCreateCompanionBuilder,
          $$SyncLogsTableUpdateCompanionBuilder,
          (DbSyncLog, BaseReferences<_$AppDatabase, $SyncLogsTable, DbSyncLog>),
          DbSyncLog,
          PrefetchHooks Function()
        > {
  $$SyncLogsTableTableManager(_$AppDatabase db, $SyncLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String> syncType = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> message = const Value.absent(),
                Value<String> timestamp = const Value.absent(),
              }) => SyncLogsCompanion(
                uid: uid,
                syncType: syncType,
                status: status,
                message: message,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                required String syncType,
                required int status,
                Value<String?> message = const Value.absent(),
                required String timestamp,
              }) => SyncLogsCompanion.insert(
                uid: uid,
                syncType: syncType,
                status: status,
                message: message,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncLogsTable,
      DbSyncLog,
      $$SyncLogsTableFilterComposer,
      $$SyncLogsTableOrderingComposer,
      $$SyncLogsTableAnnotationComposer,
      $$SyncLogsTableCreateCompanionBuilder,
      $$SyncLogsTableUpdateCompanionBuilder,
      (DbSyncLog, BaseReferences<_$AppDatabase, $SyncLogsTable, DbSyncLog>),
      DbSyncLog,
      PrefetchHooks Function()
    >;
typedef $$MachineSummariesTableCreateCompanionBuilder =
    MachineSummariesCompanion Function({
      Value<int> uid,
      required String machineId,
      Value<String?> machineName,
      Value<String?> status,
      Value<String?> currentJobId,
      Value<String?> currentJobName,
      Value<double> oeePercent,
      Value<double> availability,
      Value<double> performance,
      Value<double> quality,
      Value<String?> updatedAt,
    });
typedef $$MachineSummariesTableUpdateCompanionBuilder =
    MachineSummariesCompanion Function({
      Value<int> uid,
      Value<String> machineId,
      Value<String?> machineName,
      Value<String?> status,
      Value<String?> currentJobId,
      Value<String?> currentJobName,
      Value<double> oeePercent,
      Value<double> availability,
      Value<double> performance,
      Value<double> quality,
      Value<String?> updatedAt,
    });

class $$MachineSummariesTableFilterComposer
    extends Composer<_$AppDatabase, $MachineSummariesTable> {
  $$MachineSummariesTableFilterComposer({
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

  ColumnFilters<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentJobId => $composableBuilder(
    column: $table.currentJobId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentJobName => $composableBuilder(
    column: $table.currentJobName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get oeePercent => $composableBuilder(
    column: $table.oeePercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get availability => $composableBuilder(
    column: $table.availability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get performance => $composableBuilder(
    column: $table.performance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quality => $composableBuilder(
    column: $table.quality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MachineSummariesTableOrderingComposer
    extends Composer<_$AppDatabase, $MachineSummariesTable> {
  $$MachineSummariesTableOrderingComposer({
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

  ColumnOrderings<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentJobId => $composableBuilder(
    column: $table.currentJobId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentJobName => $composableBuilder(
    column: $table.currentJobName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get oeePercent => $composableBuilder(
    column: $table.oeePercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get availability => $composableBuilder(
    column: $table.availability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get performance => $composableBuilder(
    column: $table.performance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quality => $composableBuilder(
    column: $table.quality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MachineSummariesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MachineSummariesTable> {
  $$MachineSummariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get machineId =>
      $composableBuilder(column: $table.machineId, builder: (column) => column);

  GeneratedColumn<String> get machineName => $composableBuilder(
    column: $table.machineName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get currentJobId => $composableBuilder(
    column: $table.currentJobId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currentJobName => $composableBuilder(
    column: $table.currentJobName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get oeePercent => $composableBuilder(
    column: $table.oeePercent,
    builder: (column) => column,
  );

  GeneratedColumn<double> get availability => $composableBuilder(
    column: $table.availability,
    builder: (column) => column,
  );

  GeneratedColumn<double> get performance => $composableBuilder(
    column: $table.performance,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quality =>
      $composableBuilder(column: $table.quality, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$MachineSummariesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MachineSummariesTable,
          DbMachineSummary,
          $$MachineSummariesTableFilterComposer,
          $$MachineSummariesTableOrderingComposer,
          $$MachineSummariesTableAnnotationComposer,
          $$MachineSummariesTableCreateCompanionBuilder,
          $$MachineSummariesTableUpdateCompanionBuilder,
          (
            DbMachineSummary,
            BaseReferences<
              _$AppDatabase,
              $MachineSummariesTable,
              DbMachineSummary
            >,
          ),
          DbMachineSummary,
          PrefetchHooks Function()
        > {
  $$MachineSummariesTableTableManager(
    _$AppDatabase db,
    $MachineSummariesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MachineSummariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MachineSummariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MachineSummariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String> machineId = const Value.absent(),
                Value<String?> machineName = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> currentJobId = const Value.absent(),
                Value<String?> currentJobName = const Value.absent(),
                Value<double> oeePercent = const Value.absent(),
                Value<double> availability = const Value.absent(),
                Value<double> performance = const Value.absent(),
                Value<double> quality = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => MachineSummariesCompanion(
                uid: uid,
                machineId: machineId,
                machineName: machineName,
                status: status,
                currentJobId: currentJobId,
                currentJobName: currentJobName,
                oeePercent: oeePercent,
                availability: availability,
                performance: performance,
                quality: quality,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                required String machineId,
                Value<String?> machineName = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> currentJobId = const Value.absent(),
                Value<String?> currentJobName = const Value.absent(),
                Value<double> oeePercent = const Value.absent(),
                Value<double> availability = const Value.absent(),
                Value<double> performance = const Value.absent(),
                Value<double> quality = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => MachineSummariesCompanion.insert(
                uid: uid,
                machineId: machineId,
                machineName: machineName,
                status: status,
                currentJobId: currentJobId,
                currentJobName: currentJobName,
                oeePercent: oeePercent,
                availability: availability,
                performance: performance,
                quality: quality,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MachineSummariesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MachineSummariesTable,
      DbMachineSummary,
      $$MachineSummariesTableFilterComposer,
      $$MachineSummariesTableOrderingComposer,
      $$MachineSummariesTableAnnotationComposer,
      $$MachineSummariesTableCreateCompanionBuilder,
      $$MachineSummariesTableUpdateCompanionBuilder,
      (
        DbMachineSummary,
        BaseReferences<_$AppDatabase, $MachineSummariesTable, DbMachineSummary>,
      ),
      DbMachineSummary,
      PrefetchHooks Function()
    >;
typedef $$MachineSummaryItemsTableCreateCompanionBuilder =
    MachineSummaryItemsCompanion Function({
      Value<int> uid,
      required String machineId,
      required String recId,
      Value<String?> jobTestSetRecId,
      Value<String?> testSetName,
      Value<String?> jobName,
      Value<String?> registerDateTime,
      Value<String?> registerUser,
      Value<String?> status,
    });
typedef $$MachineSummaryItemsTableUpdateCompanionBuilder =
    MachineSummaryItemsCompanion Function({
      Value<int> uid,
      Value<String> machineId,
      Value<String> recId,
      Value<String?> jobTestSetRecId,
      Value<String?> testSetName,
      Value<String?> jobName,
      Value<String?> registerDateTime,
      Value<String?> registerUser,
      Value<String?> status,
    });

class $$MachineSummaryItemsTableFilterComposer
    extends Composer<_$AppDatabase, $MachineSummaryItemsTable> {
  $$MachineSummaryItemsTableFilterComposer({
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

  ColumnFilters<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobTestSetRecId => $composableBuilder(
    column: $table.jobTestSetRecId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get testSetName => $composableBuilder(
    column: $table.testSetName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobName => $composableBuilder(
    column: $table.jobName,
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

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MachineSummaryItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $MachineSummaryItemsTable> {
  $$MachineSummaryItemsTableOrderingComposer({
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

  ColumnOrderings<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobTestSetRecId => $composableBuilder(
    column: $table.jobTestSetRecId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testSetName => $composableBuilder(
    column: $table.testSetName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobName => $composableBuilder(
    column: $table.jobName,
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

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MachineSummaryItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MachineSummaryItemsTable> {
  $$MachineSummaryItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get machineId =>
      $composableBuilder(column: $table.machineId, builder: (column) => column);

  GeneratedColumn<String> get recId =>
      $composableBuilder(column: $table.recId, builder: (column) => column);

  GeneratedColumn<String> get jobTestSetRecId => $composableBuilder(
    column: $table.jobTestSetRecId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get testSetName => $composableBuilder(
    column: $table.testSetName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jobName =>
      $composableBuilder(column: $table.jobName, builder: (column) => column);

  GeneratedColumn<String> get registerDateTime => $composableBuilder(
    column: $table.registerDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registerUser => $composableBuilder(
    column: $table.registerUser,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$MachineSummaryItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MachineSummaryItemsTable,
          DbMachineSummaryItem,
          $$MachineSummaryItemsTableFilterComposer,
          $$MachineSummaryItemsTableOrderingComposer,
          $$MachineSummaryItemsTableAnnotationComposer,
          $$MachineSummaryItemsTableCreateCompanionBuilder,
          $$MachineSummaryItemsTableUpdateCompanionBuilder,
          (
            DbMachineSummaryItem,
            BaseReferences<
              _$AppDatabase,
              $MachineSummaryItemsTable,
              DbMachineSummaryItem
            >,
          ),
          DbMachineSummaryItem,
          PrefetchHooks Function()
        > {
  $$MachineSummaryItemsTableTableManager(
    _$AppDatabase db,
    $MachineSummaryItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MachineSummaryItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MachineSummaryItemsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MachineSummaryItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String> machineId = const Value.absent(),
                Value<String> recId = const Value.absent(),
                Value<String?> jobTestSetRecId = const Value.absent(),
                Value<String?> testSetName = const Value.absent(),
                Value<String?> jobName = const Value.absent(),
                Value<String?> registerDateTime = const Value.absent(),
                Value<String?> registerUser = const Value.absent(),
                Value<String?> status = const Value.absent(),
              }) => MachineSummaryItemsCompanion(
                uid: uid,
                machineId: machineId,
                recId: recId,
                jobTestSetRecId: jobTestSetRecId,
                testSetName: testSetName,
                jobName: jobName,
                registerDateTime: registerDateTime,
                registerUser: registerUser,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                required String machineId,
                required String recId,
                Value<String?> jobTestSetRecId = const Value.absent(),
                Value<String?> testSetName = const Value.absent(),
                Value<String?> jobName = const Value.absent(),
                Value<String?> registerDateTime = const Value.absent(),
                Value<String?> registerUser = const Value.absent(),
                Value<String?> status = const Value.absent(),
              }) => MachineSummaryItemsCompanion.insert(
                uid: uid,
                machineId: machineId,
                recId: recId,
                jobTestSetRecId: jobTestSetRecId,
                testSetName: testSetName,
                jobName: jobName,
                registerDateTime: registerDateTime,
                registerUser: registerUser,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MachineSummaryItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MachineSummaryItemsTable,
      DbMachineSummaryItem,
      $$MachineSummaryItemsTableFilterComposer,
      $$MachineSummaryItemsTableOrderingComposer,
      $$MachineSummaryItemsTableAnnotationComposer,
      $$MachineSummaryItemsTableCreateCompanionBuilder,
      $$MachineSummaryItemsTableUpdateCompanionBuilder,
      (
        DbMachineSummaryItem,
        BaseReferences<
          _$AppDatabase,
          $MachineSummaryItemsTable,
          DbMachineSummaryItem
        >,
      ),
      DbMachineSummaryItem,
      PrefetchHooks Function()
    >;
typedef $$MachineSummaryEventsTableCreateCompanionBuilder =
    MachineSummaryEventsCompanion Function({
      Value<int> uid,
      required String machineId,
      required String recId,
      Value<String?> eventType,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<int?> durationSeconds,
      Value<String?> recordUserId,
    });
typedef $$MachineSummaryEventsTableUpdateCompanionBuilder =
    MachineSummaryEventsCompanion Function({
      Value<int> uid,
      Value<String> machineId,
      Value<String> recId,
      Value<String?> eventType,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<int?> durationSeconds,
      Value<String?> recordUserId,
    });

class $$MachineSummaryEventsTableFilterComposer
    extends Composer<_$AppDatabase, $MachineSummaryEventsTable> {
  $$MachineSummaryEventsTableFilterComposer({
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

  ColumnFilters<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventType => $composableBuilder(
    column: $table.eventType,
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

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordUserId => $composableBuilder(
    column: $table.recordUserId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MachineSummaryEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $MachineSummaryEventsTable> {
  $$MachineSummaryEventsTableOrderingComposer({
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

  ColumnOrderings<String> get machineId => $composableBuilder(
    column: $table.machineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recId => $composableBuilder(
    column: $table.recId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventType => $composableBuilder(
    column: $table.eventType,
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

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordUserId => $composableBuilder(
    column: $table.recordUserId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MachineSummaryEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MachineSummaryEventsTable> {
  $$MachineSummaryEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get machineId =>
      $composableBuilder(column: $table.machineId, builder: (column) => column);

  GeneratedColumn<String> get recId =>
      $composableBuilder(column: $table.recId, builder: (column) => column);

  GeneratedColumn<String> get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordUserId => $composableBuilder(
    column: $table.recordUserId,
    builder: (column) => column,
  );
}

class $$MachineSummaryEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MachineSummaryEventsTable,
          DbMachineSummaryEvent,
          $$MachineSummaryEventsTableFilterComposer,
          $$MachineSummaryEventsTableOrderingComposer,
          $$MachineSummaryEventsTableAnnotationComposer,
          $$MachineSummaryEventsTableCreateCompanionBuilder,
          $$MachineSummaryEventsTableUpdateCompanionBuilder,
          (
            DbMachineSummaryEvent,
            BaseReferences<
              _$AppDatabase,
              $MachineSummaryEventsTable,
              DbMachineSummaryEvent
            >,
          ),
          DbMachineSummaryEvent,
          PrefetchHooks Function()
        > {
  $$MachineSummaryEventsTableTableManager(
    _$AppDatabase db,
    $MachineSummaryEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MachineSummaryEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MachineSummaryEventsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MachineSummaryEventsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String> machineId = const Value.absent(),
                Value<String> recId = const Value.absent(),
                Value<String?> eventType = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<String?> recordUserId = const Value.absent(),
              }) => MachineSummaryEventsCompanion(
                uid: uid,
                machineId: machineId,
                recId: recId,
                eventType: eventType,
                startTime: startTime,
                endTime: endTime,
                durationSeconds: durationSeconds,
                recordUserId: recordUserId,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                required String machineId,
                required String recId,
                Value<String?> eventType = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int?> durationSeconds = const Value.absent(),
                Value<String?> recordUserId = const Value.absent(),
              }) => MachineSummaryEventsCompanion.insert(
                uid: uid,
                machineId: machineId,
                recId: recId,
                eventType: eventType,
                startTime: startTime,
                endTime: endTime,
                durationSeconds: durationSeconds,
                recordUserId: recordUserId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MachineSummaryEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MachineSummaryEventsTable,
      DbMachineSummaryEvent,
      $$MachineSummaryEventsTableFilterComposer,
      $$MachineSummaryEventsTableOrderingComposer,
      $$MachineSummaryEventsTableAnnotationComposer,
      $$MachineSummaryEventsTableCreateCompanionBuilder,
      $$MachineSummaryEventsTableUpdateCompanionBuilder,
      (
        DbMachineSummaryEvent,
        BaseReferences<
          _$AppDatabase,
          $MachineSummaryEventsTable,
          DbMachineSummaryEvent
        >,
      ),
      DbMachineSummaryEvent,
      PrefetchHooks Function()
    >;
typedef $$HumanActivityTypesTableCreateCompanionBuilder =
    HumanActivityTypesCompanion Function({
      Value<int> uid,
      Value<String?> recId,
      Value<String?> documentId,
      Value<String?> userId,
      Value<String?> activityCode,
      Value<String?> jobTestSetRecId,
      Value<String?> activityName,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
      Value<int> recordVersion,
    });
typedef $$HumanActivityTypesTableUpdateCompanionBuilder =
    HumanActivityTypesCompanion Function({
      Value<int> uid,
      Value<String?> recId,
      Value<String?> documentId,
      Value<String?> userId,
      Value<String?> activityCode,
      Value<String?> jobTestSetRecId,
      Value<String?> activityName,
      Value<int> status,
      Value<String?> updatedAt,
      Value<String?> lastSync,
      Value<int> syncStatus,
      Value<int> recordVersion,
    });

class $$HumanActivityTypesTableFilterComposer
    extends Composer<_$AppDatabase, $HumanActivityTypesTable> {
  $$HumanActivityTypesTableFilterComposer({
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

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityCode => $composableBuilder(
    column: $table.activityCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jobTestSetRecId => $composableBuilder(
    column: $table.jobTestSetRecId,
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

  ColumnFilters<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HumanActivityTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $HumanActivityTypesTable> {
  $$HumanActivityTypesTableOrderingComposer({
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

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityCode => $composableBuilder(
    column: $table.activityCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jobTestSetRecId => $composableBuilder(
    column: $table.jobTestSetRecId,
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

  ColumnOrderings<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HumanActivityTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $HumanActivityTypesTable> {
  $$HumanActivityTypesTableAnnotationComposer({
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

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get activityCode => $composableBuilder(
    column: $table.activityCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jobTestSetRecId => $composableBuilder(
    column: $table.jobTestSetRecId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get activityName => $composableBuilder(
    column: $table.activityName,
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

  GeneratedColumn<int> get recordVersion => $composableBuilder(
    column: $table.recordVersion,
    builder: (column) => column,
  );
}

class $$HumanActivityTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HumanActivityTypesTable,
          DbHumanActivityType,
          $$HumanActivityTypesTableFilterComposer,
          $$HumanActivityTypesTableOrderingComposer,
          $$HumanActivityTypesTableAnnotationComposer,
          $$HumanActivityTypesTableCreateCompanionBuilder,
          $$HumanActivityTypesTableUpdateCompanionBuilder,
          (
            DbHumanActivityType,
            BaseReferences<
              _$AppDatabase,
              $HumanActivityTypesTable,
              DbHumanActivityType
            >,
          ),
          DbHumanActivityType,
          PrefetchHooks Function()
        > {
  $$HumanActivityTypesTableTableManager(
    _$AppDatabase db,
    $HumanActivityTypesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HumanActivityTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HumanActivityTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HumanActivityTypesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> recId = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> activityCode = const Value.absent(),
                Value<String?> jobTestSetRecId = const Value.absent(),
                Value<String?> activityName = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<int> recordVersion = const Value.absent(),
              }) => HumanActivityTypesCompanion(
                uid: uid,
                recId: recId,
                documentId: documentId,
                userId: userId,
                activityCode: activityCode,
                jobTestSetRecId: jobTestSetRecId,
                activityName: activityName,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
                recordVersion: recordVersion,
              ),
          createCompanionCallback:
              ({
                Value<int> uid = const Value.absent(),
                Value<String?> recId = const Value.absent(),
                Value<String?> documentId = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> activityCode = const Value.absent(),
                Value<String?> jobTestSetRecId = const Value.absent(),
                Value<String?> activityName = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> lastSync = const Value.absent(),
                Value<int> syncStatus = const Value.absent(),
                Value<int> recordVersion = const Value.absent(),
              }) => HumanActivityTypesCompanion.insert(
                uid: uid,
                recId: recId,
                documentId: documentId,
                userId: userId,
                activityCode: activityCode,
                jobTestSetRecId: jobTestSetRecId,
                activityName: activityName,
                status: status,
                updatedAt: updatedAt,
                lastSync: lastSync,
                syncStatus: syncStatus,
                recordVersion: recordVersion,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HumanActivityTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HumanActivityTypesTable,
      DbHumanActivityType,
      $$HumanActivityTypesTableFilterComposer,
      $$HumanActivityTypesTableOrderingComposer,
      $$HumanActivityTypesTableAnnotationComposer,
      $$HumanActivityTypesTableCreateCompanionBuilder,
      $$HumanActivityTypesTableUpdateCompanionBuilder,
      (
        DbHumanActivityType,
        BaseReferences<
          _$AppDatabase,
          $HumanActivityTypesTable,
          DbHumanActivityType
        >,
      ),
      DbHumanActivityType,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$JobsTableTableManager get jobs => $$JobsTableTableManager(_db, _db.jobs);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db, _db.documents);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
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
  $$MachinesTableTableManager get machines =>
      $$MachinesTableTableManager(_db, _db.machines);
  $$SyncLogsTableTableManager get syncLogs =>
      $$SyncLogsTableTableManager(_db, _db.syncLogs);
  $$MachineSummariesTableTableManager get machineSummaries =>
      $$MachineSummariesTableTableManager(_db, _db.machineSummaries);
  $$MachineSummaryItemsTableTableManager get machineSummaryItems =>
      $$MachineSummaryItemsTableTableManager(_db, _db.machineSummaryItems);
  $$MachineSummaryEventsTableTableManager get machineSummaryEvents =>
      $$MachineSummaryEventsTableTableManager(_db, _db.machineSummaryEvents);
  $$HumanActivityTypesTableTableManager get humanActivityTypes =>
      $$HumanActivityTypesTableTableManager(_db, _db.humanActivityTypes);
}
