part of 'episodes_bloc.dart';

@immutable
sealed class EpisodesState {
  final List<Result> episodes;
  const EpisodesState({
    this.episodes = const <Result>[],
  }); 
}

final class EpisodesInitial extends EpisodesState {}

final class EpisodesFetched extends EpisodesState {
  final List<Result> episodes;
  const EpisodesFetched(this.episodes);
}

final class EpisodesFetchError extends EpisodesState {
  final String messageError;
  const EpisodesFetchError(this.messageError);
}