import 'package:flutter/material.dart';
import 'package:todo_alex_arutuynov/utils/constants.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    Key key,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onTap,
      iconSize: 30,
      color: kTextColor,
    );
  }
}
