import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Location extends Equatable {
  final String title;
  final TimeOfDay? time;
  final bool shirtStatus;
  final bool shortsStatus;
  final bool shoeStatus;
  final bool socksStatus;
  final bool braStatus;
  final bool pantiesStatus;

  const Location({
    required this.title,
    this.shirtStatus = false,
    this.shortsStatus = false,
    this.shoeStatus = false,
    this.socksStatus = false,
    this.braStatus = false,
    this.pantiesStatus = false,
    this.time,
  });

  @override
  List<Object?> get props => [
        title,
        time,
        shirtStatus,
        shortsStatus,
        shoeStatus,
        socksStatus,
        braStatus,
        pantiesStatus
      ];

  Location copyWith({
    String? title,
    TimeOfDay? time,
    bool? shirtStatus,
    bool? shortsStatus,
    bool? shoeStatus,
    bool? socksStatus,
    bool? braStatus,
    bool? pantiesStatus,
  }) {
    return Location(
      title: title ?? this.title,
      time: time ?? this.time,
      shirtStatus: shirtStatus ?? this.shirtStatus,
      shortsStatus: shortsStatus ?? this.shortsStatus,
      shoeStatus: shoeStatus ?? this.shoeStatus,
      socksStatus: socksStatus ?? this.socksStatus,
      braStatus: braStatus ?? this.braStatus,
      pantiesStatus: pantiesStatus ?? this.pantiesStatus,
    );
  }
}
