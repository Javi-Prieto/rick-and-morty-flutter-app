import 'package:rick_and_morty_flutter_app/models/episode_detail_response.dart';
import 'package:rick_and_morty_flutter_app/models/episodes_response/result.dart';

abstract class EpisodeRepository {
  Future<List<Result>> fetchEpisodesList();
  Future<EpisodeDetailResponse> fetchEpisodeDetailResponse(int id);
}
