import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guarda_roupas_de_bolso/stores/states/home_page_state.dart';
import 'package:guarda_roupas_de_bolso/use_cases/get_locations_use_case.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final useCase = GetLocationsUseCase();
  HomePageCubit() : super(HomePageLoadingState());

  init() async {
    final locations = await useCase.getLocations();

    emit(HomePageLoadedState(locations: locations));
  }

  refreshLocations() async {
    final locations = await useCase.getLocations();

    emit(HomePageLoadedState(locations: locations));
  }
}
