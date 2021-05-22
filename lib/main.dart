import 'package:adult_eating_behaviour_questionaire/model/user_answers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/homepage_dots.dart';
import 'screens/pageview1_screen.dart';
import 'screens/pageview2_screen.dart';
import 'screens/pageview3_screen.dart';
import 'screens/questionaire_screen.dart';

void main() {
  runApp(const AEBQ());
}

class AEBQ extends StatelessWidget {
  const AEBQ({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
           providers: [
             ChangeNotifierProvider<UserAnswers>(create: (_)=>UserAnswers(),)

           ],
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: const Color(0xff56B1BF),
            primaryColorDark: const Color(0xff08708A)),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  int textNumber = 0;
  int dotnumber = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  String textDisplay(int txtnum) {
    String txtDisplay;
    if (txtnum < 2) {
      txtDisplay = 'Next';
    } else if (txtnum == 2) {
      txtDisplay = 'Get Started';
    }

    if (txtnum > 2 || txtnum == 3) {
      txtDisplay = 'Get Started';
      // Navigator.push<MaterialPageRoute>(
      //     context, MaterialPageRoute(builder: (context) => Questionaire()));

    }
    return txtDisplay;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (pagenumber) {
                setState(() {
                  dotnumber = pagenumber;
                  textNumber = pagenumber;
                });
              },
              children: [
                Pageview1(size: size),
                Pageview2(size: size),
                Pageview3(size: size),
              ],
            ),
          ),
          HomepageDots(
              dotNumber: dotnumber,
            ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  textNumber += 1;
                  dotnumber += 1;
                });
                pageController.nextPage(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn);
                    
                if (textNumber > 2 || textNumber == 3) {
                  Navigator.push<MaterialPageRoute>(context,
                      MaterialPageRoute(builder: (context) => Questionaire()));
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColorDark),
                  minimumSize: MaterialStateProperty.all(
                    const Size(280, 55),
                  ),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  )),
              child: Text(
                textDisplay(textNumber),
                style: const TextStyle(fontSize: 24),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
