// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AssessmentSessionsTable extends AssessmentSessions
    with TableInfo<$AssessmentSessionsTable, AssessmentSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssessmentSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assessmentTypeMeta = const VerificationMeta(
    'assessmentType',
  );
  @override
  late final GeneratedColumn<String> assessmentType = GeneratedColumn<String>(
    'assessment_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentVersionMeta = const VerificationMeta(
    'contentVersion',
  );
  @override
  late final GeneratedColumn<String> contentVersion = GeneratedColumn<String>(
    'content_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoringVersionMeta = const VerificationMeta(
    'scoringVersion',
  );
  @override
  late final GeneratedColumn<String> scoringVersion = GeneratedColumn<String>(
    'scoring_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localeAtStartMeta = const VerificationMeta(
    'localeAtStart',
  );
  @override
  late final GeneratedColumn<String> localeAtStart = GeneratedColumn<String>(
    'locale_at_start',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentIndexMeta = const VerificationMeta(
    'currentIndex',
  );
  @override
  late final GeneratedColumn<int> currentIndex = GeneratedColumn<int>(
    'current_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    assessmentType,
    status,
    contentVersion,
    scoringVersion,
    localeAtStart,
    currentIndex,
    schemaVersion,
    startedAt,
    updatedAt,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assessment_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<AssessmentSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('assessment_type')) {
      context.handle(
        _assessmentTypeMeta,
        assessmentType.isAcceptableOrUnknown(
          data['assessment_type']!,
          _assessmentTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assessmentTypeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('content_version')) {
      context.handle(
        _contentVersionMeta,
        contentVersion.isAcceptableOrUnknown(
          data['content_version']!,
          _contentVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentVersionMeta);
    }
    if (data.containsKey('scoring_version')) {
      context.handle(
        _scoringVersionMeta,
        scoringVersion.isAcceptableOrUnknown(
          data['scoring_version']!,
          _scoringVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scoringVersionMeta);
    }
    if (data.containsKey('locale_at_start')) {
      context.handle(
        _localeAtStartMeta,
        localeAtStart.isAcceptableOrUnknown(
          data['locale_at_start']!,
          _localeAtStartMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localeAtStartMeta);
    }
    if (data.containsKey('current_index')) {
      context.handle(
        _currentIndexMeta,
        currentIndex.isAcceptableOrUnknown(
          data['current_index']!,
          _currentIndexMeta,
        ),
      );
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssessmentSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssessmentSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      assessmentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assessment_type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      contentVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_version'],
      )!,
      scoringVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scoring_version'],
      )!,
      localeAtStart: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}locale_at_start'],
      )!,
      currentIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_index'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $AssessmentSessionsTable createAlias(String alias) {
    return $AssessmentSessionsTable(attachedDatabase, alias);
  }
}

class AssessmentSession extends DataClass
    implements Insertable<AssessmentSession> {
  final String id;
  final String assessmentType;
  final String status;
  final String contentVersion;
  final String scoringVersion;
  final String localeAtStart;
  final int currentIndex;
  final int schemaVersion;
  final DateTime startedAt;
  final DateTime updatedAt;
  final DateTime? completedAt;
  const AssessmentSession({
    required this.id,
    required this.assessmentType,
    required this.status,
    required this.contentVersion,
    required this.scoringVersion,
    required this.localeAtStart,
    required this.currentIndex,
    required this.schemaVersion,
    required this.startedAt,
    required this.updatedAt,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['assessment_type'] = Variable<String>(assessmentType);
    map['status'] = Variable<String>(status);
    map['content_version'] = Variable<String>(contentVersion);
    map['scoring_version'] = Variable<String>(scoringVersion);
    map['locale_at_start'] = Variable<String>(localeAtStart);
    map['current_index'] = Variable<int>(currentIndex);
    map['schema_version'] = Variable<int>(schemaVersion);
    map['started_at'] = Variable<DateTime>(startedAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  AssessmentSessionsCompanion toCompanion(bool nullToAbsent) {
    return AssessmentSessionsCompanion(
      id: Value(id),
      assessmentType: Value(assessmentType),
      status: Value(status),
      contentVersion: Value(contentVersion),
      scoringVersion: Value(scoringVersion),
      localeAtStart: Value(localeAtStart),
      currentIndex: Value(currentIndex),
      schemaVersion: Value(schemaVersion),
      startedAt: Value(startedAt),
      updatedAt: Value(updatedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory AssessmentSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssessmentSession(
      id: serializer.fromJson<String>(json['id']),
      assessmentType: serializer.fromJson<String>(json['assessmentType']),
      status: serializer.fromJson<String>(json['status']),
      contentVersion: serializer.fromJson<String>(json['contentVersion']),
      scoringVersion: serializer.fromJson<String>(json['scoringVersion']),
      localeAtStart: serializer.fromJson<String>(json['localeAtStart']),
      currentIndex: serializer.fromJson<int>(json['currentIndex']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assessmentType': serializer.toJson<String>(assessmentType),
      'status': serializer.toJson<String>(status),
      'contentVersion': serializer.toJson<String>(contentVersion),
      'scoringVersion': serializer.toJson<String>(scoringVersion),
      'localeAtStart': serializer.toJson<String>(localeAtStart),
      'currentIndex': serializer.toJson<int>(currentIndex),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  AssessmentSession copyWith({
    String? id,
    String? assessmentType,
    String? status,
    String? contentVersion,
    String? scoringVersion,
    String? localeAtStart,
    int? currentIndex,
    int? schemaVersion,
    DateTime? startedAt,
    DateTime? updatedAt,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => AssessmentSession(
    id: id ?? this.id,
    assessmentType: assessmentType ?? this.assessmentType,
    status: status ?? this.status,
    contentVersion: contentVersion ?? this.contentVersion,
    scoringVersion: scoringVersion ?? this.scoringVersion,
    localeAtStart: localeAtStart ?? this.localeAtStart,
    currentIndex: currentIndex ?? this.currentIndex,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    startedAt: startedAt ?? this.startedAt,
    updatedAt: updatedAt ?? this.updatedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  AssessmentSession copyWithCompanion(AssessmentSessionsCompanion data) {
    return AssessmentSession(
      id: data.id.present ? data.id.value : this.id,
      assessmentType: data.assessmentType.present
          ? data.assessmentType.value
          : this.assessmentType,
      status: data.status.present ? data.status.value : this.status,
      contentVersion: data.contentVersion.present
          ? data.contentVersion.value
          : this.contentVersion,
      scoringVersion: data.scoringVersion.present
          ? data.scoringVersion.value
          : this.scoringVersion,
      localeAtStart: data.localeAtStart.present
          ? data.localeAtStart.value
          : this.localeAtStart,
      currentIndex: data.currentIndex.present
          ? data.currentIndex.value
          : this.currentIndex,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentSession(')
          ..write('id: $id, ')
          ..write('assessmentType: $assessmentType, ')
          ..write('status: $status, ')
          ..write('contentVersion: $contentVersion, ')
          ..write('scoringVersion: $scoringVersion, ')
          ..write('localeAtStart: $localeAtStart, ')
          ..write('currentIndex: $currentIndex, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('startedAt: $startedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    assessmentType,
    status,
    contentVersion,
    scoringVersion,
    localeAtStart,
    currentIndex,
    schemaVersion,
    startedAt,
    updatedAt,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssessmentSession &&
          other.id == this.id &&
          other.assessmentType == this.assessmentType &&
          other.status == this.status &&
          other.contentVersion == this.contentVersion &&
          other.scoringVersion == this.scoringVersion &&
          other.localeAtStart == this.localeAtStart &&
          other.currentIndex == this.currentIndex &&
          other.schemaVersion == this.schemaVersion &&
          other.startedAt == this.startedAt &&
          other.updatedAt == this.updatedAt &&
          other.completedAt == this.completedAt);
}

class AssessmentSessionsCompanion extends UpdateCompanion<AssessmentSession> {
  final Value<String> id;
  final Value<String> assessmentType;
  final Value<String> status;
  final Value<String> contentVersion;
  final Value<String> scoringVersion;
  final Value<String> localeAtStart;
  final Value<int> currentIndex;
  final Value<int> schemaVersion;
  final Value<DateTime> startedAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const AssessmentSessionsCompanion({
    this.id = const Value.absent(),
    this.assessmentType = const Value.absent(),
    this.status = const Value.absent(),
    this.contentVersion = const Value.absent(),
    this.scoringVersion = const Value.absent(),
    this.localeAtStart = const Value.absent(),
    this.currentIndex = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssessmentSessionsCompanion.insert({
    required String id,
    required String assessmentType,
    required String status,
    required String contentVersion,
    required String scoringVersion,
    required String localeAtStart,
    this.currentIndex = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    required DateTime startedAt,
    required DateTime updatedAt,
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       assessmentType = Value(assessmentType),
       status = Value(status),
       contentVersion = Value(contentVersion),
       scoringVersion = Value(scoringVersion),
       localeAtStart = Value(localeAtStart),
       startedAt = Value(startedAt),
       updatedAt = Value(updatedAt);
  static Insertable<AssessmentSession> custom({
    Expression<String>? id,
    Expression<String>? assessmentType,
    Expression<String>? status,
    Expression<String>? contentVersion,
    Expression<String>? scoringVersion,
    Expression<String>? localeAtStart,
    Expression<int>? currentIndex,
    Expression<int>? schemaVersion,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentType != null) 'assessment_type': assessmentType,
      if (status != null) 'status': status,
      if (contentVersion != null) 'content_version': contentVersion,
      if (scoringVersion != null) 'scoring_version': scoringVersion,
      if (localeAtStart != null) 'locale_at_start': localeAtStart,
      if (currentIndex != null) 'current_index': currentIndex,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (startedAt != null) 'started_at': startedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssessmentSessionsCompanion copyWith({
    Value<String>? id,
    Value<String>? assessmentType,
    Value<String>? status,
    Value<String>? contentVersion,
    Value<String>? scoringVersion,
    Value<String>? localeAtStart,
    Value<int>? currentIndex,
    Value<int>? schemaVersion,
    Value<DateTime>? startedAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return AssessmentSessionsCompanion(
      id: id ?? this.id,
      assessmentType: assessmentType ?? this.assessmentType,
      status: status ?? this.status,
      contentVersion: contentVersion ?? this.contentVersion,
      scoringVersion: scoringVersion ?? this.scoringVersion,
      localeAtStart: localeAtStart ?? this.localeAtStart,
      currentIndex: currentIndex ?? this.currentIndex,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      startedAt: startedAt ?? this.startedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assessmentType.present) {
      map['assessment_type'] = Variable<String>(assessmentType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (contentVersion.present) {
      map['content_version'] = Variable<String>(contentVersion.value);
    }
    if (scoringVersion.present) {
      map['scoring_version'] = Variable<String>(scoringVersion.value);
    }
    if (localeAtStart.present) {
      map['locale_at_start'] = Variable<String>(localeAtStart.value);
    }
    if (currentIndex.present) {
      map['current_index'] = Variable<int>(currentIndex.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentSessionsCompanion(')
          ..write('id: $id, ')
          ..write('assessmentType: $assessmentType, ')
          ..write('status: $status, ')
          ..write('contentVersion: $contentVersion, ')
          ..write('scoringVersion: $scoringVersion, ')
          ..write('localeAtStart: $localeAtStart, ')
          ..write('currentIndex: $currentIndex, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('startedAt: $startedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnswersTable extends Answers with TableInfo<$AnswersTable, Answer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedValueMeta = const VerificationMeta(
    'selectedValue',
  );
  @override
  late final GeneratedColumn<String> selectedValue = GeneratedColumn<String>(
    'selected_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _answeredAtMeta = const VerificationMeta(
    'answeredAt',
  );
  @override
  late final GeneratedColumn<DateTime> answeredAt = GeneratedColumn<DateTime>(
    'answered_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    sessionId,
    questionId,
    selectedValue,
    answeredAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'answers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Answer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('selected_value')) {
      context.handle(
        _selectedValueMeta,
        selectedValue.isAcceptableOrUnknown(
          data['selected_value']!,
          _selectedValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectedValueMeta);
    }
    if (data.containsKey('answered_at')) {
      context.handle(
        _answeredAtMeta,
        answeredAt.isAcceptableOrUnknown(data['answered_at']!, _answeredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_answeredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sessionId, questionId};
  @override
  Answer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Answer(
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_id'],
      )!,
      selectedValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_value'],
      )!,
      answeredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}answered_at'],
      )!,
    );
  }

  @override
  $AnswersTable createAlias(String alias) {
    return $AnswersTable(attachedDatabase, alias);
  }
}

class Answer extends DataClass implements Insertable<Answer> {
  final String sessionId;
  final String questionId;
  final String selectedValue;
  final DateTime answeredAt;
  const Answer({
    required this.sessionId,
    required this.questionId,
    required this.selectedValue,
    required this.answeredAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['session_id'] = Variable<String>(sessionId);
    map['question_id'] = Variable<String>(questionId);
    map['selected_value'] = Variable<String>(selectedValue);
    map['answered_at'] = Variable<DateTime>(answeredAt);
    return map;
  }

  AnswersCompanion toCompanion(bool nullToAbsent) {
    return AnswersCompanion(
      sessionId: Value(sessionId),
      questionId: Value(questionId),
      selectedValue: Value(selectedValue),
      answeredAt: Value(answeredAt),
    );
  }

  factory Answer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Answer(
      sessionId: serializer.fromJson<String>(json['sessionId']),
      questionId: serializer.fromJson<String>(json['questionId']),
      selectedValue: serializer.fromJson<String>(json['selectedValue']),
      answeredAt: serializer.fromJson<DateTime>(json['answeredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sessionId': serializer.toJson<String>(sessionId),
      'questionId': serializer.toJson<String>(questionId),
      'selectedValue': serializer.toJson<String>(selectedValue),
      'answeredAt': serializer.toJson<DateTime>(answeredAt),
    };
  }

  Answer copyWith({
    String? sessionId,
    String? questionId,
    String? selectedValue,
    DateTime? answeredAt,
  }) => Answer(
    sessionId: sessionId ?? this.sessionId,
    questionId: questionId ?? this.questionId,
    selectedValue: selectedValue ?? this.selectedValue,
    answeredAt: answeredAt ?? this.answeredAt,
  );
  Answer copyWithCompanion(AnswersCompanion data) {
    return Answer(
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      selectedValue: data.selectedValue.present
          ? data.selectedValue.value
          : this.selectedValue,
      answeredAt: data.answeredAt.present
          ? data.answeredAt.value
          : this.answeredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Answer(')
          ..write('sessionId: $sessionId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedValue: $selectedValue, ')
          ..write('answeredAt: $answeredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(sessionId, questionId, selectedValue, answeredAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Answer &&
          other.sessionId == this.sessionId &&
          other.questionId == this.questionId &&
          other.selectedValue == this.selectedValue &&
          other.answeredAt == this.answeredAt);
}

class AnswersCompanion extends UpdateCompanion<Answer> {
  final Value<String> sessionId;
  final Value<String> questionId;
  final Value<String> selectedValue;
  final Value<DateTime> answeredAt;
  final Value<int> rowid;
  const AnswersCompanion({
    this.sessionId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.selectedValue = const Value.absent(),
    this.answeredAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnswersCompanion.insert({
    required String sessionId,
    required String questionId,
    required String selectedValue,
    required DateTime answeredAt,
    this.rowid = const Value.absent(),
  }) : sessionId = Value(sessionId),
       questionId = Value(questionId),
       selectedValue = Value(selectedValue),
       answeredAt = Value(answeredAt);
  static Insertable<Answer> custom({
    Expression<String>? sessionId,
    Expression<String>? questionId,
    Expression<String>? selectedValue,
    Expression<DateTime>? answeredAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sessionId != null) 'session_id': sessionId,
      if (questionId != null) 'question_id': questionId,
      if (selectedValue != null) 'selected_value': selectedValue,
      if (answeredAt != null) 'answered_at': answeredAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnswersCompanion copyWith({
    Value<String>? sessionId,
    Value<String>? questionId,
    Value<String>? selectedValue,
    Value<DateTime>? answeredAt,
    Value<int>? rowid,
  }) {
    return AnswersCompanion(
      sessionId: sessionId ?? this.sessionId,
      questionId: questionId ?? this.questionId,
      selectedValue: selectedValue ?? this.selectedValue,
      answeredAt: answeredAt ?? this.answeredAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (selectedValue.present) {
      map['selected_value'] = Variable<String>(selectedValue.value);
    }
    if (answeredAt.present) {
      map['answered_at'] = Variable<DateTime>(answeredAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnswersCompanion(')
          ..write('sessionId: $sessionId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedValue: $selectedValue, ')
          ..write('answeredAt: $answeredAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ResultsTable extends Results with TableInfo<$ResultsTable, Result> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _overallIndexMeta = const VerificationMeta(
    'overallIndex',
  );
  @override
  late final GeneratedColumn<double> overallIndex = GeneratedColumn<double>(
    'overall_index',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dimensionIndicesMeta = const VerificationMeta(
    'dimensionIndices',
  );
  @override
  late final GeneratedColumn<String> dimensionIndices = GeneratedColumn<String>(
    'dimension_indices',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interpretationBandMeta =
      const VerificationMeta('interpretationBand');
  @override
  late final GeneratedColumn<String> interpretationBand =
      GeneratedColumn<String>(
        'interpretation_band',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _contentVersionMeta = const VerificationMeta(
    'contentVersion',
  );
  @override
  late final GeneratedColumn<String> contentVersion = GeneratedColumn<String>(
    'content_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoringVersionMeta = const VerificationMeta(
    'scoringVersion',
  );
  @override
  late final GeneratedColumn<String> scoringVersion = GeneratedColumn<String>(
    'scoring_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    sessionId,
    overallIndex,
    dimensionIndices,
    interpretationBand,
    contentVersion,
    scoringVersion,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'results';
  @override
  VerificationContext validateIntegrity(
    Insertable<Result> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('overall_index')) {
      context.handle(
        _overallIndexMeta,
        overallIndex.isAcceptableOrUnknown(
          data['overall_index']!,
          _overallIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_overallIndexMeta);
    }
    if (data.containsKey('dimension_indices')) {
      context.handle(
        _dimensionIndicesMeta,
        dimensionIndices.isAcceptableOrUnknown(
          data['dimension_indices']!,
          _dimensionIndicesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dimensionIndicesMeta);
    }
    if (data.containsKey('interpretation_band')) {
      context.handle(
        _interpretationBandMeta,
        interpretationBand.isAcceptableOrUnknown(
          data['interpretation_band']!,
          _interpretationBandMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interpretationBandMeta);
    }
    if (data.containsKey('content_version')) {
      context.handle(
        _contentVersionMeta,
        contentVersion.isAcceptableOrUnknown(
          data['content_version']!,
          _contentVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contentVersionMeta);
    }
    if (data.containsKey('scoring_version')) {
      context.handle(
        _scoringVersionMeta,
        scoringVersion.isAcceptableOrUnknown(
          data['scoring_version']!,
          _scoringVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scoringVersionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sessionId};
  @override
  Result map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Result(
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      overallIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}overall_index'],
      )!,
      dimensionIndices: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dimension_indices'],
      )!,
      interpretationBand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}interpretation_band'],
      )!,
      contentVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_version'],
      )!,
      scoringVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scoring_version'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ResultsTable createAlias(String alias) {
    return $ResultsTable(attachedDatabase, alias);
  }
}

class Result extends DataClass implements Insertable<Result> {
  final String sessionId;
  final double overallIndex;

  /// JSON object: {"SA": 87.5, "SR": ..., "SO": ..., "RM": ...}
  final String dimensionIndices;
  final String interpretationBand;
  final String contentVersion;
  final String scoringVersion;
  final DateTime createdAt;
  const Result({
    required this.sessionId,
    required this.overallIndex,
    required this.dimensionIndices,
    required this.interpretationBand,
    required this.contentVersion,
    required this.scoringVersion,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['session_id'] = Variable<String>(sessionId);
    map['overall_index'] = Variable<double>(overallIndex);
    map['dimension_indices'] = Variable<String>(dimensionIndices);
    map['interpretation_band'] = Variable<String>(interpretationBand);
    map['content_version'] = Variable<String>(contentVersion);
    map['scoring_version'] = Variable<String>(scoringVersion);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ResultsCompanion toCompanion(bool nullToAbsent) {
    return ResultsCompanion(
      sessionId: Value(sessionId),
      overallIndex: Value(overallIndex),
      dimensionIndices: Value(dimensionIndices),
      interpretationBand: Value(interpretationBand),
      contentVersion: Value(contentVersion),
      scoringVersion: Value(scoringVersion),
      createdAt: Value(createdAt),
    );
  }

  factory Result.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Result(
      sessionId: serializer.fromJson<String>(json['sessionId']),
      overallIndex: serializer.fromJson<double>(json['overallIndex']),
      dimensionIndices: serializer.fromJson<String>(json['dimensionIndices']),
      interpretationBand: serializer.fromJson<String>(
        json['interpretationBand'],
      ),
      contentVersion: serializer.fromJson<String>(json['contentVersion']),
      scoringVersion: serializer.fromJson<String>(json['scoringVersion']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sessionId': serializer.toJson<String>(sessionId),
      'overallIndex': serializer.toJson<double>(overallIndex),
      'dimensionIndices': serializer.toJson<String>(dimensionIndices),
      'interpretationBand': serializer.toJson<String>(interpretationBand),
      'contentVersion': serializer.toJson<String>(contentVersion),
      'scoringVersion': serializer.toJson<String>(scoringVersion),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Result copyWith({
    String? sessionId,
    double? overallIndex,
    String? dimensionIndices,
    String? interpretationBand,
    String? contentVersion,
    String? scoringVersion,
    DateTime? createdAt,
  }) => Result(
    sessionId: sessionId ?? this.sessionId,
    overallIndex: overallIndex ?? this.overallIndex,
    dimensionIndices: dimensionIndices ?? this.dimensionIndices,
    interpretationBand: interpretationBand ?? this.interpretationBand,
    contentVersion: contentVersion ?? this.contentVersion,
    scoringVersion: scoringVersion ?? this.scoringVersion,
    createdAt: createdAt ?? this.createdAt,
  );
  Result copyWithCompanion(ResultsCompanion data) {
    return Result(
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      overallIndex: data.overallIndex.present
          ? data.overallIndex.value
          : this.overallIndex,
      dimensionIndices: data.dimensionIndices.present
          ? data.dimensionIndices.value
          : this.dimensionIndices,
      interpretationBand: data.interpretationBand.present
          ? data.interpretationBand.value
          : this.interpretationBand,
      contentVersion: data.contentVersion.present
          ? data.contentVersion.value
          : this.contentVersion,
      scoringVersion: data.scoringVersion.present
          ? data.scoringVersion.value
          : this.scoringVersion,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Result(')
          ..write('sessionId: $sessionId, ')
          ..write('overallIndex: $overallIndex, ')
          ..write('dimensionIndices: $dimensionIndices, ')
          ..write('interpretationBand: $interpretationBand, ')
          ..write('contentVersion: $contentVersion, ')
          ..write('scoringVersion: $scoringVersion, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    sessionId,
    overallIndex,
    dimensionIndices,
    interpretationBand,
    contentVersion,
    scoringVersion,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Result &&
          other.sessionId == this.sessionId &&
          other.overallIndex == this.overallIndex &&
          other.dimensionIndices == this.dimensionIndices &&
          other.interpretationBand == this.interpretationBand &&
          other.contentVersion == this.contentVersion &&
          other.scoringVersion == this.scoringVersion &&
          other.createdAt == this.createdAt);
}

class ResultsCompanion extends UpdateCompanion<Result> {
  final Value<String> sessionId;
  final Value<double> overallIndex;
  final Value<String> dimensionIndices;
  final Value<String> interpretationBand;
  final Value<String> contentVersion;
  final Value<String> scoringVersion;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ResultsCompanion({
    this.sessionId = const Value.absent(),
    this.overallIndex = const Value.absent(),
    this.dimensionIndices = const Value.absent(),
    this.interpretationBand = const Value.absent(),
    this.contentVersion = const Value.absent(),
    this.scoringVersion = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ResultsCompanion.insert({
    required String sessionId,
    required double overallIndex,
    required String dimensionIndices,
    required String interpretationBand,
    required String contentVersion,
    required String scoringVersion,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : sessionId = Value(sessionId),
       overallIndex = Value(overallIndex),
       dimensionIndices = Value(dimensionIndices),
       interpretationBand = Value(interpretationBand),
       contentVersion = Value(contentVersion),
       scoringVersion = Value(scoringVersion),
       createdAt = Value(createdAt);
  static Insertable<Result> custom({
    Expression<String>? sessionId,
    Expression<double>? overallIndex,
    Expression<String>? dimensionIndices,
    Expression<String>? interpretationBand,
    Expression<String>? contentVersion,
    Expression<String>? scoringVersion,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sessionId != null) 'session_id': sessionId,
      if (overallIndex != null) 'overall_index': overallIndex,
      if (dimensionIndices != null) 'dimension_indices': dimensionIndices,
      if (interpretationBand != null) 'interpretation_band': interpretationBand,
      if (contentVersion != null) 'content_version': contentVersion,
      if (scoringVersion != null) 'scoring_version': scoringVersion,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ResultsCompanion copyWith({
    Value<String>? sessionId,
    Value<double>? overallIndex,
    Value<String>? dimensionIndices,
    Value<String>? interpretationBand,
    Value<String>? contentVersion,
    Value<String>? scoringVersion,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ResultsCompanion(
      sessionId: sessionId ?? this.sessionId,
      overallIndex: overallIndex ?? this.overallIndex,
      dimensionIndices: dimensionIndices ?? this.dimensionIndices,
      interpretationBand: interpretationBand ?? this.interpretationBand,
      contentVersion: contentVersion ?? this.contentVersion,
      scoringVersion: scoringVersion ?? this.scoringVersion,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (overallIndex.present) {
      map['overall_index'] = Variable<double>(overallIndex.value);
    }
    if (dimensionIndices.present) {
      map['dimension_indices'] = Variable<String>(dimensionIndices.value);
    }
    if (interpretationBand.present) {
      map['interpretation_band'] = Variable<String>(interpretationBand.value);
    }
    if (contentVersion.present) {
      map['content_version'] = Variable<String>(contentVersion.value);
    }
    if (scoringVersion.present) {
      map['scoring_version'] = Variable<String>(scoringVersion.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResultsCompanion(')
          ..write('sessionId: $sessionId, ')
          ..write('overallIndex: $overallIndex, ')
          ..write('dimensionIndices: $dimensionIndices, ')
          ..write('interpretationBand: $interpretationBand, ')
          ..write('contentVersion: $contentVersion, ')
          ..write('scoringVersion: $scoringVersion, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlanProgressTable extends PlanProgress
    with TableInfo<$PlanProgressTable, PlanProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayNumberMeta = const VerificationMeta(
    'dayNumber',
  );
  @override
  late final GeneratedColumn<int> dayNumber = GeneratedColumn<int>(
    'day_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [sessionId, dayNumber, completed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plan_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlanProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('day_number')) {
      context.handle(
        _dayNumberMeta,
        dayNumber.isAcceptableOrUnknown(data['day_number']!, _dayNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_dayNumberMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sessionId, dayNumber};
  @override
  PlanProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanProgressData(
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      dayNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_number'],
      )!,
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
    );
  }

  @override
  $PlanProgressTable createAlias(String alias) {
    return $PlanProgressTable(attachedDatabase, alias);
  }
}

class PlanProgressData extends DataClass
    implements Insertable<PlanProgressData> {
  final String sessionId;
  final int dayNumber;
  final bool completed;
  const PlanProgressData({
    required this.sessionId,
    required this.dayNumber,
    required this.completed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['session_id'] = Variable<String>(sessionId);
    map['day_number'] = Variable<int>(dayNumber);
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  PlanProgressCompanion toCompanion(bool nullToAbsent) {
    return PlanProgressCompanion(
      sessionId: Value(sessionId),
      dayNumber: Value(dayNumber),
      completed: Value(completed),
    );
  }

  factory PlanProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanProgressData(
      sessionId: serializer.fromJson<String>(json['sessionId']),
      dayNumber: serializer.fromJson<int>(json['dayNumber']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sessionId': serializer.toJson<String>(sessionId),
      'dayNumber': serializer.toJson<int>(dayNumber),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  PlanProgressData copyWith({
    String? sessionId,
    int? dayNumber,
    bool? completed,
  }) => PlanProgressData(
    sessionId: sessionId ?? this.sessionId,
    dayNumber: dayNumber ?? this.dayNumber,
    completed: completed ?? this.completed,
  );
  PlanProgressData copyWithCompanion(PlanProgressCompanion data) {
    return PlanProgressData(
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      dayNumber: data.dayNumber.present ? data.dayNumber.value : this.dayNumber,
      completed: data.completed.present ? data.completed.value : this.completed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanProgressData(')
          ..write('sessionId: $sessionId, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(sessionId, dayNumber, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanProgressData &&
          other.sessionId == this.sessionId &&
          other.dayNumber == this.dayNumber &&
          other.completed == this.completed);
}

class PlanProgressCompanion extends UpdateCompanion<PlanProgressData> {
  final Value<String> sessionId;
  final Value<int> dayNumber;
  final Value<bool> completed;
  final Value<int> rowid;
  const PlanProgressCompanion({
    this.sessionId = const Value.absent(),
    this.dayNumber = const Value.absent(),
    this.completed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlanProgressCompanion.insert({
    required String sessionId,
    required int dayNumber,
    this.completed = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : sessionId = Value(sessionId),
       dayNumber = Value(dayNumber);
  static Insertable<PlanProgressData> custom({
    Expression<String>? sessionId,
    Expression<int>? dayNumber,
    Expression<bool>? completed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sessionId != null) 'session_id': sessionId,
      if (dayNumber != null) 'day_number': dayNumber,
      if (completed != null) 'completed': completed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlanProgressCompanion copyWith({
    Value<String>? sessionId,
    Value<int>? dayNumber,
    Value<bool>? completed,
    Value<int>? rowid,
  }) {
    return PlanProgressCompanion(
      sessionId: sessionId ?? this.sessionId,
      dayNumber: dayNumber ?? this.dayNumber,
      completed: completed ?? this.completed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (dayNumber.present) {
      map['day_number'] = Variable<int>(dayNumber.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanProgressCompanion(')
          ..write('sessionId: $sessionId, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('completed: $completed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AssessmentSessionsTable assessmentSessions =
      $AssessmentSessionsTable(this);
  late final $AnswersTable answers = $AnswersTable(this);
  late final $ResultsTable results = $ResultsTable(this);
  late final $PlanProgressTable planProgress = $PlanProgressTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    assessmentSessions,
    answers,
    results,
    planProgress,
  ];
}

typedef $$AssessmentSessionsTableCreateCompanionBuilder =
    AssessmentSessionsCompanion Function({
      required String id,
      required String assessmentType,
      required String status,
      required String contentVersion,
      required String scoringVersion,
      required String localeAtStart,
      Value<int> currentIndex,
      Value<int> schemaVersion,
      required DateTime startedAt,
      required DateTime updatedAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });
typedef $$AssessmentSessionsTableUpdateCompanionBuilder =
    AssessmentSessionsCompanion Function({
      Value<String> id,
      Value<String> assessmentType,
      Value<String> status,
      Value<String> contentVersion,
      Value<String> scoringVersion,
      Value<String> localeAtStart,
      Value<int> currentIndex,
      Value<int> schemaVersion,
      Value<DateTime> startedAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });

class $$AssessmentSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $AssessmentSessionsTable> {
  $$AssessmentSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assessmentType => $composableBuilder(
    column: $table.assessmentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scoringVersion => $composableBuilder(
    column: $table.scoringVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localeAtStart => $composableBuilder(
    column: $table.localeAtStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AssessmentSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssessmentSessionsTable> {
  $$AssessmentSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assessmentType => $composableBuilder(
    column: $table.assessmentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scoringVersion => $composableBuilder(
    column: $table.scoringVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localeAtStart => $composableBuilder(
    column: $table.localeAtStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AssessmentSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssessmentSessionsTable> {
  $$AssessmentSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assessmentType => $composableBuilder(
    column: $table.assessmentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get scoringVersion => $composableBuilder(
    column: $table.scoringVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localeAtStart => $composableBuilder(
    column: $table.localeAtStart,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentIndex => $composableBuilder(
    column: $table.currentIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$AssessmentSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AssessmentSessionsTable,
          AssessmentSession,
          $$AssessmentSessionsTableFilterComposer,
          $$AssessmentSessionsTableOrderingComposer,
          $$AssessmentSessionsTableAnnotationComposer,
          $$AssessmentSessionsTableCreateCompanionBuilder,
          $$AssessmentSessionsTableUpdateCompanionBuilder,
          (
            AssessmentSession,
            BaseReferences<
              _$AppDatabase,
              $AssessmentSessionsTable,
              AssessmentSession
            >,
          ),
          AssessmentSession,
          PrefetchHooks Function()
        > {
  $$AssessmentSessionsTableTableManager(
    _$AppDatabase db,
    $AssessmentSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssessmentSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssessmentSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssessmentSessionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> assessmentType = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> contentVersion = const Value.absent(),
                Value<String> scoringVersion = const Value.absent(),
                Value<String> localeAtStart = const Value.absent(),
                Value<int> currentIndex = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssessmentSessionsCompanion(
                id: id,
                assessmentType: assessmentType,
                status: status,
                contentVersion: contentVersion,
                scoringVersion: scoringVersion,
                localeAtStart: localeAtStart,
                currentIndex: currentIndex,
                schemaVersion: schemaVersion,
                startedAt: startedAt,
                updatedAt: updatedAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String assessmentType,
                required String status,
                required String contentVersion,
                required String scoringVersion,
                required String localeAtStart,
                Value<int> currentIndex = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                required DateTime startedAt,
                required DateTime updatedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssessmentSessionsCompanion.insert(
                id: id,
                assessmentType: assessmentType,
                status: status,
                contentVersion: contentVersion,
                scoringVersion: scoringVersion,
                localeAtStart: localeAtStart,
                currentIndex: currentIndex,
                schemaVersion: schemaVersion,
                startedAt: startedAt,
                updatedAt: updatedAt,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AssessmentSessionsTable, AssessmentSession>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $AssessmentSessionsTable,
                    AssessmentSession
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AssessmentSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AssessmentSessionsTable,
      AssessmentSession,
      $$AssessmentSessionsTableFilterComposer,
      $$AssessmentSessionsTableOrderingComposer,
      $$AssessmentSessionsTableAnnotationComposer,
      $$AssessmentSessionsTableCreateCompanionBuilder,
      $$AssessmentSessionsTableUpdateCompanionBuilder,
      (
        AssessmentSession,
        BaseReferences<
          _$AppDatabase,
          $AssessmentSessionsTable,
          AssessmentSession
        >,
      ),
      AssessmentSession,
      PrefetchHooks Function()
    >;
typedef $$AnswersTableCreateCompanionBuilder = AnswersCompanion Function({
  required String sessionId,
  required String questionId,
  required String selectedValue,
  required DateTime answeredAt,
  Value<int> rowid,
});
typedef $$AnswersTableUpdateCompanionBuilder = AnswersCompanion Function({
  Value<String> sessionId,
  Value<String> questionId,
  Value<String> selectedValue,
  Value<DateTime> answeredAt,
  Value<int> rowid,
});

class $$AnswersTableFilterComposer
    extends Composer<_$AppDatabase, $AnswersTable> {
  $$AnswersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedValue => $composableBuilder(
    column: $table.selectedValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AnswersTableOrderingComposer
    extends Composer<_$AppDatabase, $AnswersTable> {
  $$AnswersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedValue => $composableBuilder(
    column: $table.selectedValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AnswersTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnswersTable> {
  $$AnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get selectedValue => $composableBuilder(
    column: $table.selectedValue,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => column,
  );
}

class $$AnswersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AnswersTable,
          Answer,
          $$AnswersTableFilterComposer,
          $$AnswersTableOrderingComposer,
          $$AnswersTableAnnotationComposer,
          $$AnswersTableCreateCompanionBuilder,
          $$AnswersTableUpdateCompanionBuilder,
          (Answer, BaseReferences<_$AppDatabase, $AnswersTable, Answer>),
          Answer,
          PrefetchHooks Function()
        > {
  $$AnswersTableTableManager(_$AppDatabase db, $AnswersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> sessionId = const Value.absent(),
                Value<String> questionId = const Value.absent(),
                Value<String> selectedValue = const Value.absent(),
                Value<DateTime> answeredAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AnswersCompanion(
                sessionId: sessionId,
                questionId: questionId,
                selectedValue: selectedValue,
                answeredAt: answeredAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String sessionId,
                required String questionId,
                required String selectedValue,
                required DateTime answeredAt,
                Value<int> rowid = const Value.absent(),
              }) => AnswersCompanion.insert(
                sessionId: sessionId,
                questionId: questionId,
                selectedValue: selectedValue,
                answeredAt: answeredAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AnswersTable, Answer>(table),
                  BaseReferences<_$AppDatabase, $AnswersTable, Answer>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AnswersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AnswersTable,
      Answer,
      $$AnswersTableFilterComposer,
      $$AnswersTableOrderingComposer,
      $$AnswersTableAnnotationComposer,
      $$AnswersTableCreateCompanionBuilder,
      $$AnswersTableUpdateCompanionBuilder,
      (Answer, BaseReferences<_$AppDatabase, $AnswersTable, Answer>),
      Answer,
      PrefetchHooks Function()
    >;
typedef $$ResultsTableCreateCompanionBuilder = ResultsCompanion Function({
  required String sessionId,
  required double overallIndex,
  required String dimensionIndices,
  required String interpretationBand,
  required String contentVersion,
  required String scoringVersion,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$ResultsTableUpdateCompanionBuilder = ResultsCompanion Function({
  Value<String> sessionId,
  Value<double> overallIndex,
  Value<String> dimensionIndices,
  Value<String> interpretationBand,
  Value<String> contentVersion,
  Value<String> scoringVersion,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$ResultsTableFilterComposer
    extends Composer<_$AppDatabase, $ResultsTable> {
  $$ResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get overallIndex => $composableBuilder(
    column: $table.overallIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dimensionIndices => $composableBuilder(
    column: $table.dimensionIndices,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get interpretationBand => $composableBuilder(
    column: $table.interpretationBand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scoringVersion => $composableBuilder(
    column: $table.scoringVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $ResultsTable> {
  $$ResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get overallIndex => $composableBuilder(
    column: $table.overallIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dimensionIndices => $composableBuilder(
    column: $table.dimensionIndices,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get interpretationBand => $composableBuilder(
    column: $table.interpretationBand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scoringVersion => $composableBuilder(
    column: $table.scoringVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResultsTable> {
  $$ResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<double> get overallIndex => $composableBuilder(
    column: $table.overallIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dimensionIndices => $composableBuilder(
    column: $table.dimensionIndices,
    builder: (column) => column,
  );

  GeneratedColumn<String> get interpretationBand => $composableBuilder(
    column: $table.interpretationBand,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contentVersion => $composableBuilder(
    column: $table.contentVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get scoringVersion => $composableBuilder(
    column: $table.scoringVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ResultsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ResultsTable,
          Result,
          $$ResultsTableFilterComposer,
          $$ResultsTableOrderingComposer,
          $$ResultsTableAnnotationComposer,
          $$ResultsTableCreateCompanionBuilder,
          $$ResultsTableUpdateCompanionBuilder,
          (Result, BaseReferences<_$AppDatabase, $ResultsTable, Result>),
          Result,
          PrefetchHooks Function()
        > {
  $$ResultsTableTableManager(_$AppDatabase db, $ResultsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> sessionId = const Value.absent(),
                Value<double> overallIndex = const Value.absent(),
                Value<String> dimensionIndices = const Value.absent(),
                Value<String> interpretationBand = const Value.absent(),
                Value<String> contentVersion = const Value.absent(),
                Value<String> scoringVersion = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ResultsCompanion(
                sessionId: sessionId,
                overallIndex: overallIndex,
                dimensionIndices: dimensionIndices,
                interpretationBand: interpretationBand,
                contentVersion: contentVersion,
                scoringVersion: scoringVersion,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String sessionId,
                required double overallIndex,
                required String dimensionIndices,
                required String interpretationBand,
                required String contentVersion,
                required String scoringVersion,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ResultsCompanion.insert(
                sessionId: sessionId,
                overallIndex: overallIndex,
                dimensionIndices: dimensionIndices,
                interpretationBand: interpretationBand,
                contentVersion: contentVersion,
                scoringVersion: scoringVersion,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ResultsTable, Result>(table),
                  BaseReferences<_$AppDatabase, $ResultsTable, Result>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ResultsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ResultsTable,
      Result,
      $$ResultsTableFilterComposer,
      $$ResultsTableOrderingComposer,
      $$ResultsTableAnnotationComposer,
      $$ResultsTableCreateCompanionBuilder,
      $$ResultsTableUpdateCompanionBuilder,
      (Result, BaseReferences<_$AppDatabase, $ResultsTable, Result>),
      Result,
      PrefetchHooks Function()
    >;
typedef $$PlanProgressTableCreateCompanionBuilder =
    PlanProgressCompanion Function({
      required String sessionId,
      required int dayNumber,
      Value<bool> completed,
      Value<int> rowid,
    });
typedef $$PlanProgressTableUpdateCompanionBuilder =
    PlanProgressCompanion Function({
      Value<String> sessionId,
      Value<int> dayNumber,
      Value<bool> completed,
      Value<int> rowid,
    });

class $$PlanProgressTableFilterComposer
    extends Composer<_$AppDatabase, $PlanProgressTable> {
  $$PlanProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayNumber => $composableBuilder(
    column: $table.dayNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlanProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $PlanProgressTable> {
  $$PlanProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayNumber => $composableBuilder(
    column: $table.dayNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlanProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlanProgressTable> {
  $$PlanProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<int> get dayNumber =>
      $composableBuilder(column: $table.dayNumber, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);
}

class $$PlanProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlanProgressTable,
          PlanProgressData,
          $$PlanProgressTableFilterComposer,
          $$PlanProgressTableOrderingComposer,
          $$PlanProgressTableAnnotationComposer,
          $$PlanProgressTableCreateCompanionBuilder,
          $$PlanProgressTableUpdateCompanionBuilder,
          (
            PlanProgressData,
            BaseReferences<_$AppDatabase, $PlanProgressTable, PlanProgressData>,
          ),
          PlanProgressData,
          PrefetchHooks Function()
        > {
  $$PlanProgressTableTableManager(_$AppDatabase db, $PlanProgressTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlanProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlanProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlanProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> sessionId = const Value.absent(),
                Value<int> dayNumber = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlanProgressCompanion(
                sessionId: sessionId,
                dayNumber: dayNumber,
                completed: completed,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String sessionId,
                required int dayNumber,
                Value<bool> completed = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlanProgressCompanion.insert(
                sessionId: sessionId,
                dayNumber: dayNumber,
                completed: completed,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PlanProgressTable, PlanProgressData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $PlanProgressTable,
                    PlanProgressData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlanProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlanProgressTable,
      PlanProgressData,
      $$PlanProgressTableFilterComposer,
      $$PlanProgressTableOrderingComposer,
      $$PlanProgressTableAnnotationComposer,
      $$PlanProgressTableCreateCompanionBuilder,
      $$PlanProgressTableUpdateCompanionBuilder,
      (
        PlanProgressData,
        BaseReferences<_$AppDatabase, $PlanProgressTable, PlanProgressData>,
      ),
      PlanProgressData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AssessmentSessionsTableTableManager get assessmentSessions =>
      $$AssessmentSessionsTableTableManager(_db, _db.assessmentSessions);
  $$AnswersTableTableManager get answers =>
      $$AnswersTableTableManager(_db, _db.answers);
  $$ResultsTableTableManager get results =>
      $$ResultsTableTableManager(_db, _db.results);
  $$PlanProgressTableTableManager get planProgress =>
      $$PlanProgressTableTableManager(_db, _db.planProgress);
}
