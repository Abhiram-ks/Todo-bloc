part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ShowBottomSheetEvent extends HomeEvent{}
class HideBottomSheetEvent extends HomeEvent {}
