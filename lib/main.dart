import 'package:flutter/material.dart';
import 'package:guarda_roupas_de_bolso/app.dart';
import 'package:guarda_roupas_de_bolso/hive/boxes/boxes.dart';
import 'package:guarda_roupas_de_bolso/models/location.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(LocationAdapter())
    ..registerAdapter(TimeOfDayAdapter());
  locationsBox = await Hive.openBox<Location>('locationBox');
  runApp(const MyApp());
}
