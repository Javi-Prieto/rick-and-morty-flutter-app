import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_flutter_app/data/repositories/episodes_repository.dart';
import 'package:rick_and_morty_flutter_app/models/episode_detail_response.dart';

part 'episodes_detail_event.dart';
part 'episodes_detail_state.dart';

class EpisodesDetailBloc
    extends Bloc<EpisodesDetailEvent, EpisodesDetailState> {
  final EpisodeRepository episodeRepository;
  EpisodesDetailBloc(this.episodeRepository) : super(EpisodesDetailInitial()) {
    on<EpisodesDetailFetchEvent>(_onEpisodeDetailFetch);
  }

  void _onEpisodeDetailFetch(EpisodesDetailFetchEvent event, Emitter<EpisodesDetailState> emit) async {
    try{
      final episodeDetailResponse = await episodeRepository.fetchEpisodeDetailResponse(event.episodeId);
      emit(EpisodeDetailFetched(episodeDetailResponse));
      return;
    }on Exception catch(e){
      emit(EpisodeDetailFetchError(e.toString()));
    }

  }
}
