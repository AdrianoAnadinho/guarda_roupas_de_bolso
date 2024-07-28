import 'package:flutter/material.dart';
import 'package:guarda_roupas_de_bolso/models/location.dart';

class GetLocationsService {
  Future<List<Location>> getLocations() async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () => [
        const Location(
          title: 'Trabalho',
          time: TimeOfDay(
            hour: 5,
            minute: 11,
          ),
          braStatus: false,
          pantiesStatus: true,
          shirtStatus: true,
          shoeStatus: false,
          shortsStatus: true,
          socksStatus: false,
        ),
      ],
    );
  }
}
