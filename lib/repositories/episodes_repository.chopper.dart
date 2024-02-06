// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_repository.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$EpisodeRepository extends EpisodeRepository {
  _$EpisodeRepository([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = EpisodeRepository;

  @override
  Future<Response<dynamic>> fetchEpisodesList() {
    final Uri $url = Uri.parse('episode/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
