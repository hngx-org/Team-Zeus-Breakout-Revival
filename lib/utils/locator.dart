import 'package:get_it/get_it.dart';
import 'package:zeus_breakout_rivival/service/hive_service.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<HiveService>(
    () => HiveService(),
  );
}

final hiveService = GetIt.I.get<HiveService>();
