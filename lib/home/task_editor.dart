import 'package:flutter/material.dart';
import 'package:taskability/models/task.dart';

class TaskEditor extends StatefulWidget {
  const TaskEditor({Key? key, this.onSave}) : super(key: key);

  final Function(Task)? onSave;

  @override
  _TaskEditorState createState() => _TaskEditorState();
}

class _TaskEditorState extends State<TaskEditor> {
  final _textFieldController = TextEditingController();

  DateTime? _dueAt;

  void _onSave() {
    if (_textFieldController.text.isNotEmpty) {
      var newTask = Task(
        text: _textFieldController.text,
        created: DateTime.now(),
        dueAt: _dueAt,
      );
      widget.onSave!(newTask);
    }
    Navigator.pop(context);
  }

  void _showDateTimePicker() async {
    var local = DateTime.now();
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                onDateChanged: (dateTime) {
                  local = dateTime;
                },
              ),
              ListTile(
                leading: const Icon(Icons.schedule_rounded),
                title: const Text('Set time'),
                onTap: () async {
                  final timePicker = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  local = DateTime(
                    local.year,
                    local.month,
                    local.day,
                    timePicker!.hour,
                    timePicker.minute,
                  );
                }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  ),
                  TextButton(
                    child: const Text('Done'),
                    onPressed: () {
                      setState(() {
                        _dueAt = local;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 8.0,
          top: 8.0,
          right: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom
        ),
        child: Column(
          children: [
            TextField(
              controller: _textFieldController,
              autofocus: true,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'New task',
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 0.8),
                isDense: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  padding: const EdgeInsets.all(0.0),
                  splashRadius: 24.0,
                  icon: const Icon(Icons.event_available_rounded),
                  onPressed: _showDateTimePicker,
                ),
                TextButton(
                  child: const Text('Save'),
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: _onSave,
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}