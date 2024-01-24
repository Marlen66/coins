// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_bloc.dart';

abstract class CoinsListState extends Equatable{}

class CoinsListInitial extends CoinsListState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CoinsListLoading extends CoinsListState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CoinsListLoaded extends CoinsListState {
  CoinsListLoaded({
    required this.coinsList,
  });

  final List<Coin> coinsList;
  
  @override
  List<Object?> get props => [coinsList];
}

class CoinsListFailure extends CoinsListState {
   CoinsListFailure({
    required this.error,
  });

  final Object? error;
  
  @override
  List<Object?> get props => [error];
 
}
