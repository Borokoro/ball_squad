import 'package:ball_squad/features/author_search/presentation/bloc/author_search_bloc.dart';
import 'package:ball_squad/features/author_search/presentation/widgets/author_search_widgets.dart';
import 'package:ball_squad/features/skeleton/presentation/bloc/skeleton_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorSearchScreen extends StatefulWidget {
  const AuthorSearchScreen({super.key});

  @override
  State<AuthorSearchScreen> createState() => _AuthorSearchScreenState();
}

class _AuthorSearchScreenState extends State<AuthorSearchScreen> {
  TextEditingController authorSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorSearchBloc, AuthorSearchState>(
        builder: (context, state) {
      if (state is AuthorSearchLoading) {
        return Column(
          children: [
            authorSearchBarInitial(context, authorSearchController),
            const Expanded(
                child: Center(
                  child: SizedBox(
                      height: 41, width: 41, child: CircularProgressIndicator()),
                )
            ),
          ],
        );
      }
      if (state is AuthorSearchError) {
        return Center(
          child: Text('Error: ${state.message}'),
        );
      }
      if (state is AuthorSearchInitialState) {
        return Column(
          children: [
            authorSearchBarInitial(context, authorSearchController),
            initialStateView(),
          ],
        );
      }
      if (state is AuthorSearchLoaded) {
        if (state.data.isEmpty) {
          return Column(
            children: [
              searchBarLoaded(context, authorSearchController),
              noResultsFound(),
            ],
          );
        }
        return Column(
          children: [
            searchBarLoaded(context, authorSearchController),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          context.read<SkeletonCubit>().goToAuthorPage(state.data[index].id, state.data[index].name);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                            border: Border.all(
                                width: 2, color: Colors.black),
                          ),
                          child: SizedBox(
                            height: 183,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: authorDetails(
                                  index, context, state.data[index]),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                          height: 16,
                        ),
                    itemCount: state.data.length),
              ),
            ),
          ],
        );
      }
      return const Center(
        child: Text('Error'),
      );
    });
  }
}
