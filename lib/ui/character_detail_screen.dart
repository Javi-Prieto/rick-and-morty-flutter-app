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
            return ListView(
              children: <Widget>[
                Center(
                  child: Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Nombre: ${personaje.name}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Estado: ${personaje.status}'),
                                  Text('Especie: ${personaje.species}'),
                                  Text(
                                      'Ubicación: ${personaje.location?.name}'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Tipo: ${personaje.type}'),
                                  Text('Género: ${personaje.gender}'),
                                  Text('Origen: ${personaje.origin?.name}'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          personaje.image != null
                              ? Image.network(personaje.image!)
                              : Container(),
                          SizedBox(height: 10),
                          Text('Episodios: ${personaje.episode?.length ?? 0}'),
                          Text('URL: ${personaje.url}'),
                          Text(
                              'Creado: ${personaje.created?.toIso8601String()}'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
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
