import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_flutter_app/data/repositories/episodes_repository.dart';
import 'package:rick_and_morty_flutter_app/models/episodes_response/result.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final EpisodeRepository episodeRepository;
  EpisodesBloc(this.episodeRepository) : super(EpisodesInitial()) {
    on<EpisodesFetchEvent>(_onEpisodesFetch);
    on<EpisodesGoDetailEvent>(_onEpisodeClick);
  }

  void _onEpisodesFetch(
      EpisodesFetchEvent event, Emitter<EpisodesState> emit) async {
    try {
      final episodesResponse =
          await episodeRepository.fetchEpisodesList(event.season);
      emit(EpisodesFetched(episodesResponse));
      return;
    } on Exception catch (e) {
      emit(EpisodesFetchError(e.toString()));
    }
  }

  void _onEpisodeClick(
      EpisodesGoDetailEvent event, Emitter<EpisodesState> emit) {
    try {
      emit(EpisodesDetailClick(event.episodeId));
      return;
    } on Exception catch (e) {
      emit(EpisodesFetchError(e.toString()));
    }
  }
}
