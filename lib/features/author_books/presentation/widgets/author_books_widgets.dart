import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

appBarForAuthorPage(BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.only(top: 20, left: 16),
      child: IconButton(
        onPressed: () {
          Routemaster.of(context).pop();
        },
        icon: const Icon(IconData(
          0xe092,
          fontFamily: 'MaterialIcons',
        )),
      ),
    ),
    title: const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'List Of Books',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}

apiError(){
  Padding(
    padding: const EdgeInsets.only(top: 197, left: 17, right: 17),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 62,
          height: 62,
          child: Image.asset('assets/icons/dead.png'),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
            "We couldn't retrieve data. Check your internet connection and try again",
            softWrap: true,
            textAlign: TextAlign.center,
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

