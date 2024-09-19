part of 'broken_bloc.dart';

abstract class BrokenState {}

class BrokenInitial extends BrokenState {}

class BrokenLoadedState extends BrokenState {
  final List<Broken> brokens;
  BrokenLoadedState({required this.brokens});
}
