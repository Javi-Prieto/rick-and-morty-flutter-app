import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_flutter_app/models/episodes_response/episodes_response.dart';
import 'package:rick_and_morty_flutter_app/models/episodes_response/result.dart';
import 'package:rick_and_morty_flutter_app/repositories/episodes_repository.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final EpisodeRepository episodeRepository;
  EpisodesBloc(this.episodeRepository) : super(EpisodesInitial()) {
    on<EpisodesEvent>((event, emit) {
      
    });
  }
  void _onEpisodesFetch(
    EpisodesFetchEvent event, Emitter<EpisodesState> emit
  ) async {
    try {
      final episodesResponse = await episodeRepository.fetchEpisodesList();
      final episodesInfo = EpisodesResponse.fromJson(episodesResponse.body!).results!;
      emit(EpisodesFetched(episodesInfo));
    } on Exception catch (e){
      emit(EpisodesFetchError(e.toString()));
    }
  }
}
