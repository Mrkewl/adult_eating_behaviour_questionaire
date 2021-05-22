import 'package:adult_eating_behaviour_questionaire/model/AEBQ_model.dart';
import 'package:adult_eating_behaviour_questionaire/model/questions.dart';
import 'package:adult_eating_behaviour_questionaire/model/user_answers.dart';
import 'package:adult_eating_behaviour_questionaire/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Questionaire extends StatefulWidget {
  @override
  _QuestionaireState createState() => _QuestionaireState();
}

class _QuestionaireState extends State<Questionaire> {
  final AEBQ_Question questions = AEBQ_Question();

  int selectedQuestion;

  int selectedIndex = 0;

  ScrollPhysics scrollPhysics;

  Questions questionIndex;

  @override
  Widget build(BuildContext context) {
    final userAnswers = Provider.of<UserAnswers>(context, listen: true);
    return Scaffold(
        body: SingleChildScrollView(
      physics: scrollPhysics,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            ListView.builder(
              physics: ScrollPhysics(parent: scrollPhysics),
              shrinkWrap: true,
              itemCount: questions.listQuestions(selectedIndex).length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        questions.listQuestions(selectedIndex)
                            .elementAt(index)
                            .question,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: ListView.builder(
                        physics: ScrollPhysics(parent: scrollPhysics),
                        shrinkWrap: true,
                        itemBuilder: (context, index2) => GestureDetector(
                          onTap: () {
                            userAnswers.setAnswers(
                                questions.listQuestions(selectedIndex)
                                    .elementAt(index)
                                    .question,
                                questions.standardScoring[index2].choices);
                            // userAnswers.answersCollection[index].answers =
                            //     questions.standardScoring[index2].choices;
                          },
                          // userAnswers.answers.where((element) =>
                          //                   element.questions.question ==
                          //                   questions.enjoymentOfFoodLength
                          //                       .elementAt(index)
                          //                       .question)
                          child: Container(
                            decoration: BoxDecoration(
                                color: (userAnswers.answersCollection
                                            .firstWhere((element) =>
                                                element.questions.question ==
                                                questions.listQuestions(selectedIndex)
                                                    .elementAt(index)
                                                    .question)
                                            .answers ==
                                        questions
                                            .standardScoring[index2].choices)
                                    ? Colors.blue
                                    : Colors.white,
                                //Add all the user answers inside, and then use a function and change notifiyer
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 2,
                                      offset: Offset(1, 3),
                                      color: Colors.grey)
                                ]),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: double.infinity,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                questions.standardScoring[index2].choices,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        itemCount: questions.standardScoring.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  if (selectedIndex <7){
                selectedIndex ++;

                  }
                  else{
                        Navigator.push<MaterialPageRoute>(context,
                      MaterialPageRoute(builder: (context) => Results()));
                  }
                  
                });
            
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
