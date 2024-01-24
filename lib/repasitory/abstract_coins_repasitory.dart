import 'package:coins/model/coin.dart';

abstract class AbsrtactCoinsRepository {
  Future<List<Coin>> getCoinsList();
}
