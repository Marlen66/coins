import 'package:dio/dio.dart';
import 'package:coins/model/coin.dart';
import 'package:coins/repasitory/abstract_coins_repasitory.dart';

class CoinRepasitory implements AbsrtactCoinsRepository {
  CoinRepasitory({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<Coin>> getCoinsList() async {
    final response = await dio.get( 
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,TYC,WETH,SOL,TRX,&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinsList = dataRaw.entries.map(
      (e) {
        final usdData =
            (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
        final price = usdData['PRICE'];
        final imageUrl = usdData['IMAGEURL'];
        return Coin(
          name: e.key,
          priceInUSD: price,
          imageUrl: 'https://www.cryptocompare.com/$imageUrl',
        );
      },
    ).toList();

    return coinsList;
  }
}
