import 'package:equatable/equatable.dart';

class EvaluateEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadQuestionEvent extends EvaluateEvent {}

class SubmitAnswerEvent extends EvaluateEvent {
  final String answer;

  SubmitAnswerEvent({this.answer});
}

class NextQuestionEvent extends EvaluateEvent {}
