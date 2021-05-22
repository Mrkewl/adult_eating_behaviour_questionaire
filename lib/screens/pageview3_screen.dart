import 'package:flutter/material.dart';

class Pageview3 extends StatelessWidget {
  const Pageview3({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(top: 10),
            width: size.width / 2,
            height: size.height / 3,
            child: Image.asset(
              'assets/images/healthy-eating.png',
              fit: BoxFit.contain,
            )),
        const SizedBox(height: 40),
        Expanded(
                  child: Container(
            width: double.infinity,
            height: size.height / 4.5,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      spreadRadius: 0.5,
                      offset: Offset(0, 2))
                ]),
            child: const Center(
              child: Text(
                'We can make better\n food decisions',
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
