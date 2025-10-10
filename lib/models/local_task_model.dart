import 'package:todo_app/entities/category_entity.dart';
import 'package:todo_app/entities/task_entity.dart';

final class LocalTaskModel extends TaskEntity {
  LocalTaskModel({
    required super.title,
    required super.deadline,
    super.isDone = false,
    super.priority = TaskPriority.low,
    required super.category,
  });

  LocalTaskModel copyWith({
    String? title,
    DateTime? deadline,
    bool? isDone,
    TaskPriority? priority,
    CategoryEntity? category,
  }) {
    return LocalTaskModel(
      title: title ?? this.title,
      deadline: deadline ?? this.deadline,
      category: category ?? this.category,
      isDone: isDone ?? this.isDone,
      priority: priority ?? this.priority,
    );
  }
}
