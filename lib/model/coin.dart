// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  const Coin({
    required this.name,
    required this.priceInUSD,
    required this.imageUrl,
  });

  final String name;
  final double priceInUSD;
  final String imageUrl;

  @override
  List<Object> get props => [name, priceInUSD, imageUrl];
}
