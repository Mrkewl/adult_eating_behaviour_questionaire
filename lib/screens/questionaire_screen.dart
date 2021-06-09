import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '/model/aebqmodel.dart';
import '/model/questions.dart';
import '/model/user_answers.dart';
import '/screens/results_screen.dart';

class Questionaire extends StatefulWidget {
  @override
  _QuestionaireState createState() => _QuestionaireState();
}

class _QuestionaireState extends State<Questionaire>
    with TickerProviderStateMixin {
  final AEBQ_Question questions = AEBQ_Question();
  bool finishedCurrentTopic = false;
  int selectedQuestion;

  int selectedIndex = 0;
  ScrollController _scrollController;
  ScrollPhysics scrollPhysics;
  Questions questionIndex;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Color setColor(String question, String answer) {
    if (answer != null && answer == question) {
      return Theme.of(context).primaryColor;
    } else {
      return Colors.white;
    }
  }

  //  userAnswers.answersCollection[index].score.choices == null?  Colors.white :Colors.blue
  // (userAnswers.answersCollection
  //             .firstWhere((element) =>
  //                 element.questions.question ==
  //                 questions
  //                     .listQuestions(
  //                         selectedIndex)
  //                     .elementAt(index)
  //                     .question)
  //             .score.choices ==
  //         questions
  //             .standardScoring[index2].choices)
  //     ? Colors.blue
  // :
  // Colors.white,

  @override
  Widget build(BuildContext context) {
    final userAnswers = Provider.of<UserAnswers>(context, listen: true);
    return Scaffold(
        body: SingleChildScrollView(
      controller: _scrollController,
      physics: scrollPhysics,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children:const [
                        Expanded(
                          child: Text(
                              'Adult Eating Behavioural Questionaire',
                              style:  TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600)),
                        ),
                         Expanded(
                            child: Image(
                          height: 80,
                          width: 80,
                          image: AssetImage(
                            'assets/images/diet.png',
                          ),
                        ))
                      ],
                    )),
              ),
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
                          questions
                              .listQuestions(selectedIndex)
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
                                  questions
                                      .listQuestions(selectedIndex)
                                      .elementAt(index)
                                      .question,
                                  questions.standardScoring[index2]);
                              print( userAnswers.answersCollection
                                          .firstWhere((element) =>
                                              element.questions.question ==
                                              questions
                                                  .listQuestions(selectedIndex)
                                                  .elementAt(index)
                                                  .question)
                                          .score
                                          ?.choices);
                              // userAnswers.answersCollection[index].answers =
                              //     questions.standardScoring[index2].choices;
                            },
                            // userAnswers.answers.where((element) =>
                            //                   element.questions.question ==
                            //                   questions.enjoymentOfFoodLength
                            //                       .elementAt(index)
                            //                       .question)
                            // (userAnswers.answersCollection
                            //             .firstWhere((element) =>
                            //                 element.questions.question ==
                            //                 questions
                            //                     .listQuestions(
                            //                         selectedIndex)
                            //                     .elementAt(index)
                            //                     .question)
                            //             .score.choices ==
                            //         questions
                            //             .standardScoring[index2].choices)
                            //     ? Colors.blue
                            // :
                            // Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: setColor(
                                      questions.standardScoring[index2].choices,
                                      userAnswers.answersCollection
                                          .firstWhere((element) =>
                                              element.questions.question ==
                                              questions
                                                  .listQuestions(selectedIndex)
                                                  .elementAt(index)
                                                  .question)
                                          .score
                                          ?.choices),

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
                onTap: () {
                  setState(() {
                    if (userAnswers.nextpage(
                            questions.questionsTopics(selectedIndex)) ==
                        true) {
                      if (selectedIndex < 7) {
                        selectedIndex++;
                        _scrollController.animateTo(0,
                            duration: const Duration(microseconds: 50),
                            curve: Curves.linear);
                      } else {
                        Navigator.push<MaterialPageRoute>(context,
                            MaterialPageRoute(builder: (context) => Results()));
                      }
                    } else {
                      // ignore: avoid_print
                      print('Please Finish filling the form');
                      showDialog<Dialog>(
                          context: context,
                          builder: (context) => const AlertDialog(
                                title: Text('Please Finish the Form'),
                              ));
                    }
                  });
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  width: double.infinity,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
