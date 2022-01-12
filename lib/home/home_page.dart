import 'package:flutter/material.dart';
import 'package:taskability/blocs/home_bloc.dart';
import 'package:taskability/home/task_editor.dart';
import 'package:taskability/models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  final String title = 'taskability';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = HomeBloc();

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
            splashRadius: 24.0,
            onPressed: () {
              _bloc.clearAll();
              Navigator.of(context);
            },
          )
        ],
      ),
      body: StreamBuilder<List<Task>>(
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
                subtitle: data.dueAt != null ? Text(data.dueAtFmt()) : null,
                leading: data.isComplete! 
                  ? const Icon(Icons.check_box_rounded)
                  : const Icon(Icons.check_box_outline_blank_rounded),
                onTap: () {
                  // Mark task as complete.
                },
              );
            }
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add_rounded),
        label: const Text('New task'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(4.0)
              ),
            ),
            builder: (context) => TaskEditor(onSave: _bloc.addTask,),
          );
        },
      ),
    );
  }
}