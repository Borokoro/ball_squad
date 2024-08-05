import 'package:ball_squad/features/author_books/presentation/pages/author_books_screen.dart';
import 'package:ball_squad/features/author_search/presentation/pages/author_search_screen.dart';
import 'package:ball_squad/features/skeleton/presentation/bloc/skeleton_cubit.dart';
import 'package:ball_squad/features/skeleton/presentation/widgets/skeleton_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkeletonCubit, IsAuthorPage>(
        builder: (context, state){
          return Scaffold(
            appBar: state.isAuthorPage ? appBarForAuthorPage(context) : null,
            body: SafeArea(
              child: state.isAuthorPage ? AuthorBooksScreen(authorId: state.authorId, authorName: state.authorName) : const AuthorSearchScreen(),
            ),
          );
        }
    );
  }
}
