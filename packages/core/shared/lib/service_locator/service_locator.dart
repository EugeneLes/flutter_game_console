//please use service locator abstraction, and do not use T call<T> ()
// to locate some instance, due to the following issue:
//https://github.com/dart-lang/sdk/issues/43814
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

abstract class ServiceLocator {
  static final getIt = GetIt.I;

  T get<T extends Object>({String? instanceName}) => getIt.get<T>(instanceName: instanceName);

  T getWithParam<T extends Object, P extends Object>({String? instanceName, P? param}) =>
      getIt.get<T>(instanceName: instanceName, param1: param);

  @mustCallSuper
  Future<void> reset() {
    return getIt.reset();
  }

  @visibleForTesting
  @protected
  void registerFactory<T extends Object>(ValueGetter<T> factoryFunc, {String? instanceName}) {
    getIt.registerFactory(factoryFunc, instanceName: instanceName);
  }

  @visibleForTesting
  @protected
  void registerLazySingleton<T extends Object>(
    ValueGetter<T> factoryFunc, {
    DisposingFunc<T>? dispose,
  }) {
    getIt.registerLazySingleton(factoryFunc, dispose: dispose);
  }

  @visibleForTesting
  @protected
  void registerLazySingletonAsync<T extends Object>(
    AsyncValueGetter<T> factoryFunc, {
    DisposingFunc<T>? dispose,
    String? instanceName,
  }) {
    getIt.registerLazySingletonAsync(factoryFunc, dispose: dispose, instanceName: instanceName);
  }

  @visibleForTesting
  @protected
  void registerFactoryParam<T extends Object, P1, P2>(
    T Function(P1?, P2?) factoryFunc, {
    String? instanceName,
  }) {
    getIt.registerFactoryParam(factoryFunc, instanceName: instanceName);
  }

  @visibleForTesting
  @protected
  void registerLazySingletonWithSubtype<T extends Object, T1 extends T>(
    FactoryFunc<T1> factoryFunc,
  ) {
    getIt.registerLazySingleton<T1>(factoryFunc);
    getIt.registerLazySingleton<T>(get<T1>);
  }

  @visibleForTesting
  @protected
  void registerFactoryWithSubtype<T extends Object, T1 extends T>(FactoryFunc<T1> factoryFunc) {
    getIt.registerFactory<T1>(factoryFunc);
    getIt.registerFactory<T>(get<T1>);
  }

  bool isRegistered<T extends Object>({Object? instance, String? instanceName}) {
    return getIt.isRegistered<T>(instance: instance, instanceName: instanceName);
  }

  Future<void> isReady<T extends Object>({Object? instance, String? instanceName}) {
    return getIt.isReady<T>(instance: instance, instanceName: instanceName);
  }

  bool isReadySync<T extends Object>({Object? instance, String? instanceName}) {
    return getIt.isReadySync<T>(instance: instance, instanceName: instanceName);
  }
}
