import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter_app/blocs/bloc/personajes_bloc.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_repository.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_reposritory_impl.dart';
import 'package:rick_and_morty_flutter_app/widgets/chracaters_list_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late PersonajesRespositoryImpl personajeRepositori;

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
            itemCount: state.list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.list[index].name!),
              );
            });
      } else if (state is PersonajesFetchError) {
        return Text(state.errorDeMensaje);
      } else {
        return CircularProgressIndicator();
      }
    });
  }
}
