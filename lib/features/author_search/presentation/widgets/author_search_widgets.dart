import 'package:ball_squad/features/author_search/data/models/author_search_data_model.dart';
import 'package:ball_squad/features/author_search/presentation/bloc/author_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

authorSearchBarInitial(
    BuildContext context, TextEditingController authorSearchController) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
    child: Container(
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: commonRowSearch(context, authorSearchController),
      ),
    ),
  );
}

commonRowSearch(
    BuildContext context, TextEditingController authorSearchController) {
  return Row(
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Icon(
          IconData(0xe567, fontFamily: 'MaterialIcons'),
          size: 20,
          color: Color(0xffcfcfcf),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: TextFormField(
          onFieldSubmitted: (searchController) {
            context.read<AuthorSearchBloc>().add(AuthorFetchSearchResultEvent(
                searchPhrase: authorSearchController.text));
          },
          controller: authorSearchController,
          decoration: const InputDecoration.collapsed(
            hintText: 'Search for an author',
            hintStyle: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xffb1b1b1),
            ),
          ),
        ),
      ),
    ],
  );
}

initialStateView() {
  return const Padding(
    padding: EdgeInsets.only(top: 197, left: 17, right: 17),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          IconData(
            0xe567,
            fontFamily: 'MaterialIcons',
          ),
          size: 80.0,
        ),
        Text('Start typing to find a particular author.',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
              color: Color(0xff262424),
              fontSize: 18,
            )),
      ],
    ),
  );
}

searchBarLoaded(
    BuildContext context, TextEditingController authorSearchController) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
    child: Row(
      children: [
        Container(
          width: 270,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: commonRowSearch(context, authorSearchController),
          ),
        ),
        Expanded(
          child: Center(
            child: TextButton(
                onPressed: () {
                  authorSearchController.text = "";
                  context
                      .read<AuthorSearchBloc>()
                      .add(const AuthorClearSearchResultEvent());
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Color(0xffb1b1b1),
                  ),
                )),
          ),
        ),
      ],
    ),
  );
}

noResultsFound() {
  return Padding(
    padding: const EdgeInsets.only(top: 197, left: 17, right: 17),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 62,
          height: 62,
          child: Image.asset('assets/icons/find.png'),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
            'There is no author with that name in our database. Check the spelling and try again.',
            softWrap: true,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
              color: Color(0xff262424),
              fontSize: 18,
            )),
      ],
    ),
  );
}

authorDetails(int index, BuildContext context,
    AuthorSearchDataModel authorSearchDataModel) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Name: ${authorSearchDataModel.name}',
        softWrap: true,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xff262424),
        ),
      ),
      Text(
        'Birth Date: ${authorSearchDataModel.birthDate}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xff262424),
        ),
      ),
      Text(
        'Death Date: ${authorSearchDataModel.deathDate}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xff262424),
        ),
      ),
      Text(
        'Top Work: ${authorSearchDataModel.topWork}',
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xff262424),
        ),
      ),
    ],
  );
}
