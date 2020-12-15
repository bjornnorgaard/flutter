import 'package:flutter/material.dart';
import 'package:todo_plain/models/todo.dart';
import 'package:todo_plain/widgets/todo_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todoList;
  var controller = TextEditingController();

  @override
  void initState() {
    this.todoList = List<Todo>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo Plain"),
        ),
        floatingActionButton: FloatingActionButton(
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print(this.controller.text);
              var newTodo = Todo(
                completed: false,
                title: this.controller.text,
                id: UniqueKey().toString()
              );
              this.todoList.add(newTodo);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildTodoCardList(this.todoList),
                TextField(
                  controller: this.controller,
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    hintText: "E.g. Have a chat with the dog..."
                  ),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildTodoCardList(List<Todo> todoList) {
    var cards = todoList
        .map((e) => TodoCard(
            desc: e.title,
            completed: e.completed,
            onChange: (value) {
              print("${e.id} changed: $value");

            }))
        .toList();

    return Column(
      children: cards.toList(),
    );
  }
}
