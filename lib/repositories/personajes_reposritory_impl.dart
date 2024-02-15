import 'package:rick_and_morty_flutter_app/models/listPersonajes/lista_personajes_response/lista_personajes_response.dart';
import 'package:rick_and_morty_flutter_app/models/listPersonajes/lista_personajes_response/result.dart';
import 'package:rick_and_morty_flutter_app/repositories/personajes_repository.dart';
import 'package:http/http.dart';

class PersonajesRespositoryImpl extends PersonajeRepositori {
  final Client _client = Client();

  @override
  Future<List<Result>> fetchPersonajes() async {
    final response = await _client
        .get(Uri.parse('https://rickandmortyapi.com/api/character'));
    if (response.statusCode == 200) {
      return ListaPersonajesResponse.fromJson(response.body).results!;
    } else {
      throw UnimplementedError('Fail to load personajes');
    }
  }

  @override
  Future<Result> fecthPersonajesDetails(int personajesId) async {
    final response = await _client.get(
        Uri.parse('https://rickandmortyapi.com/api/character/$personajesId'));
    if (response.statusCode == 200) {
      return Result.fromJson(response.body);
    } else {
      throw Exception('Failed to load personaje details');
    }
  }
}
