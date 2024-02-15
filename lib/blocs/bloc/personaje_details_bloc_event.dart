part of 'personaje_details_bloc_bloc.dart';

@immutable
sealed class PersonajeDetailsBlocEvent {
  late final int personajeId;
}

final class PersonajeDetailsFetchEvent extends PersonajeDetailsBlocEvent {
  final int personajeId;
  PersonajeDetailsFetchEvent({required this.personajeId});
}
