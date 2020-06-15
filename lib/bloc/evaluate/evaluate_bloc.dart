import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:petruk/model/question_model.dart';
import 'package:petruk/repository/firebase_repository.dart';
import './bloc.dart';

class EvaluateBloc extends Bloc<EvaluateEvent, EvaluateState> {
  List<QuestionModel> listQuestion = List<QuestionModel>();
  int counter = 1;
  int counter2 = 1;
  int score = 0;
  int maxQuestion = 0;
  bool showHint = false;

  @override
  EvaluateState get initialState => InitialEvaluateState();

  @override
  Stream<EvaluateState> mapEventToState(
    EvaluateEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is LoadQuestionEvent) {
      yield* _mapEventLoadQuestion();
    } else if (event is NextQuestionEvent) {
      yield* _mapEventNextQuestion();
    } else if (event is SubmitAnswerEvent) {
      yield* _mapEventSubmitAnswer(event);
    }
  }

  Stream<EvaluateState> _mapEventLoadQuestion() async* {
    this.listQuestion.clear();
    yield InitialEvaluateState();

    FirebaseLocationRepository firebaseLocationRepository = FirebaseLocationRepository();
    this.listQuestion = await firebaseLocationRepository.evaluation();
    this.maxQuestion = this.listQuestion.length;

    yield QuestionLoadedState();
  }

  Stream<EvaluateState> _mapEventSubmitAnswer(SubmitAnswerEvent event) async* {
    yield InitialEvaluateState();
    if (event.answer.compareTo(listQuestion[counter - 1].JAWABAN) == 0) {
      this.score += 10;
      this.counter2++;
      this.showHint = true;
      yield AnswerCorrectState();
    } else {
      this.counter2++;
      this.showHint = true;
      yield AnswerWrongState();
    }
  }

  Stream<EvaluateState> _mapEventNextQuestion() async* {
    yield InitialEvaluateState();
    this.showHint = false;
    if (this.counter <= this.maxQuestion) {
      this.counter++;
    }
    yield NextQuestionLoadedState();
  }
}
