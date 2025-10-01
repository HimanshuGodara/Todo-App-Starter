import 'package:todo_app/entities/task_entity.dart';

abstract class TaskRepository {
  TaskEntity createTask({required TaskEntity task});
  TaskEntity editTask({required TaskEntity task});
  bool deleteTask({required TaskEntity task});
  List<TaskEntity> loadTasks();
  TaskEntity toggleCompletionStatus({
    required TaskEntity task,
    required bool isDone,
  });
}
