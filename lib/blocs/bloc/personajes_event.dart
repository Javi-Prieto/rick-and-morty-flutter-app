part of 'personajes_bloc.dart';

@immutable
sealed class PersonajesEvent {}

class PersonajeFetchList extends PersonajesEvent {
  PersonajeFetchList();
}

class PersonajeDetalles extends PersonajesEvent {
  final int movieId;
  PersonajeDetalles(this.movieId);
}
