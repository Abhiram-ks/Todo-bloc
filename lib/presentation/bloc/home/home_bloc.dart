import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(BottomSheetHiddenState()){
     on<ShowBottomSheetEvent>((event, emit) {
      emit(BottomSheetVisibleState());
     });
     on<HideBottomSheetEvent>((event, emit){
      emit(BottomSheetHiddenState());
     });
  }


  Stream<HomeState> mapEventTostate(HomeEvent event) async* {
    if (event is ShowBottomSheetEvent) {
      yield BottomSheetVisibleState();
    } else if(event is HideBottomSheetEvent){
      yield BottomSheetHiddenState();
    }
  }
}


