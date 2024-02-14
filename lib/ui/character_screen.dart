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
          PersonajesBloc(personajeRepositori)..add(PersonajeFetchEvents()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lista Personajes"),
        ),
        body: _PersonajeList(context),
      ),
    );
  }

  Widget _PersonajeList(BuildContext context) {
    return BlocBuilder<PersonajesBloc, PersonajesState>(
        buildWhen: (previous, current) {
      return current is! PersonajeDetallesClick;
    }, builder: (context, state) {
      if (state is PersonajesFeatchSucces) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 0.7, mainAxisSpacing: 5.0),
            itemCount: state.personajesList.length,
            itemBuilder: (context, index) {
              final l = state.personajesList[index];
              return PersonajeWidget(list: l);
            });
      } else if (state is PersonajesFetchError) {
        return Text(state.errorDeMensaje);
      } else {
        return CircularProgressIndicator();
      }
    });
  }
}
