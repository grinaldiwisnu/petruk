import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:petruk/model/sitation_model.dart';
import 'package:petruk/repository/firebase_repository.dart';
import './bloc.dart';

class SitationBloc extends Bloc<SitationEvent, SitationState> {
  @override
  SitationState get initialState => InitialSitationState();

  List<SitationModel> listSitation = List<SitationModel>();

  @override
  Stream<SitationState> mapEventToState(
    SitationEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is LoadSitationEvent) {
      yield* _mapEventLoadSitation(event);
    }
  }

  Stream<SitationState> _mapEventLoadSitation(LoadSitationEvent event) async* {
    this.listSitation.clear();
    yield InitialSitationState();
    FirebaseLocationRepository locationRepository = FirebaseLocationRepository();
    List<SitationModel> result = await locationRepository.sitation();
    this.listSitation = result;

    yield SitationLoadedState();
  }
}
