part of 'episodes_bloc.dart';

@immutable
sealed class EpisodesEvent {}

final class EpisodesFetchEvent extends EpisodesEvent {
  final int season;
  EpisodesFetchEvent({required this.season});
}

final class EpisodesGoDetailEvent extends EpisodesEvent {
  final int episodeId;

  EpisodesGoDetailEvent({required this.episodeId});
}
