import 'package:adult_eating_behaviour_questionaire/model/user_answers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userAnswers = Provider.of<UserAnswers>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Column(children: [
             const Text(
              'Nutrition-Related Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height:4),
            const Divider(color: Colors.grey,indent: 10,endIndent: 10,height: 2,thickness: 3,),
            const SizedBox(height:6),
            const Text(
              'Eating Behaviour Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.teal),
            ),
            const SizedBox(height:6),
            const Divider(color: Colors.grey,indent: 10,endIndent: 10,height: 2,thickness: 2,),
            const SizedBox(height:6),
            const Text(
              'Adult Eating Behaviour \nQuestionnaire (AEBQ) Results',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.black),
            ),
            const SizedBox(height:6),
            const Divider(color: Colors.grey,indent: 10,endIndent: 10,height: 2,thickness: 2,),
            const SizedBox(height:6),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Row( 
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const[
                       Text('Behaviour Trait'),
                       Text('Condition'),
                ],
            ),
             ),
            const SizedBox(height:6),
            const Divider(color: Colors.grey,indent: 10,endIndent: 10,height: 2,thickness: 2,),
            const SizedBox(height:6),
              ListView.builder(
                itemBuilder: (context,index) => Row(
                  
                ),
                itemCount: userAnswers.answersCollection.map((e) => e.questions.topic).toList().length),
                  
            
              
            const SizedBox(height:6),
            const Divider(color: Colors.grey,indent: 10,endIndent: 10,height: 2,thickness: 2,),
          ]),
        ),
      ),
    );
  }
}
