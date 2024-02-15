import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_flutter_app/models/listPersonajes/lista_personajes_response/result.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_repository.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_reposritory_impl.dart';

part 'personajes_event.dart';
part 'personajes_state.dart';

class PersonajesBloc extends Bloc<PersonajesEvent, PersonajesState> {
  final PersonajeRepositori personajeRepositori;

  PersonajesBloc(this.personajeRepositori) : super(PersonajesInitial()) {
    on<PersonajeFetchList>(_onPersonajesFetchList);
    on<PersonajeFetchEvents>(_onPersonajeFetchEvents);
  }

  void _onPersonajesFetchList(
      PersonajeFetchList event, Emitter<PersonajesState> emit) async {
    try {
      final personajesList = await personajeRepositori.fetchPersonajes();
      emit(PersonajesFeatchSucces(personajesList));
    } catch (e) {
      emit(PersonajesFetchError(e.toString()));
    }
  }

  void _onPersonajeFetchEvents(
      PersonajeFetchEvents event, Emitter<PersonajesState> emit) {}
}
