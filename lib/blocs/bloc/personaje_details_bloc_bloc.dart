import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_flutter_app/models/listPersonajes/lista_personajes_response/result.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_repository.dart';

part 'personaje_details_bloc_event.dart';
part 'personaje_details_bloc_state.dart';

class PersonajeDetailsBlocBloc
    extends Bloc<PersonajeDetailsBlocEvent, PersonajeDetailsBlocState> {
  final PersonajeRepositori personajeRepositori;
  PersonajeDetailsBlocBloc(this.personajeRepositori)
      : super(PersonajeDetailsBlocInitial()) {
    on<PersonajeDetailsBlocEvent>(_onPersonajeDetailsFetch);
  }
  void _onPersonajeDetailsFetch(PersonajeDetailsBlocEvent event,
      Emitter<PersonajeDetailsBlocState> emit) async {
    try {
      final personajeDetailsResponse =
          await personajeRepositori.fecthPersonajesDetails(event.personajeId);
      print('Personaje details fetched: ${personajeDetailsResponse.toJson()}');
      emit(PersonajeDetailFetched(personajeDetailsResponse));
      return;
    } catch (e) {
      emit(PersonajeDetailsFetchError(e.toString()));
    }
  }
}
