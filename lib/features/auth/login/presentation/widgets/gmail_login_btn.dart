import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GmailLoginBtn extends StatelessWidget {
  const GmailLoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(
        FontAwesomeIcons.google,
        size: 18,
      ),
      label: Text(
        'تسجيل الدخول عبر Gmail',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,

      ),
    );
  }
}
