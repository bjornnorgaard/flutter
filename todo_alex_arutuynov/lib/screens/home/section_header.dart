import 'package:flutter/material.dart';
import 'package:todo_alex_arutuynov/utils/constants.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Text(
        "$title".toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          letterSpacing: 1,
          color: kTextColor,
        ),
      ),
    );
  }
}
