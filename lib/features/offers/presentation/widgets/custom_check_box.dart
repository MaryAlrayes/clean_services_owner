// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomeCheckBox extends StatefulWidget {
  final String title;
  const CustomeCheckBox({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<CustomeCheckBox> createState() => _CustomeCheckBoxState();
}

class _CustomeCheckBoxState extends State<CustomeCheckBox> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isSelected,
      onChanged: (value) {
        setState(() {
          isSelected=!isSelected;
        });
      },
      title: Text(
        widget.title,
      ),
    );
  }
}
