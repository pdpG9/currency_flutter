import 'package:currency_flutter/core/hive/api_hive.dart';
import 'package:currency_flutter/core/hive/hive_base.dart';
import 'package:currency_flutter/core/network/api_base.dart';
import 'package:currency_flutter/core/network/currency_api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future setup() async {
  getIt.registerSingleton(HiveBase());
  await getIt.get<HiveBase>().init();
  getIt.registerFactory(() => ApiHive(getIt.get<HiveBase>().apiBox));

  getIt.registerSingleton(ApiBase(Dio(BaseOptions(
      baseUrl: "https://cbu.uz",
      connectTimeout: const Duration(seconds: 60)))));

  getIt.registerFactory(() => CurrencyApi(getIt.get()));
}
