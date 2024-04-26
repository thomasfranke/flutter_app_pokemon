import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:toast/exports.dart';
import '/exports.dart';

class PokemonScreen extends StatefulWidget {
  final String pokemonName;
  final String imageUrl;
  const PokemonScreen({super.key, required this.pokemonName, required this.imageUrl});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

enum PokemonScreenIndex { overview, something }

class _PokemonScreenState extends State<PokemonScreen> {
  late final PokemonViewModel _viewModel;
  late final PokemonApiGet _apiGet;
  late Future<ApiModelsResponse> _apiData;

  @override
  void initState() {
    super.initState();
    _viewModel = PokemonViewModel(pokemonCubit: BlocProvider.of<PokemonCubit>(context));
    _apiGet = PokemonApiGet(
      pokemonCubit: BlocProvider.of<PokemonCubit>(context),
      fToast: FToast()..init(context),
    );
    _apiData = _apiGet.get(pokemonName: widget.pokemonName);
  }

  PokemonScreenIndex _index = PokemonScreenIndex.overview;

  Widget _pickScreen() {
    if (_index == PokemonScreenIndex.overview) {
      return PokemonOverviewTab(viewModel: _viewModel, imageUrl: widget.imageUrl);
    } else {
      return PokemonStatsTab(viewModel: _viewModel);
    }
  }

  Widget _navBar() {
    return SnakeNavigationBar.color(
      behaviour: SnakeBarBehaviour.pinned,
      snakeShape: SnakeShape.indicator,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      snakeViewColor: ConstantsColors.primary,
      selectedItemColor: Colors.white,
      unselectedItemColor: const Color(0xffedd4cf),
      backgroundColor: ConstantsColors.barBottom,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      height: 60,
      currentIndex: _index.index,
      onTap: (index) => setState(() => _index = PokemonScreenIndex.values[index]),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.format_align_center), label: "Overview"),
        BottomNavigationBarItem(icon: Icon(Icons.query_stats), label: "Stats"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      title: widget.pokemonName.toUpperCase()[0] + widget.pokemonName.substring(1),
      hasNavBar: true,
      bottomNavigationBar: _navBar(),
      body: WidgetsFutureBuilder(
        future: _apiData,
        alert: (message) => AlertWidget(message: message),
        button: ButtonWidget(
          onTap: () => setState(() {
            _apiData = _apiGet.get(pokemonName: widget.pokemonName);
          }),
          text: "Try Again",
        ),
        loadingIndicator: const LoadingIndicatorWidget(),
        builder: (BuildContext context, snapshot) {
          return _pickScreen();
        },
      ),
    );
  }
}
