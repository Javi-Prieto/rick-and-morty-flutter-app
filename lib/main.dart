import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_flutter_app/blocs/bloc/personaje_details_bloc_bloc.dart';
import 'package:rick_and_morty_flutter_app/blocs/bloc/personajes_bloc.dart';

import 'package:rick_and_morty_flutter_app/data/services/episodes_service.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_repository.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_reposritory_impl.dart';
import 'package:rick_and_morty_flutter_app/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<EpisodeService>(
          create: (BuildContext context) => EpisodeService.create(),
          dispose: (_, EpisodeService repository) =>
              repository.client.dispose(),
        ),
        Provider<PersonajesRespositoryImpl>(
          create: (BuildContext context) => PersonajesRespositoryImpl(),
        ),
        Provider<PersonajesBloc>(
          create: (BuildContext context) =>
              PersonajesBloc(context.read<PersonajesRespositoryImpl>()),
          dispose: (_, PersonajesBloc bloc) => bloc.close(),
        ),
        Provider<PersonajeDetailsBlocBloc>(
          create: (BuildContext context) => PersonajeDetailsBlocBloc(
              context.read<PersonajesRespositoryImpl>()),
        ),
      ],
      child: MaterialApp(
        title: 'My App',
        home: HomeScreen(),
      ),
    );
  }
}

class PersonajeRepositoryImpl {}
