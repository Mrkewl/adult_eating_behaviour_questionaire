// ignore: file_names

import 'questions.dart';
import 'scoring.dart';

// ignore: camel_case_types
class AEBQ_Question {
  List<Questions> aebqQuestions = [
    //Enjoyment of food
    Questions(index: 0, question: 'I love food.', topic: 'Enjoyment of Food'),
    Questions(
        index: 1, question: 'I enjoy eating.', topic: 'Enjoyment of Food'),
    Questions(
        index: 2,
        question: 'I look forward to mealtimes.',
        topic: 'Enjoyment of Food'),
//Emotional Over-Eating
    Questions(
        index: 3,
        question: "I eat more when I'm annoyed.",
        topic: 'Emotional Over-Eating'),
    Questions(
        index: 4,
        question: "I eat more when I'm worried.",
        topic: 'Emotional Over-Eating'),
    Questions(
        index: 5,
        question: "I eat more when I'm upset.",
        topic: 'Emotional Over-Eating'),
    Questions(
        index: 6,
        question: 'I eat more when I’m anxious.',
        topic: 'Emotional Over-Eating'),
    Questions(
        index: 7,
        question: "I eat more when I'm angry.",
        topic: 'Emotional Over-Eating'),
    //Emotional undereating
    Questions(
        index: 8,
        question: "I eat less when I'm worried.",
        topic: 'Emotional Under-Eating'),
    Questions(
        index: 9,
        question: "I eat less when I'm angry.",
        topic: 'Emotional Under-Eating'),
    Questions(
        index: 10,
        question: "I eat less when I'm upset.",
        topic: 'Emotional Under-Eating'),
    Questions(
        index: 11,
        question: 'I eat less when I’m anxious.',
        topic: 'Emotional Under-Eating'),
    //Food Fussiness
    Questions(
        index: 12,
        question: 'I often decide that I don’t like a food, before tasting it.',
        topic: 'Food Fussiness'),
    Questions(
        index: 13,
        question: 'I refuse new foods at first.',
        topic: 'Food Fussiness'),
    Questions(
        index: 14,
        question: 'I do not enjoy trying new foods.',
        topic: 'Food Fussiness'),
    Questions(
        index: 15,
        question:
            'I am not interested in tasting new food I haven’t tasted before.',
        topic: 'Food Fussiness'),
    Questions(
        index: 16,
        question: 'I do not enjoy a wide variety of foods.',
        topic: 'Food Fussiness'),
    //Food Responsiveness
    Questions(
        index: 17,
        question: 'I often feel hungry when I am with someone who is eating.',
        topic: 'Food Responsiveness'),
    Questions(
        index: 18,
        question: 'Given the choice, I would eat most of the time.',
        topic: 'Food Responsiveness'),
    Questions(
        index: 19,
        question: 'I am always thinking about food.',
        topic: 'Food Responsiveness'),
    //Slowness in Eating
    Questions(
        index: 20,
        question: 'I do not finish my meals quickly.',
        topic: 'Slowness in Eating'),
    Questions(
        index: 21,
        question: 'I am often last at finishing a meal.',
        topic: 'Slowness in Eating'),
    Questions(
        index: 22,
        question: 'I eat more and more slowly during a meal.',
        topic: 'Slowness in Eating'),
    Questions(
        index: 23,
        question: "I eat less when I'm annoyed.",
        topic: 'Slowness in Eating'),
    Questions(
        index: 24, question: 'I eat slowly.', topic: 'Slowness in Eating'),
//Hunger
    Questions(
        index: 25,
        question: 'I often notice my stomach rumbling.',
        topic: 'Hunger'),
    Questions(
        index: 26,
        question: 'If I miss a meal, will I get irritable.',
        topic: 'Hunger'),
    Questions(
        index: 27,
        question:
            'I often feel so hungry that I must eat something right away.',
        topic: 'Hunger'),
    Questions(index: 28, question: 'I often feel hungry.', topic: 'Hunger'),
    Questions(
        index: 29,
        question: 'If my meals are delayed, I get light-headed.',
        topic: 'Hunger'),
//Satiety Responsiveness
    Questions(
        index: 30,
        question: 'I often leave food on my plate at the end of a meal.',
        topic: 'Satiety Responsiveness'),
    Questions(
        index: 31,
        question: 'I often get full before my meal is finished.',
        topic: 'Satiety Responsiveness'),
    Questions(
        index: 32,
        question: 'I cannot eat a meal if I had a snack just before.',
        topic: 'Satiety Responsiveness'),
    Questions(
        index: 33,
        question: 'I get full up easily.',
        topic: 'Satiety Responsiveness'),
    Questions(
        index: 34,
        question:
            'When I see or smell food that I like, it makes me want to eat.',
        topic: 'Satiety Responsiveness'),
  ];
  Iterable<Questions> listQuestions(int order) {
    switch (order) {
      case 0:
        return aebqQuestions
            .where((element) => element.topic == 'Enjoyment of Food');
      case 1:
        return aebqQuestions
            .where((element) => element.topic == 'Emotional Over-Eating');
      case 2:
        return aebqQuestions
            .where((element) => element.topic == 'Emotional Under-Eating');
      case 3:
        return aebqQuestions
            .where((element) => element.topic == 'Food Fussiness');
      case 4:
        return aebqQuestions
            .where((element) => element.topic == 'Food Responsiveness');
      case 5:
        return aebqQuestions
            .where((element) => element.topic == 'Slowness in Eating');
      case 6:
        return aebqQuestions.where((element) => element.topic == 'Hunger');
      case 7:
        return aebqQuestions
            .where((element) => element.topic == 'Satiety Responsiveness');
    }
  }

  String questionsTopics(int order) {
    String topic;
    switch (order) {
      case 0:
        return topic = 'Enjoyment of Food';
      case 1:
        return topic = 'Emotional Over-Eating';
      case 2:
        return topic = 'Emotional Under-Eating';
      case 3:
        return topic = 'Food Fussiness';
      case 4:
        return topic = 'Food Responsiveness';
      case 5:
        return topic = 'Slowness in Eating';
      case 6:
        return topic = 'Hunger';
      case 7:
        return topic = 'Satiety Responsiveness';
    }
    return topic;
  }

  List<Scoring> standardScoring = [
    const Scoring(choices: 'Strongly Agree', score: 5),
    const Scoring(choices: 'Agree', score: 4),
    const Scoring(choices: 'Neutral', score: 3),
    const Scoring(choices: 'Disagree', score: 2),
    const Scoring(choices: 'Strongly Disagree', score: 1),
  ];

}
