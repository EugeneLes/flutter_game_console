import 'package:shared/service_locator/index.dart';
import 'package:shared/storage/index.dart';

class RepositoryFactory extends ServiceLocator {
  static final instance = RepositoryFactory();

  Future<void> initialize() async {
    registerLazySingleton<SharedStorage>(SharedStorageImpl.new);
    await get<SharedStorage>().init();
  }
}
