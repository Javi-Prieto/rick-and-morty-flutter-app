part of 'personajes_bloc.dart';

@immutable
sealed class PersonajesState {
  final List<Result> list;
  const PersonajesState({
    this.list = const <Result>[],
  });
}

final class PersonajesInitial extends PersonajesState {}

final class PersonajesFeatchSucces extends PersonajesState {
  final List<Result> personajesList;
  const PersonajesFeatchSucces(this.personajesList);
}

final class PersonajesFetchError extends PersonajesState {
  final String errorDeMensaje;
  const PersonajesFetchError(this.errorDeMensaje);
}

final class PersonajeDetallesClick extends PersonajesState {
  final int personajeId;
  const PersonajeDetallesClick(this.personajeId);
}
