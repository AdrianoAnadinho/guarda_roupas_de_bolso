import 'package:guarda_roupas_de_bolso/hive/boxes/locations_box.dart';
import 'package:guarda_roupas_de_bolso/models/location.dart';

class GetLocationsService {
  Future<List<Location>> getLocations() async {
    final locations = locationsBox.toMap().values.toList() as List<Location>;

    return locations;

    // Future.delayed(
    //   const Duration(seconds: 2),
    //   () => [
    //     const Location(
    //       title: 'Trabalho',
    //       time: TimeOfDay(
    //         hour: 5,
    //         minute: 11,
    //       ),
    //       braStatus: false,
    //       pantiesStatus: true,
    //       shirtStatus: true,
    //       shoeStatus: false,
    //       shortsStatus: true,
    //       socksStatus: false,
    //     ),
    //   ],
    // );
  }
}
