import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

part 'app_database.g.dart';

class AssessmentSessions extends Table {
  TextColumn get id => text()();
  TextColumn get assessmentType => text()(); // quick | full
  TextColumn get status => text()(); // in_progress | completed | abandoned
  TextColumn get contentVersion => text()();
  TextColumn get scoringVersion => text()();
  TextColumn get localeAtStart => text()();
  IntColumn get currentIndex => integer().withDefault(const Constant(0))();
  IntColumn get schemaVersion => integer().withDefault(const Constant(1))();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Answers extends Table {
  TextColumn get sessionId => text()();
  TextColumn get questionId => text()();
  TextColumn get selectedValue => text()();
  DateTimeColumn get answeredAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {sessionId, questionId};
}

class Results extends Table {
  TextColumn get sessionId => text()();
  RealColumn get overallIndex => real()();
  /// JSON object: {"SA": 87.5, "SR": ..., "SO": ..., "RM": ...}
  TextColumn get dimensionIndices => text()();
  TextColumn get interpretationBand => text()();
  TextColumn get contentVersion => text()();
  TextColumn get scoringVersion => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {sessionId};
}

class PlanProgress extends Table {
  TextColumn get sessionId => text()();
  IntColumn get dayNumber => integer()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {sessionId, dayNumber};
}

@DriftDatabase(tables: [AssessmentSessions, Answers, Results, PlanProgress])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  /// Production database in the app documents directory (on device only).
  static Future<AppDatabase> open() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'eq_test.sqlite'));
    return AppDatabase(NativeDatabase.createInBackground(file));
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        // Future schema changes must add explicit, tested migration steps.
        // Never drop user data silently (SRS-F-052).
        onUpgrade: (m, from, to) async {
          throw UnsupportedError('No migration path from $from to $to');
        },
      );

  /// Removes every assessment session, answer, result and plan record.
  /// Purchase entitlement is stored by Apple and is not touched here.
  Future<void> deleteAllAssessmentData() => transaction(() async {
        await delete(planProgress).go();
        await delete(results).go();
        await delete(answers).go();
        await delete(assessmentSessions).go();
      });
}
