import 'package:flutter/cupertino.dart';
import 'package:todo_plain/models/todo.dart';

class TodoService {
  var _list = List<Todo>();

  List<Todo> getAll() {
    _list.add(Todo(title: "Hello World", completed: false));

    for (final t in _list) {
      print("${t.id}: ${t.completed} -${t.title}");
    }

    return _list;
  }

  String addOrUpdate(Todo todo) {
    var existing = _list.firstWhere((element) => element.id == todo.id);

    if (existing == null) {
      print("Existing todo not found, creating new");
      return this._add(todo.title);
    }
    return this._update(todo);
  }

  String _add(String desc) {
    var uniqueKey = UniqueKey().toString();
    var todo = Todo(completed: false, title: desc, id: uniqueKey);
    _list.add(todo);
    return todo.id;
  }

  String _update(Todo todo) {
    var existing = _list.firstWhere((element) => element.id == todo.id);

    existing.title = todo.title;
    existing.completed = todo.completed;

    return existing.id;
  }
}
