import 'package:equatable/equatable.dart';

class MainEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ChangePageEvent extends MainEvent {
  final String page;

  ChangePageEvent({this.page});
}
