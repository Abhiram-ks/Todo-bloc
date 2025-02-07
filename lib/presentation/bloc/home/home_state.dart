part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class BottomSheetVisibleState extends HomeState{}
class BottomSheetHiddenState extends HomeState {}
