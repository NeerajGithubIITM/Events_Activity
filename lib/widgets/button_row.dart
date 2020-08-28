import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget flatButton(String buttonText) {
      return GestureDetector(
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple[900]),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 12,
              color: Colors.deepPurple[900],
            ),
          ),
        ),
      );
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          flatButton('TODAY'),
          flatButton('TOMORROW'),
          flatButton('WEEKEND'),
          flatButton('ANY-TIME')
        ],
      ),
    );
  }
}
