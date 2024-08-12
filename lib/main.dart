import 'package:ball_squad/features/author_books/presentation/bloc/author_books_bloc.dart';
import 'package:ball_squad/features/author_search/presentation/bloc/author_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ball_squad/core/router/routes.dart' as r;
import 'package:routemaster/routemaster.dart';
import 'bloc_observer.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<AuthorSearchBloc>()),
        BlocProvider(create: (_) => locator<AuthorBooksBloc>()),
      ],
      child: MaterialApp.router(
        theme: ThemeData.light(),
        title: 'Ball squad',
        debugShowCheckedModeBanner: false,
        routeInformationParser: const RoutemasterParser(),
        routerDelegate: RoutemasterDelegate(
          routesBuilder: (context) => r.Routes.onBoardingCompleteRouteMap,
        ),
      ),
    );
  }
}
