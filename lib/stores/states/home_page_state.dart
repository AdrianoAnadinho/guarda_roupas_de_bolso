import 'package:equatable/equatable.dart';
import 'package:guarda_roupas_de_bolso/models/location.dart';

class HomePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomePageLoadingState extends HomePageState {}

class HomePageLoadedState extends HomePageState {
  final List<Location> locations;

  HomePageLoadedState({required this.locations});

  @override
  List<Object?> get props => [locations];
}
