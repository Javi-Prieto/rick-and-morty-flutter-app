import 'package:chopper/chopper.dart';
part 'episodes_repository.chopper.dart';

@ChopperApi()
abstract class EpisodeRepository extends ChopperService {
  static EpisodeRepository create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(
          'https://rickandmortyapi.com/api/'),
      services: [_$EpisodeRepository()],
    );
    return _$EpisodeRepository(client);
  }

  @Get(path: 'episode/')
  Future<Response> fetchEpisodesList();
}