part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class BottomSheetVisibleState extends HomeState{}
class BottomSheetHiddenState extends HomeState {}
class TodoListLoadedState  extends HomeState {
  final List<TodoModel> todos;
  TodoListLoadedState(this.todos);
}

