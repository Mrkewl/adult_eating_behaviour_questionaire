
import 'package:flutter/material.dart';

class Pageview1 extends StatelessWidget {
  const Pageview1({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: size.height / 3,
              child: Image.asset(
                'assets/images/fill_outline.png',
                fit: BoxFit.contain,
              )),
        const SizedBox(height: 40),
        Expanded(
                  child: Container(
            margin: const EdgeInsets.only(left: 80),
            width: double.infinity,
            height: size.height / 4.5,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    topLeft: Radius.circular(10)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      spreadRadius: 0.5,
                      offset: Offset(0, 2))
                ]),
            child: const Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Text(
                'Adult Eating Behaviour Questionaire',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        const Text(
          'Discover Your Eating Behaviour',
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
    

      ],
    );
  }
}