part of 'personaje_details_bloc_bloc.dart';

@immutable
sealed class PersonajeDetailsBlocState {}

final class PersonajeDetailsBlocInitial extends PersonajeDetailsBlocState {}

final class PersonajeDetailFetched extends PersonajeDetailsBlocState {
  final Result personaje;
  PersonajeDetailFetched(this.personaje);
}

final class PersonajeDetailsFetchError extends PersonajeDetailsBlocState {
  final String mensajeError;
  PersonajeDetailsFetchError(this.mensajeError);
}
