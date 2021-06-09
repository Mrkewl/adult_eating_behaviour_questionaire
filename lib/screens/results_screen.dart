import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/model/user_answers.dart';

class Results extends StatelessWidget {
  ScrollPhysics scrollPhysics;

  @override
  Widget build(BuildContext context) {
    final userAnswers = Provider.of<UserAnswers>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        physics: scrollPhysics,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          child: Text('Results',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w600)),
                        ),
                        Image(
                          height: 80,
                          width: 80,
                          image: AssetImage(
                            'assets/images/diet.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: ScrollPhysics(parent: scrollPhysics),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Container(
                          height: 70,
                          width: 150,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 2,
                                    offset: Offset(1, 3),
                                    color: Colors.grey)
                              ]),
                          child: Align(
                            child: Text(
                              userAnswers.answersCollection
                                  .map((e) => e.questions.topic)
                                  .toSet()
                                  .toList()[index],
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 150,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: userAnswers.aebqResults(index) == 'Present'
                                  ? Colors.red
                                  : Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 2,
                                    offset: Offset(1, 3),
                                    color: Colors.grey)
                              ]),
                          child: Align(
                            child: Text(
                              userAnswers.aebqResults(index),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    itemCount: 8,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
