import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:guarda_roupas_de_bolso/models/enums/category.dart';

class TaskCategory extends Equatable {
  final IconData icon;
  final bool isDone;
  final Category category;

  const TaskCategory({
    this.isDone = false,
    required this.icon,
    required this.category,
  });

  @override
  List<Object?> get props => [
        icon,
        isDone,
      ];

  TaskCategory copyWith({
    IconData? icon,
    bool? isDone,
    Category? category,
  }) {
    return TaskCategory(
      icon: icon ?? this.icon,
      isDone: isDone ?? this.isDone,
      category: category ?? this.category,
    );
  }
}
