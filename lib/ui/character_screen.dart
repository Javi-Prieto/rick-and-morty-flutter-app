import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter_app/blocs/bloc/personaje_details_bloc_bloc.dart';
import 'package:rick_and_morty_flutter_app/blocs/bloc/personajes_bloc.dart';
import 'package:rick_and_morty_flutter_app/models/listPersonajes/lista_personajes_response/result.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_repository.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_reposritory_impl.dart';
import 'package:rick_and_morty_flutter_app/ui/character_detail_screen.dart';
import 'package:rick_and_morty_flutter_app/widgets/chracaters_list_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late PersonajeRepositori personajeRepositori;

  @override
  void initState() {
    super.initState();
    personajeRepositori = PersonajesRespositoryImpl();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PersonajesBloc(personajeRepositori)..add(PersonajeFetchList()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lista Personajes"),
        ),
        body: _PersonajeList(),
      ),
    );
  }

  Widget _PersonajeList() {
    return BlocBuilder<PersonajesBloc, PersonajesState>(
      builder: (context, state) {
        if (state is PersonajesFeatchSucces) {
          return ListView.builder(
            itemCount: state.personajesList.length,
            itemBuilder: (context, index) {
              final l = state.personajesList[index];
              return GestureDetector(
                onTap: () {
                  final personajeRepositori = PersonajesRespositoryImpl();

                  final detailsBloc =
                      PersonajeDetailsBlocBloc(personajeRepositori);

                  detailsBloc
                      .add(PersonajeDetailsFetchEvent(personajeId: l.id!));

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: detailsBloc,
                        child: CharacterScreenDetails(
                          personajeId: l.id!,
                        ),
                      ),
                    ),
                  );
                },
                child: PersonajeWidget(list: l),
              );
            },
          );
        } else if (state is PersonajesFetchError) {
          return Text(state.errorDeMensaje);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
