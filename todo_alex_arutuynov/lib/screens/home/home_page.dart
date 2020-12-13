import 'package:flutter/material.dart';
import 'package:todo_alex_arutuynov/screens/home/category_summary.dart';
import 'package:todo_alex_arutuynov/screens/home/section_header.dart';
import 'package:todo_alex_arutuynov/utils/constants.dart';
import 'package:todo_alex_arutuynov/widgets/my_card.dart';
import 'package:todo_alex_arutuynov/widgets/my_icon_button.dart';

class HomePage extends StatelessWidget {
  static const double kleftPadding = 30.0;
  static const double krightPadding = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 30,
                  left: kleftPadding - 10,
                  right: krightPadding),
              child: Row(
                children: [
                  MyIconButton(icon: Icons.menu, onTap: () {}),
                  Spacer(),
                  MyIconButton(icon: Icons.search, onTap: () {}),
                  MyIconButton(icon: Icons.alarm, onTap: () {}),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: kleftPadding),
              child: Row(
                children: [
                  Text(
                    "What's up, Joy!",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: kHeaderColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: kleftPadding, bottom: 20),
              child: SectionHeader(
                title: "categories",
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: kleftPadding),
                    child: MyCard(
                      child: CategorySummary(
                        taskCount: 40,
                        typeName: "Business",
                        color: kPurpleColor,
                      ),
                    ),
                  ),
                  MyCard(
                    child: CategorySummary(
                      taskCount: 18,
                      typeName: "Personal",
                      color: kBlueColor,
                    ),
                  ),
                  MyCard(
                    child: CategorySummary(
                      taskCount: 7,
                      typeName: "Other",
                      color: kGreenColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: kleftPadding, bottom: 20),
              child: SectionHeader(title: "today's tasks"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: kleftPadding,
                right: krightPadding,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    TodoItem(
                        checked: false,
                        description: "Daily meeting with the team",
                        color: kPurpleColor,
                        onChecked: (value) {
                          print("Got $value");
                        }),
                    TodoItem(
                        checked: true,
                        description: "Pay for rent",
                        color: kBlueColor,
                        onChecked: (value) {
                          print("Got $value");
                        }),
                    TodoItem(
                        checked: false,
                        description: "Check emails",
                        color: kBlueColor,
                        onChecked: (value) {
                          print("Got $value");
                        }),
                    TodoItem(
                        checked: false,
                        description: "Lunch with Emma",
                        color: kPurpleColor,
                        onChecked: (value) {
                          print("Got $value");
                        }),
                    TodoItem(
                        checked: false,
                        description: "Meditation",
                        color: kBlueColor,
                        onChecked: (value) {
                          print("Got $value");
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoItem extends StatefulWidget {
  final bool checked;
  final String description;
  final Color color;
  final ValueChanged<bool> onChecked;

  const TodoItem(
      {Key key, this.checked, this.description, this.color, this.onChecked})
      : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool checked;

  @override
  void initState() {
    super.initState();
    if (this.widget.checked == null) {
      this.checked = false;
    } else {
      this.checked = this.widget.checked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            RoundCheckbox(
              onChanged: (value) {
                setState(() {
                  this.checked = value;
                  this.widget.onChecked(value);
                });
              },
              checked: widget.checked,
              color: widget.color,
            ),
            SizedBox(width: 20),
            Text(
              widget.description,
              style: TextStyle(
                  color: this.checked
                      ? kHeaderColor.withOpacity(0.8)
                      : kHeaderColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  decoration: this.checked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }
}

class RoundCheckbox extends StatefulWidget {
  final bool checked;
  final Color color;
  final ValueChanged<bool> onChanged;

  const RoundCheckbox({
    Key key,
    this.checked,
    this.onChanged,
    this.color,
  }) : super(key: key);

  @override
  _RoundCheckboxState createState() => _RoundCheckboxState();
}

class _RoundCheckboxState extends State<RoundCheckbox> {
  bool checked;

  @override
  void initState() {
    super.initState();
    this.checked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          this.checked = !this.checked;
          this.widget.onChanged(this.checked);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: this.checked
              ? this.widget.color.withOpacity(0.3)
              : Colors.transparent,
          shape: BoxShape.circle,
          border: this.checked
              ? Border.all(color: Colors.transparent, width: 3)
              : Border.all(color: this.widget.color, width: 3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: this.checked
              ? Icon(
                  Icons.check,
                  size: 20,
                  color: Colors.white,
                )
              : Icon(
                  Icons.check,
                  size: 20,
                  color: Colors.transparent,
                ),
        ),
      ),
    );
  }
}
