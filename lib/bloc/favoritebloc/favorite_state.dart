abstract class FavoriteState {}


class FavoriteLoadedState extends FavoriteState {}

class RemoveState extends FavoriteState {
  int index;

  RemoveState(this.index);
}