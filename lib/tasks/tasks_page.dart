import 'package:flutter/material.dart';
import 'task_model.dart';

import 'task_bloc.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  final String title = 'Tasks';

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final _textFieldController = TextEditingController();
  final _bloc = TaskBloc();

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.clear_all_rounded),
            splashRadius: 18.0,
            onPressed: () {
              _bloc.clearAll();
              Navigator.of(context);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: StreamBuilder<List<Task>>(
              stream: _bloc.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data![index];
                    return ListTile(
                      title: Text(data.text!),
                      leading: data.isComplete!
                        ? const Icon(Icons.radio_button_checked)
                        : const Icon(Icons.radio_button_unchecked),
                      onTap: () {
                        // Mark task as complete.
                      },
                    );
                  }
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textFieldController,
                      decoration: const InputDecoration(
                        hintText: 'New task',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      onSubmitted: (text) {
                        _bloc.createTask(text);
                        _textFieldController.clear();
                      }
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_rounded),
                    splashRadius: 18.0,
                    onPressed: () {
                      _bloc.createTask(_textFieldController.text);
                      _textFieldController.clear();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}