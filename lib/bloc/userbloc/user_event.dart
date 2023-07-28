import '../../model/user_model.dart';

abstract class UserEvent {}

class FetchUserDataEvent extends UserEvent {}

class AddUserEvent extends UserEvent {
  int index;

  AddUserEvent(this.index);
}
class RemoveUserEvent extends UserEvent {
  int index;

  RemoveUserEvent(this.index);
}

