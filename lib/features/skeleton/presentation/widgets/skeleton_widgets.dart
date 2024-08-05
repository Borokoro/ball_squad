import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/skeleton_cubit.dart';

appBarForAuthorPage(BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.only(top: 20, left: 16),
      child: IconButton(
        onPressed: () {
          context.read<SkeletonCubit>().goFromAuthorPage();
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
