import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TaskCategory extends Equatable {
  final IconData icon;
  final bool isDone;
  final Color iconColor;

  const TaskCategory({
    required this.icon,
    required this.isDone,
    required this.iconColor,
  });

  @override
  List<Object?> get props => [
        icon,
        isDone,
        iconColor,
      ];
}
