
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
   on<StartSplashEvent>(_onStartSplash);
  }
}

Future<void> _onStartSplash(StartSplashEvent event, Emitter<SplashState> emit) async{
  const duration = Duration(seconds:2);
  final startTime = DateTime.now();


  while (DateTime.now().difference(startTime) < duration) {
    final elaped = DateTime.now().difference(startTime).inMilliseconds;
    final process = elaped / duration.inMilliseconds;
    emit(SplashAnimating(process));
    await Future.delayed(const Duration(milliseconds: 16));
  }

  emit(SplashCompledState());
}
