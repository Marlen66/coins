import 'package:coins/screens/coin_page.dart';
import 'package:coins/screens/coins_page.dart';
import 'package:coins/theme/theme.dart';
import 'package:flutter/material.dart';

class CoinsApp extends StatelessWidget {
  const CoinsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCoins',
      theme: themeData,
      routes: {
        '/': (context) => const CoinsPage(),
        '/coin': (context) => const CoinPage(),
      },
    );
  }
}
