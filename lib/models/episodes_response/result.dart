import 'dart:convert';

class Result {
  int? id;
  String? name;
  String? airDate;
  String? episode;
  List<String>? characters;
  String? url;
  DateTime? created;

  Result({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  factory Result.fromMap(Map<String, dynamic> data) => Result(
        id: data['id'] as int?,
        name: data['name'] as String?,
        airDate: data['air_date'] as String?,
        episode: data['episode'] as String?,
        characters: data['characters'] as List<String>?,
        url: data['url'] as String?,
        created: data['created'] == null
            ? null
            : DateTime.parse(data['created'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'air_date': airDate,
        'episode': episode,
        'characters': characters,
        'url': url,
        'created': created?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory Result.fromJson(String data) {
    return Result.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());
}
