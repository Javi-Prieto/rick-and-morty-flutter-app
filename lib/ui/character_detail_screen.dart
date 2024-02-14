import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter_app/blocs/bloc/personajes_bloc.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_repository.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_reposritory_impl.dart';

class CharacterScreenDetails extends StatelessWidget {
  final int personajeId;
  const CharacterScreenDetails({super.key, required this.personajeId});

  @override
  Widget build(BuildContext context) {
    PersonajeRepositori personajeRepositori = PersonajesRespositoryImpl();
    return BlocProvider(
        create: (context) =>
            PersonajesBloc(personajeRepositori)..add(PersonajeFetchEvents()));
  }
}
