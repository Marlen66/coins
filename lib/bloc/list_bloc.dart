import 'dart:async';

import 'package:coins/model/coin.dart';
import 'package:coins/repasitory/abstract_coins_repasitory.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_event.dart';
part 'list_state.dart';

class CoinsListBloc extends Bloc<CoinsListEvent, CoinsListState> {
  CoinsListBloc(this.coinsRepository) : super(CoinsListInitial()) {
    on<LoadCoinsList>((event, emit) async {
      try {
        emit(CoinsListLoading());
        final coinsList = await coinsRepository.getCoinsList();
        emit(CoinsListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CoinsListFailure(error: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbsrtactCoinsRepository coinsRepository;
}
