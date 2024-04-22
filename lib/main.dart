import 'package:flutter/material.dart';
import 'package:pokemon/services/cubits/theme_cubit.dart';
import 'package:pokemon/views/home_screen.dart';
import 'exports.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    log('• Welcome to | ${Config.config.appTitle} | ${Config.config.appToken}');

    Bloc.observer = const AppObserver();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, modelTheme) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            theme: modelTheme ? darkTheme : lightTheme,
            debugShowCheckedModeBanner: false,
            title: Config.config.appTitle,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
