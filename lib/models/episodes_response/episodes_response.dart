import 'dart:convert';

import 'info.dart';
import 'result.dart';

class EpisodesResponse {
  Info? info;
  List<Result>? results;

  EpisodesResponse({this.info, this.results});

  factory EpisodesResponse.fromMap(Map<String, dynamic> data) {
    return EpisodesResponse(
      info: data['info'] == null
          ? null
          : Info.fromMap(data['info'] as Map<String, dynamic>),
      results: (data['results'] as List<dynamic>?)
          ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'info': info?.toMap(),
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EpisodesResponse].
  factory EpisodesResponse.fromJson(String data) {
    return EpisodesResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EpisodesResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
