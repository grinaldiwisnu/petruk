import 'package:equatable/equatable.dart';

class SitationState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialSitationState extends SitationState {}

class SitationLoadedState extends SitationState {}

class SitationErrorState extends SitationState {}
