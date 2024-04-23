import 'package:flutter/material.dart';
import 'package:pokemon/cubits/pokemon_home_cubit.dart';
import 'package:pokemon/cubits/pokemon_cubit.dart';
// import 'package:pokemon/cubits/pokemon_list_cubit.dart';
import 'package:pokemon/cubits/theme_cubit.dart';
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
    log('• Welcome to PokeGuide');

    Bloc.observer = const AppObserver();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<PokemonHomeCubit>(create: (context) => PokemonHomeCubit()),
        // BlocProvider<PokemonListCubit>(create: (context) => PokemonListCubit()),
        BlocProvider<PokemonCubit>(create: (context) => PokemonCubit()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, modelTheme) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            theme: modelTheme ? darkTheme : lightTheme,
            debugShowCheckedModeBanner: false,
            title: "PokeGuide",
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
