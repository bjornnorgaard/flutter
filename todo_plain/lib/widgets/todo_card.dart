import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String desc;
  final bool completed;
  final ValueChanged<bool> onChange;

  const TodoCard({
    Key key,
    this.desc,
    this.completed,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Row(
            children: [
              Checkbox(onChanged: this.onChange, value: this.completed),
              Text("${this.desc}"),
            ],
          ),
        ),
      ),
    );
  }
}
