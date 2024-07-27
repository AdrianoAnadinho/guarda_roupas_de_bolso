import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Location extends Equatable {
  final String title;
  final TimeOfDay? time;

  const Location({
    required this.title,
    this.time,
  });

  @override
  List<Object?> get props => [
        title,
        time,
      ];
}
