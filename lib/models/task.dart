import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  Task({
    required this.text,
    required this.dueAt,
    required this.created
  });

  @HiveField(1)
  final String? text;

  @HiveField(2)
  final DateTime? dueAt;

  @HiveField(3)
  final DateTime? created;

  @HiveField(4)
  final bool? isComplete = false;

  String dueAtFmt() => DateFormat.MMMEd().add_jm().format(dueAt!);
}