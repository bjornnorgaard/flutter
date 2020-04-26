class Todo {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Todo(this._title, this._priority, this._date, [this._description]);

  Todo.withId(this._id, this._title, this._priority, this._date,
      [this._description]);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  int get priority => _priority;

  String get date => _date;

  set title(String title) {
    if (title.length <= 255) {
      _title = title;
    }
  }

  set description(String description) {
    if (description.length <= 255) {
      _description = description;
    }
  }

  set priority(int priority) {
    if (priority > 0 && priority <= 3) {
      _priority = priority;
    }
  }

  set date(String date) {
    _date = date;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["date"] = _date;
    map["priority"] = _priority;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Todo.fromObject(dynamic o) {
     this._id = o[" id"];
     this._title = o[" title"];
     this._description = o[" description"];
     this._date = o[" date"];
     this._priority = o[" priority"];
  }
}
