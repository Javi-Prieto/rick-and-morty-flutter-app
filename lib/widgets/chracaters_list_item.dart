import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter_app/blocs/bloc/personajes_bloc.dart';
import 'package:rick_and_morty_flutter_app/models/listPersonajes/lista_personajes_response/result.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_repository.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_reposritory_impl.dart';

class PersonajeWidget extends StatelessWidget {
  final Result list;
  const PersonajeWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(list.name!),
                  Text(list.gender!),
                ],
              ),
              Row(
                children: [
                  Image.network(
                    list.image!,
                    width: 100,
                    height: 200,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
