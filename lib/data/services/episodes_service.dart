import 'package:chopper/chopper.dart';
part 'episodes_service.chopper.dart';

@ChopperApi()
abstract class EpisodeService extends ChopperService {
  static EpisodeService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(
          'https://rickandmortyapi.com/api/'),
      services: [_$EpisodeService()],
    );
    return _$EpisodeService(client);
  }

  @Get(path: 'episode/')
  Future<Response> fetchEpisodesList();
}