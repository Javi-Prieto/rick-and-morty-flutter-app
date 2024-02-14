part of 'personajes_bloc.dart';

@immutable
sealed class PersonajesEvent {}

final class PersonajeFetchEvents extends PersonajesEvent {}

class PersonajeFetchList extends PersonajesEvent {
  PersonajeFetchList();
}

class PersonajeDetalles extends PersonajesEvent {
  final int personajeId;
  PersonajeDetalles(this.personajeId);
}
