part of 'episodes_detail_bloc.dart';

@immutable
sealed class EpisodesDetailEvent {}

final class EpisodesDetailFetchEvent extends EpisodesDetailEvent {
  final int episodeId;
  EpisodesDetailFetchEvent({required this.episodeId});
}
