import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:petruk/model/location_model.dart';
import 'package:petruk/repository/firebase_repository.dart';
import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<LocationModel> dataList = List<LocationModel>();

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is LoadHomeEvent) {
      yield* _mapEventLoadHome(event);
    }
  }

  Stream<HomeState> _mapEventLoadHome(LoadHomeEvent event) async* {
    this.dataList.clear();
    yield InitialHomeState();
    yield HomeLoadingState();
    FirebaseLocationRepository locationRepository = FirebaseLocationRepository();
    List<LocationModel> result = await locationRepository.locations();
    this.dataList = result;
    yield HomeLoadedState();
  }
}
