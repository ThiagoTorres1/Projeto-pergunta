import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  const Answers({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          text!,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
