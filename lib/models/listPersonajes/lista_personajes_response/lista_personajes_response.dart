import 'dart:convert';

import 'info.dart';
import 'result.dart';

class ListaPersonajesResponse {
	Info? info;
	List<Result>? results;

	ListaPersonajesResponse({this.info, this.results});

	factory ListaPersonajesResponse.fromMap(Map<String, dynamic> data) {
		return ListaPersonajesResponse(
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
  /// Parses the string and returns the resulting Json object as [ListaPersonajesResponse].
	factory ListaPersonajesResponse.fromJson(String data) {
		return ListaPersonajesResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [ListaPersonajesResponse] to a JSON string.
	String toJson() => json.encode(toMap());
}
