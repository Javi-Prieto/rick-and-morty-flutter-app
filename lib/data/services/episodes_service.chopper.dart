// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$EpisodeService extends EpisodeService {
  _$EpisodeService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = EpisodeService;

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

  @override
  Future<Response<dynamic>> fetchEpisodeDetail(int id) {
    final Uri $url = Uri.parse('episode/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
