import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter_app/blocs/bloc/personaje_details_bloc_bloc.dart';
import 'package:rick_and_morty_flutter_app/models/listPersonajes/lista_personajes_response/result.dart';

class CharacterScreenDetails extends StatefulWidget {
  final int personajeId;

  const CharacterScreenDetails({Key? key, required this.personajeId})
      : super(key: key);

  @override
  _CharacterScreenDetailsState createState() => _CharacterScreenDetailsState();
}

class _CharacterScreenDetailsState extends State<CharacterScreenDetails> {
  @override
  void initState() {
    super.initState();
    // Envía el evento para cargar los detalles del personaje al BLoC
    context.read<PersonajeDetailsBlocBloc>().add(
          PersonajeDetailsFetchEvent(personajeId: widget.personajeId),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Personaje'),
      ),
      body: BlocBuilder<PersonajeDetailsBlocBloc, PersonajeDetailsBlocState>(
        builder: (context, state) {
          if (state is PersonajeDetailsBlocInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PersonajeDetailFetched) {
            final personaje = state.personaje;
            return Text(personaje.name!);
          } else if (state is PersonajeDetailsFetchError) {
            return Center(
              child: Text(
                  'Error al cargar los detalles del personaje: ${state.mensajeError}'),
            );
          } else {
            return Center(
              child: Text('Estado de bloc desconocido.'),
            );
          }
        },
      ),
    );
  }
}
