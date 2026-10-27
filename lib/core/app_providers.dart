import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'db/app_database.dart';
import 'repositories/wedly_repository.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final repositoryProvider = Provider<WedlyRepository>(
  (ref) => DriftWedlyRepository(ref.watch(databaseProvider)),
);

final weddingStreamProvider = StreamProvider(
  (ref) => ref.watch(repositoryProvider).watchWedding(),
);
