import 'package:blocproject/bloc/favoritebloc/favorite_event.dart';
import 'package:blocproject/bloc/favoritebloc/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/variables.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteLoadedState()) {
    on<RemoveEvent>((event, emit) => removeFromFavorite(event, emit));
  }

  removeFromFavorite(RemoveEvent event, Emitter<FavoriteState> emit) {

    favoriteList.remove(userData[event.index]);

    print('Remove from FavoriteList ${event.index}');

    emit(RemoveState(event.index));emit(FavoriteLoadedState());

    favoriteCount = favoriteList.length.toString();
  }
}
