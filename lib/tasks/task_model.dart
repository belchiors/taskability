class Task {
  int? id;
  String? text;
  bool? isComplete = false;
  DateTime? dueAt;
  
  Task(this.text, {this.id, this.isComplete, this.dueAt});

  Task.deserialize(Map<String, dynamic> map) {
    text = map['text'];
    isComplete = map['isComplete'] ?? false; // FIX???
  }

  Map<String, dynamic> serialize() => <String, dynamic>{
    'id': id,
    'isComplete': isComplete,
    'text': text,
    'dueAt': dueAt.toString(),
  };

  @override
  String toString() => text!;
}