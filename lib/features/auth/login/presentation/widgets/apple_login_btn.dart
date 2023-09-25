import 'package:flutter/material.dart';

class AppleLoginBtn extends StatelessWidget {
  const AppleLoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.apple),
      label: Text(
        'تسجيل الدخول عبر Apple',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
      ),
    );
  }
}
