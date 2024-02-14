import 'package:flutter/material.dart';

import 'package:rick_and_morty_flutter_app/models/listPersonajes/lista_personajes_response/result.dart';
import 'package:rick_and_morty_flutter_app/ui/character_detail_screen.dart';

class PersonajeWidget extends StatelessWidget {
  final Result list;
  const PersonajeWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 50,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CharacterScreenDetails(
                        personajeId: list.id!,
                      )),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Center(
                      child: Image(
                    image: NetworkImage(list.image!),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(list.location!.name!),
                      Text(list.gender!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color.fromARGB(255, 55, 201, 140)),
                        width: 350,
                        height: 100,
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(list.name!, textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
