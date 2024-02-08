
import 'package:rick_and_morty_flutter_app/data/repositories/episodes_repository.dart';
import 'package:rick_and_morty_flutter_app/data/services/episodes_service.dart';
import 'package:rick_and_morty_flutter_app/models/episodes_response/episodes_response.dart';
import 'package:rick_and_morty_flutter_app/models/episodes_response/result.dart';

class EpisodesRespositoryImpl implements EpisodeRepository {
  final EpisodeService episodeService;
  
  EpisodesRespositoryImpl({required this.episodeService});

  @override
  Future<List<Result>> fetchEpisodesList() async {
    final episodeResponse = await episodeService.fetchEpisodesList();
    if(episodeResponse.isSuccessful){
      final episodeBody = episodeResponse.body!.toString();
      final episodeList = EpisodesResponse.fromJson(episodeBody).results!;
      return episodeList;
    }else{
      throw(Exception(episodeResponse.error.toString()));
    }
    
  }

}