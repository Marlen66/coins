// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_bloc.dart';

abstract class CoinsListEvent extends Equatable{}

class LoadCoinsList extends CoinsListEvent {
  LoadCoinsList({
    this.completer,
  });

  final Completer? completer;
  
  @override
  List<Object?> get props => [completer];
}
