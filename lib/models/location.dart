import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'location.g.dart';

@HiveType(typeId: 0)
class Location extends Equatable {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final TimeOfDay? time;
  @HiveField(2)
  final bool shirtStatus;
  @HiveField(3)
  final bool shortsStatus;
  @HiveField(4)
  final bool shoeStatus;
  @HiveField(5)
  final bool socksStatus;
  @HiveField(6)
  final bool braStatus;
  @HiveField(7)
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
