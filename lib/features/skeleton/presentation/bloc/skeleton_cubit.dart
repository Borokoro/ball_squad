import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'skeleton_state.dart';

class SkeletonCubit extends Cubit<IsAuthorPage> {
  SkeletonCubit() : super(const IsAuthorPage(isAuthorPage: false));

  void goToAuthorPage(String id, String authorName) {
    emit(IsAuthorPage(isAuthorPage: true, authorId: id, authorName: authorName));
  }

  void goFromAuthorPage() {
    emit(const IsAuthorPage(isAuthorPage: false));
  }

}
