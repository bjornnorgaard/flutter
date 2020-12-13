import 'package:flutter/material.dart';
import 'package:todo_alex_arutuynov/utils/constants.dart';

class CategorySummary extends StatelessWidget {
  const CategorySummary({
    Key key,
    this.taskCount,
    this.typeName,
    this.color,
  }) : super(key: key);

  final int taskCount;
  final String typeName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          "$taskCount tasks" ?? "40 tasks",
          style: TextStyle(
            color: kTextColor.withOpacity(0.8),
            fontSize: 15,
          ),
        ),
        SizedBox(height: 10),
        Text(
          typeName ?? "Business",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Container(
          height: 3,
          width: 170,
          decoration: BoxDecoration(
            color: color ?? kPurpleColor,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(1, 5),
              ),
            ],
          ),
        )
      ],
    );
  }
}
