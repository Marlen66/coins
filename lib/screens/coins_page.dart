import 'dart:async';
import 'package:coins/bloc/list_bloc.dart';
import 'package:coins/repasitory/abstract_coins_repasitory.dart';
import 'package:coins/widgets/coin_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  final _coinsListBloc = CoinsListBloc(
    GetIt.I<AbsrtactCoinsRepository>(),
  );

  @override
  void initState() {
    _coinsListBloc.add(LoadCoinsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Coins',
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _coinsListBloc.add(LoadCoinsList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CoinsListBloc, CoinsListState>(
            bloc: _coinsListBloc,
            builder: (context, state) {
              if (state is CoinsListLoaded) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final coin = state.coinsList[index];
                    return CoinsListTile(coin: coin);
                  },
                );
              }
              if (state is CoinsListFailure) {
                return Center(
                  child: Column(
                    children: [
                      const Text('Something went wrong'),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: () {
                          _coinsListBloc.add(LoadCoinsList());
                        },
                        child: const Text('Try again'),
                      )
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )

        // _coinsList == null
        //     ? const Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     : ListView.separated(
        //         padding: const EdgeInsets.only(top: 16),
        //         itemCount: _coinsList!.length,
        //         separatorBuilder: (context, index) => const Divider(),
        //         itemBuilder: (context, index) {
        //           final coin = _coinsList![index];
        //           return CoinsListTile(coin: coin);
        //         },
        //       ),
        );
  }
}
