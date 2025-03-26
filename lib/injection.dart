import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_flutter/injection.config.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => sl.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();
}