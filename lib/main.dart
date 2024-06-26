import 'package:flutter/material.dart';
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
    Bloc.observer = const AppObserver();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<PokemonHomeCubit>(create: (context) => PokemonHomeCubit()),
        BlocProvider<PokemonCubit>(create: (context) => PokemonCubit()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, modelTheme) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            theme: modelTheme ? darkTheme : lightTheme,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
