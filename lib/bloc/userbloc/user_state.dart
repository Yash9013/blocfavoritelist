import '../../model/user_model.dart';

abstract class UserState {}

class UserDataLoadingState extends UserState {}

class UserDataSuccessState extends UserState {
  List<UserModel> userData;

  UserDataSuccessState(this.userData);
}

class UserDataErrorState extends UserState {
  String errorMessage;

  UserDataErrorState(this.errorMessage);
}

class UserAddState extends UserState {
  int index;

  UserAddState(this.index);
}

class UserRemoveState extends UserState {
  int index;

  UserRemoveState(this.index);
}

class UserFavoriteRemoveState extends UserState {
  int index;

  UserFavoriteRemoveState(this.index);
}
