import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomepageDots extends StatelessWidget {
  HomepageDots({this.dotNumber});
  int dotNumber = 0;

  
  @override
  Widget build(BuildContext context) {
    Color dotcolour1(int selectedDotColor) {
    Color color;
    if (selectedDotColor == 0) {
      color = Theme.of(context).primaryColorDark;
    } else {
      color = Colors.grey;
    }
    return color;
  }

  Color dotcolour2(int selectedDotColor) {
    Color color;
    if (selectedDotColor == 1) {
      color = Theme.of(context).primaryColorDark;
    } else {
      color = Colors.grey;
    }
    return color;
  }

  Color dotcolour3(int selectedDotColor) {
    Color color;
    if (selectedDotColor == 2) {
      color = Theme.of(context).primaryColorDark;
    } else {
      color = Colors.grey;
    }
    return color;
  }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.circle,
              color: dotcolour1(dotNumber),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.circle,
              color: dotcolour2(dotNumber)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.circle,
              color: dotcolour3(dotNumber),
            ),
          ),
        ],
      ),
    );
  }
}
