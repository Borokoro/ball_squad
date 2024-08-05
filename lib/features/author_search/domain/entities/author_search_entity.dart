import 'package:equatable/equatable.dart';

class AuthorSearchEntity extends Equatable {
  final String name;
  final String birthDate;
  final String deathDate;
  final String topWork;
  final String id;

  const AuthorSearchEntity({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.deathDate,
    required this.topWork,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        birthDate,
        deathDate,
        topWork,
      ];
}
