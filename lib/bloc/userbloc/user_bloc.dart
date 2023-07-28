// ignore_for_file: iterable_contains_unrelated_type

import 'package:blocproject/bloc/userbloc/user_event.dart';
import 'package:blocproject/bloc/userbloc/user_state.dart';
import 'package:blocproject/model/user_model.dart';
import 'package:blocproject/utils/variables.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/constants.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserDataLoadingState()) {
    on<FetchUserDataEvent>((event, emit) => fetchUserData(event, emit));
    on<AddUserEvent>((event, emit) => addToFavorite(event, emit));
    // on<RemoveUserEvent>((event, emit) => removeFromFavorite(event, emit));
  }

  fetchUserData(FetchUserDataEvent event, Emitter<UserState> emit) async {
    userData = await repository.fetchUsers();

    if (userData.isNotEmpty) {
      emit(UserDataSuccessState(userData));
    } else {
      emit(UserDataErrorState('Unable to fetch Data'));
    }
  }

  addToFavorite(AddUserEvent event, Emitter<UserState> emit) {
    if (favoriteList.contains(userData[event.index])) {
      favoriteList.remove(userData[event.index]);

      print('Remove from FavoriteList ${event.index}');
      emit(UserRemoveState(event.index));
      favoriteCount = favoriteList.length.toString();
    } else {
      favoriteList.add(userData[event.index]);
      print('Add To FavoriteList ${event.index}');
      emit(UserAddState(event.index));
      favoriteCount = favoriteList.length.toString();
    }
  }

  // removeFromFavorite(RemoveUserEvent event, Emitter<UserState> emit) {
  //   favoriteList.remove(userData[event.index]);
  //
  //   print('Remove from FavoriteList ${event.index}');
  //
  //   emit(UserFavoriteRemoveState(event.index));
  //   emit(UserDataLoadingState());
  //   favoriteCount = favoriteList.length.toString();
  // }
}
