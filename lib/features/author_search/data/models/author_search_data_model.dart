import 'package:ball_squad/features/author_search/domain/entities/author_search_entity.dart';

class AuthorSearchDataModel extends AuthorSearchEntity {
  const AuthorSearchDataModel({
    required super.birthDate,
    required super.deathDate,
    required super.name,
    required super.topWork,
    required super.id,
  });

  factory AuthorSearchDataModel.fromApi(Map<String, dynamic> json) {
    return AuthorSearchDataModel(
      birthDate: json['birth_date'] ?? 'Not specified',
      deathDate: json['death_date'] ?? 'Still alive or not specified',
      name: json['name'] ?? 'Not specified',
      topWork: json['top_work'] ?? 'Not specified',
      id: json['key'] ?? 'No key',
    );
  }
}
