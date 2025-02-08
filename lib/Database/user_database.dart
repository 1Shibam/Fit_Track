import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final userDatabaseProvider = FutureProvider((ref) async {
  final dbPath = await getApplicationDocumentsDirectory();
  String path = join(dbPath.path, 'fit.db');

  Database database = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) {
      db.execute('''
CREATE TABLE fitTrack( userName TEXT, userEmal TEXT, userAge REAL, userWeight REAL, userHeight REAL)


''');
    },
  );
});
