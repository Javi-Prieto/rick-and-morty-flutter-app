import 'package:rick_and_morty_flutter_app/data/repositories/episodes_repository.dart';
import 'package:rick_and_morty_flutter_app/data/services/episodes_service.dart';
import 'package:rick_and_morty_flutter_app/models/episode_detail_response.dart';
import 'package:rick_and_morty_flutter_app/models/episodes_response/episodes_response.dart';
import 'package:rick_and_morty_flutter_app/models/episodes_response/result.dart';

class EpisodesRespositoryImpl implements EpisodeRepository {
  final EpisodeService episodeService;

  EpisodesRespositoryImpl({required this.episodeService});

  @override
  Future<List<Result>> fetchEpisodesList(int season) async {
    switch (season) {
      case 1:
        {
          final episodeResponse = await episodeService.fetchEpisodesList();
          if (episodeResponse.isSuccessful) {
            final episodeBody = episodeResponse.body!.toString();
            final episodeList = EpisodesResponse.fromJson(episodeBody).results!;
            final List<Result> toReturn = [];
            for (var episode in episodeList) {
              int i = 0;
              if (episode.episode!.startsWith('S01')) {
                toReturn.insert(i, episode);
                i++;
              }
            }
            return toReturn;
          } else {
            throw (Exception(episodeResponse.error.toString()));
          }
        }
      case 2:
        {
          final episodeResponse = await episodeService.fetchEpisodesList();
          final episodeResponse2 = await episodeService.fetchEpisodesListP2();
          if (episodeResponse.isSuccessful && episodeResponse2.isSuccessful) {
            final episodeBody = episodeResponse.body!.toString();
            final episodeList = EpisodesResponse.fromJson(episodeBody).results!;
            final episodeList2 =
                EpisodesResponse.fromJson(episodeResponse2.body!.toString())
                    .results!;
            final List<Result> toReturn = [];
            for (var episode in episodeList) {
              if (episode.episode!.startsWith('S02')) {
                toReturn.add(episode);
              }
            }
            for (var episode in episodeList2) {
              if (episode.episode!.startsWith('S02')) {
                toReturn.add(episode);
              }
            }
            return toReturn;
          } else {
            throw (Exception(episodeResponse.error.toString()));
          }
        }
      case 3:
        {
          final episodeResponse = await episodeService.fetchEpisodesListP2();
          if (episodeResponse.isSuccessful) {
            final episodeBody = episodeResponse.body!.toString();
            final episodeList = EpisodesResponse.fromJson(episodeBody).results!;
            final List<Result> toReturn = [];
            for (var episode in episodeList) {
              if (episode.episode!.startsWith('S03')) {
                toReturn.add(episode);
              }
            }
            return toReturn;
          } else {
            throw (Exception(episodeResponse.error.toString()));
          }
        }
      case 4:
        {
          final episodeResponse = await episodeService.fetchEpisodesListP2();
          final episodeResponse2 = await episodeService.fetchEpisodesListP3();
          if (episodeResponse.isSuccessful && episodeResponse2.isSuccessful) {
            final episodeBody = episodeResponse.body!.toString();
            final episodeList = EpisodesResponse.fromJson(episodeBody).results!;
            final episodeList2 =
                EpisodesResponse.fromJson(episodeResponse2.body!.toString())
                    .results!;
            final List<Result> toReturn = [];
            for (var episode in episodeList) {
              if (episode.episode!.startsWith('S04')) {
                toReturn.add(episode);
              }
            }
            for (var episode in episodeList2) {
              if (episode.episode!.startsWith('S04')) {
                toReturn.add(episode);
              }
            }
            return toReturn;
          } else {
            throw (Exception(episodeResponse.error.toString()));
          }
        }
      case 5:
        {
          final episodeResponse = await episodeService.fetchEpisodesListP3();
          if (episodeResponse.isSuccessful) {
            final episodeBody = episodeResponse.body!.toString();
            final episodeList = EpisodesResponse.fromJson(episodeBody).results!;
            final List<Result> toReturn = [];
            for (var episode in episodeList) {
              if (episode.episode!.startsWith('S05')) {
                toReturn.add(episode);
              }
            }
            return toReturn;
          } else {
            throw (Exception(episodeResponse.error.toString()));
          }
        }
    }
    throw (Exception('Unable to find this season'));
  }

  @override
  Future<EpisodeDetailResponse> fetchEpisodeDetailResponse(int id) async {
    final episodeResponse = await episodeService.fetchEpisodeDetail(id);

    if (episodeResponse.isSuccessful) {
      final toReturn =
          EpisodeDetailResponse.fromJson(episodeResponse.body!.toString());
      return toReturn;
    } else {
      throw (Exception(episodeResponse.error.toString()));
    }
  }
}
