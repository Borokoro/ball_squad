part of 'skeleton_cubit.dart';

class IsAuthorPage extends Equatable {
  final bool isAuthorPage;
  final String authorId;
  final String authorName;
  const IsAuthorPage({required this.isAuthorPage, this.authorId = '', this.authorName=''});

  @override
  List<Object> get props => [
    isAuthorPage,
  ];
}
