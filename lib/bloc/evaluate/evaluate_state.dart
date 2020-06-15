import 'package:equatable/equatable.dart';

class EvaluateState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialEvaluateState extends EvaluateState {}

class QuestionLoadedState extends EvaluateState {}

class NextQuestionLoadedState extends EvaluateState {}

class AnswerWrongState extends EvaluateState {}

class AnswerCorrectState extends EvaluateState {}
