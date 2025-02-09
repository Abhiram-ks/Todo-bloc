part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ShowBottomSheetEvent extends HomeEvent{}
class HideBottomSheetEvent extends HomeEvent {}
class FetchTodosEvent extends HomeEvent {}
class DeleteTodoEvent extends HomeEvent{
  final String id;
  DeleteTodoEvent(this.id);
}