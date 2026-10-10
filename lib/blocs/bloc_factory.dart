import 'package:game_console_flutter/repository/repository_factory.dart';
import 'package:shared/service_locator/index.dart';

class BlocFactory extends ServiceLocator {
  static final instance = BlocFactory();

  Future<void> initialize() {
    return RepositoryFactory.instance.initialize();
  }
}
