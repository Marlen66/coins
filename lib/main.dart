import 'package:coins/coins_app.dart';
import 'package:coins/repasitory/abstract_coins_repasitory.dart';
import 'package:coins/repasitory/coin_repasitory.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<AbsrtactCoinsRepository>(
      () => CoinRepasitory(dio: Dio()));
  runApp(const CoinsApp());
}
