abstract class FavoriteEvent {}

class RemoveEvent extends FavoriteEvent {
  int index;

  RemoveEvent(this.index);
}
