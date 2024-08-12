import 'package:ball_squad/features/author_books/presentation/bloc/author_books_bloc.dart';
import 'package:ball_squad/features/author_books/presentation/widgets/author_books_widgets.dart';
import 'package:ball_squad/features/author_search/presentation/bloc/author_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorBooksScreen extends StatefulWidget {
  final int index;
  static const route='/author_books/:index';
  const AuthorBooksScreen(
      {super.key, required this.index});

  @override
  State<AuthorBooksScreen> createState() => _AuthorBooksScreenState();
}

class _AuthorBooksScreenState extends State<AuthorBooksScreen> {
  late String authorName;
  @override
  void initState() {
    final stateAuthorSearch=context.read<AuthorSearchBloc>().state;
    if(stateAuthorSearch is AuthorSearchLoaded){
      authorName=stateAuthorSearch.data[widget.index].name;
      context.read<AuthorBooksBloc>().add(FetchAuthorBooksEvent(authorId: stateAuthorSearch.data[widget.index].id));
    }
    else{
      authorName="Error";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarForAuthorPage(context),
      body: BlocBuilder<AuthorBooksBloc, AuthorBooksState>(
          builder: (context, state) {
        if (state is AuthorBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is AuthorBooksError) {
          return apiError();
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Text(
                    "$authorName's books:",
                    softWrap: true,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff262424),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text('$index: ${state.data[index - 1].title}',
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        color: Color(0xff262424),
                        fontSize: 15,
                      )),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: 16,
                  ),
              itemCount: state.data.length + 1),
        );
      }),
    );
  }
}
