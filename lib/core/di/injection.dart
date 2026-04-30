import 'package:copado26/data/datasources/album_seeder.dart';
import 'package:copado26/data/datasources/hive_sticker_datasource.dart';
import 'package:copado26/data/repositories/sticker_repository_impl.dart';
import 'package:copado26/domain/repositories/sticker_repository.dart';
import 'package:copado26/domain/usecases/get_album_stats.dart';
import 'package:copado26/domain/usecases/scan_sticker_code.dart';
import 'package:copado26/presentation/blocs/album/album_bloc.dart';
import 'package:copado26/presentation/blocs/scanner/scanner_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  await Hive.initFlutter();
  final box = await Hive.openBox<Map<dynamic, dynamic>>(
    HiveStickerDatasource.boxName,
  );

  // Data
  sl.registerSingleton(HiveStickerDatasource(box));
  sl.registerSingleton(AlbumSeeder(sl<HiveStickerDatasource>()));
  sl.registerSingleton<StickerRepository>(
    StickerRepositoryImpl(sl<HiveStickerDatasource>()),
  );

  // Use cases
  sl.registerSingleton(ScanStickerCode(sl<StickerRepository>()));
  sl.registerSingleton(GetAlbumStats(sl<StickerRepository>()));

  // BLoCs
  sl.registerFactory(() => AlbumBloc(sl<StickerRepository>()));
  sl.registerFactory(() => ScannerBloc(sl<ScanStickerCode>()));
}
