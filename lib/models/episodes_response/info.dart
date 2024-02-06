import 'dart:convert';

class Info {
  int? count;
  int? pages;
  String? next;
  dynamic prev;

  Info({this.count, this.pages, this.next, this.prev});

  factory Info.fromMap(Map<String, dynamic> data) => Info(
        count: data['count'] as int?,
        pages: data['pages'] as int?,
        next: data['next'] as String?,
        prev: data['prev'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'count': count,
        'pages': pages,
        'next': next,
        'prev': prev,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Info].
  factory Info.fromJson(String data) {
    return Info.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Info] to a JSON string.
  String toJson() => json.encode(toMap());
}
