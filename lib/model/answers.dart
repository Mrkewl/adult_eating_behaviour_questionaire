import 'package:flutter/material.dart';
import '/model/questions.dart';
import '/model/scoring.dart';

class Answers {
  Answers(
      {@required this.questions, @required this.score});
  Questions questions;
 
  Scoring score;
}
