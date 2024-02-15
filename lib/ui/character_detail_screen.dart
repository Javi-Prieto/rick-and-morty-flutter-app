import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter_app/blocs/bloc/personaje_details_bloc_bloc.dart';
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
          PersonajesBloc(personajeRepositori)..add(PersonajeFetchEvents()),
      child: Container(child: _CharacterDetails(context)),
    );
  }

  Widget _CharacterDetails(BuildContext context) {
    return BlocBuilder<PersonajeDetailsBlocBloc, PersonajeDetailsBlocState>(
      buildWhen: (previous, current) {
        return current is PersonajeDetailsBlocInitial ||
            current is PersonajeDetailsBlocEvent ||
            current is PersonajeDetailsFetchError;
      },
      builder: (context, state) {
        if (state is PersonajeDetailsBlocInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PersonajeDetailsFetchError) {
          return Column(
            children: [
              Text(state.mensajeError),
              ElevatedButton(
                onPressed: () {
                  context.watch<PersonajeDetailsBlocBloc>().add(
                      PersonajeDetailsFetchEvent(personajeId: personajeId));
                },
                child: const Text("Retry"),
              )
            ],
          );
        } else if (state is PersonajeDetailFetched) {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back),
              ),
              title: Text(state.personaje.name!),
              centerTitle: true,
            ),
            body: Column(
              children: [
                const Divider(),
                const Text(
                  'Created At',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Text(state.personaje.gender!)
              ],
            ),
          );
        } else {
          return const Text('No support');
        }
      },
    );
  }
}
