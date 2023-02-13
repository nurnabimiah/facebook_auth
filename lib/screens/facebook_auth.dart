import 'package:flutter/material.dart';

class FacebookAuth extends StatefulWidget {
  const FacebookAuth({Key? key}) : super(key: key);

  @override
  State<FacebookAuth> createState() => _FacebookAuthState();
}

class _FacebookAuthState extends State<FacebookAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
            )
          ],
        ),
      ),
    );
  }
}
