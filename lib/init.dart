import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pokemon/repo/repository_pokemon.dart';
import 'package:pokemon/repo/repository_pokemon_data.dart';
import 'package:pokemon/viewmodel/viewmodel_home.dart';

void _initHttp() => Get.put<Dio>(Dio());

void _initViewModels() {
  final RepositoryPokemonData _repoPokemonData =
      Get.find<RepositoryPokemonData>();

  Get.put<ViewModelHome>(
    ViewModelHome(repo: _repoPokemonData),
  );
}

void _initRepositories() {
  final Dio dio = Get.find<Dio>();

  Get.put<RepositoryPokemonData>(RepositoryPokemonData(dio));
  Get.put<RepositoryPokemon>(RepositoryPokemon(dio));
}

void init() {
  _initHttp();
  _initRepositories();
  _initViewModels();
}
