import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  final String text;
  const LoginText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    );
  }
}
