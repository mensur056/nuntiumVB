abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeInProgress extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeFailure extends HomeState {
  final String messsage;
  HomeFailure(this.messsage);
}
