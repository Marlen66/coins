import 'package:coins/model/coin.dart';
import 'package:flutter/material.dart';

class CoinsListTile extends StatelessWidget {
  const CoinsListTile({
    super.key,
    required this.coin,
  });

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Image.network(coin.imageUrl),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coin.priceInUSD.toStringAsFixed(3)}\$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin,
        );
      },
    );
  }
}
