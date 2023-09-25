// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/font_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';

class CustomLabel extends StatelessWidget {
  final String text;
  const CustomLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s16,
      ),
    );
  }
}
