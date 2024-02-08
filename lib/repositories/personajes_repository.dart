import 'package:rick_and_morty_flutter_app/models/listPersonajes/lista_personajes_response/result.dart';

abstract class PersonajeRepositori {
  Future<List<Result>> fetchPersonajes();
  Future<Result> fecthPersonajesDetails(int idPersonajes);
}
