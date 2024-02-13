part of 'episodes_detail_bloc.dart';

@immutable
sealed class EpisodesDetailState {}

final class EpisodesDetailInitial extends EpisodesDetailState {}

final class EpisodeDetailFetched extends EpisodesDetailState {
  final EpisodeDetailResponse episode;
  EpisodeDetailFetched(this.episode);
}

final class EpisodeDetailFetchError extends EpisodesDetailState{
  final String messageError;
  EpisodeDetailFetchError(this.messageError);
}

