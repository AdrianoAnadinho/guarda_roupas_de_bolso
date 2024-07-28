import 'package:guarda_roupas_de_bolso/models/models.dart';
import 'package:guarda_roupas_de_bolso/services/services.dart';

class GetLocationsUseCase {
  final service = GetLocationsService();

  Future<List<Location>> getLocations() async {
    return service.getLocations();
  }
}
