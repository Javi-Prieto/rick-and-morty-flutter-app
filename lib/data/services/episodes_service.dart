import 'package:chopper/chopper.dart';
part 'episodes_service.chopper.dart';

@ChopperApi()
abstract class EpisodeService extends ChopperService {
  static EpisodeService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://rickandmortyapi.com/api/'),
      services: [_$EpisodeService()],
    );
    return _$EpisodeService(client);
  }

  @Get(path: 'episode?page=1')
  Future<Response> fetchEpisodesList();
  @Get(path: 'episode?page=2')
  Future<Response> fetchEpisodesListP2();
  @Get(path: 'episode?page=3')
  Future<Response> fetchEpisodesListP3();

  @Get(path: 'episode/{id}')
  Future<Response> fetchEpisodeDetail(@Path() int id);
}
