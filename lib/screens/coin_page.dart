import 'package:flutter/material.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({super.key});

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  String? coinName2;

  @override
  void didChangeDependencies() {
    final arg = ModalRoute.of(context)?.settings.arguments;
    assert(arg != null && arg is String, 'You must provide string args');
    coinName2 = arg as String;
    setState(() {});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName2!),
      ),
    );
  }
}
