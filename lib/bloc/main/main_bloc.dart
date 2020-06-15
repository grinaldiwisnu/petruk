import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  @override
  MainState get initialState => InitialMainState();

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is ChangePageEvent) {
      yield* _mapEventChangePage(event);
    }
  }

  Stream<MainState> _mapEventChangePage(ChangePageEvent event) async* {
    yield InitialMainState();
    if (event.page == "HOME") {
      yield HomePageState();
    } else if (event.page == "MAP") {
      yield MapPageState();
    } else if (event.page == "EVALUATE") {
      yield EvaluatePageState();
    } else if (event.page == "ABOUT") {
      yield AboutPageState();
    }
  }
}
