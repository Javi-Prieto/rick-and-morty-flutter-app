part of 'episodes_bloc.dart';

@immutable
sealed class EpisodesEvent {}

final class EpisodesFetchEvent extends EpisodesEvent {}
