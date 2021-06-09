import 'package:flutter/cupertino.dart';
import '/model/scoring.dart';
import 'answers.dart';
import 'questions.dart';

class UserAnswers extends ChangeNotifier {
  List<Answers> answersCollection = [
    Answers(
        score: null,
        questions: Questions(
            index: 0, question: 'I love food.', topic: 'Enjoyment of Food')),
    Answers(
      score: null,
      questions: Questions(
          index: 1, question: 'I enjoy eating.', topic: 'Enjoyment of Food'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 2,
          question: 'I look forward to mealtimes.',
          topic: 'Enjoyment of Food'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 3,
          question: "I eat more when I'm annoyed.",
          topic: 'Emotional Over-Eating'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 4,
          question: "I eat more when I'm worried.",
          topic: 'Emotional Over-Eating'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 5,
          question: "I eat more when I'm upset.",
          topic: 'Emotional Over-Eating'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 6,
          question: 'I eat more when I’m anxious.',
          topic: 'Emotional Over-Eating'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 7,
          question: "I eat more when I'm angry.",
          topic: 'Emotional Over-Eating'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 8,
          question: "I eat less when I'm worried.",
          topic: 'Emotional Under-Eating'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 9,
          question: "I eat less when I'm angry.",
          topic: 'Emotional Under-Eating'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 10,
          question: "I eat less when I'm upset.",
          topic: 'Emotional Under-Eating'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 11,
          question: 'I eat less when I’m anxious.',
          topic: 'Emotional Under-Eating'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 12,
          question:
              'I often decide that I don’t like a food, before tasting it.',
          topic: 'Food Fussiness'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 13,
          question: 'I refuse new foods at first.',
          topic: 'Food Fussiness'),
    ),

    Answers(
      score: null,
      questions: Questions(
          index: 14,
          question: 'I do not enjoy trying new foods.',
          topic: 'Food Fussiness'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 15,
          question:
              'I am not interested in tasting new food I haven’t tasted before.',
          topic: 'Food Fussiness'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 16,
          question: 'I do not enjoy a wide variety of foods.',
          topic: 'Food Fussiness'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 17,
          question: 'I often feel hungry when I am with someone who is eating.',
          topic: 'Food Responsiveness'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 18,
          question: 'Given the choice, I would eat most of the time.',
          topic: 'Food Responsiveness'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 19,
          question: 'I am always thinking about food.',
          topic: 'Food Responsiveness'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 20,
          question: 'I do not finish my meals quickly.',
          topic: 'Slowness in Eating'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 21,
          question: 'I am often last at finishing a meal.',
          topic: 'Slowness in Eating'),
    ),

    Answers(
      score: null,
      questions: Questions(
          index: 22,
          question: 'I eat more and more slowly during a meal.',
          topic: 'Slowness in Eating'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 23,
          question: "I eat less when I'm annoyed.",
          topic: 'Slowness in Eating'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 24, question: 'I eat slowly.', topic: 'Slowness in Eating'),
    ),

//Hunger
    Answers(
      score: null,
      questions: Questions(
          index: 25,
          question: 'I often notice my stomach rumbling.',
          topic: 'Hunger'),
    ),

    Answers(
      score: null,
      questions: Questions(
          index: 26,
          question: 'If I miss a meal, will I get irritable.',
          topic: 'Hunger'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 27,
          question:
              'I often feel so hungry that I must eat something right away.',
          topic: 'Hunger'),
    ),

    Answers(
      score: null,
      questions: Questions(
          index: 28, question: 'I often feel hungry.', topic: 'Hunger'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 29,
          question: 'If my meals are delayed, I get light-headed.',
          topic: 'Hunger'),
    ),

//Satiety Responsiveness
    Answers(
      score: null,
      questions: Questions(
          index: 30,
          question: 'I often leave food on my plate at the end of a meal.',
          topic: 'Satiety Responsiveness'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 31,
          question: 'I often get full before my meal is finished.',
          topic: 'Satiety Responsiveness'),
    ),

    Answers(
      score: null,
      questions: Questions(
          index: 32,
          question: 'I cannot eat a meal if I had a snack just before.',
          topic: 'Satiety Responsiveness'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 33,
          question: 'I get full up easily.',
          topic: 'Satiety Responsiveness'),
    ),
    Answers(
      score: null,
      questions: Questions(
          index: 34,
          question:
              'When I see or smell food that I like, it makes me want to eat.',
          topic: 'Satiety Responsiveness'),
    ),
  ];

  void setAnswers(String question, Scoring score) {
    answersCollection
        .firstWhere((element) => element.questions.question == question)
        .score = score;
    notifyListeners();
  }

  bool nextpage(String topic) {
    var userAnswersAll = true;
    for (final answers in answersCollection
        .where((element) => element.questions.topic == topic)) {
      if (answers.score == null) {
        userAnswersAll = false;
        break;
      }
    }
    return userAnswersAll;
  }

  String aebqResults(int order) {
    switch (order) {
      case 0:
        {
          var score = 0;
          final topicAnswers = answersCollection
              .where(
                  (element) => element.questions.topic == 'Enjoyment of Food')
              .toList();
          for (final answers in topicAnswers) {
            score += answers.score.score;
          }
          return score >= 8 ? 'Present' : 'Absent';
        }
      case 1:
        {
          var score = 0;
          final topicAnswers = answersCollection
              .where((element) =>
                  element.questions.topic == 'Emotional Over-Eating')
              .toList();
          for (final answers in topicAnswers) {
            score += answers.score.score;
          }
          return score > 12 ? 'Present' : 'Absent';
        }
      case 2:
        {
          var score = 0;
          final topicAnswers = answersCollection
              .where((element) =>
                  element.questions.topic == 'Emotional Under-Eating')
              .toList();
          for (final answers in topicAnswers) {
            score += answers.score.score;
          }
          return score > 12 ? 'Present' : 'Absent';
        }
      case 3:
        {
          var score = 0;
          final topicAnswers = answersCollection
              .where((element) => element.questions.topic == 'Food Fussiness')
              .toList();
          for (final answers in topicAnswers) {
            score += answers.score.score;
          }
          return score > 12 ? 'Present' : 'Absent';
        }
      case 4:
        {
          var score = 0;
          final topicAnswers = answersCollection
              .where(
                  (element) => element.questions.topic == 'Food Responsiveness')
              .toList();
          for (final answers in topicAnswers) {
            score += answers.score.score;
          }
          return score >= 10 ? 'Present' : 'Absent';
        }
      case 5:
        {
          var score = 0;
          final topicAnswers = answersCollection
              .where(
                  (element) => element.questions.topic == 'Slowness in Eating')
              .toList();
          for (final answers in topicAnswers) {
            score += answers.score.score;
          }
          return score >= 10 ? 'Present' : 'Absent';
        }
      case 6:
        {
          var score = 0;
          final topicAnswers = answersCollection
              .where((element) => element.questions.topic == 'Hunger')
              .toList();
          for (final answers in topicAnswers) {
            score += answers.score.score;
          }
          return score > 12 ? 'Present' : 'Absent';
        }
      case 7:
        {
          var score = 0;
          final topicAnswers = answersCollection
              .where((element) =>
                  element.questions.topic == 'Satiety Responsiveness')
              .toList();
          for (final answers in topicAnswers) {
            score += answers.score.score;
          }
          return score >=10 ? 'Present' : 'Absent';
        }
    }
  }
}
