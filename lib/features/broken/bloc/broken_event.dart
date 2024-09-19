part of 'broken_bloc.dart';

abstract class BrokenEvent {}

class GetBrokenEvent extends BrokenEvent {}

class AddBrokenEvent extends BrokenEvent {
  final Broken broken;
  AddBrokenEvent({required this.broken});
}

class EditBrokenEvent extends BrokenEvent {
  final int id;
  final bool done;
  EditBrokenEvent({
    required this.id,
    required this.done,
  });
}

class DeleteBrokenEvent extends BrokenEvent {
  final int id;
  DeleteBrokenEvent({required this.id});
}
