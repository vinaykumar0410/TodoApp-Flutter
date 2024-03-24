import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String myText;
  final VoidCallback onPressed;

  const MyButton({super.key, required this.myText, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.lightBlue[100],
      elevation: 0,
      height: 38,
      child: Text(
        myText,
      ),
    );
  }
}
