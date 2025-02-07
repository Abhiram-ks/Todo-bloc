part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

class SplashAnimating extends SplashState {
  final double animationValue;
  SplashAnimating(this.animationValue);
}

final class SplashCompledState extends SplashState {}