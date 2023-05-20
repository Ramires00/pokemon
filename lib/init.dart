import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pokemon/repo/repository_pokemon.dart';
import 'package:pokemon/repo/repository_pokemon_data.dart';
import 'package:pokemon/usecase/usecase_get_pokemondata.dart';
import 'package:pokemon/viewmodel/viewmodel_home.dart';

void _initHttp() => Get.put<Dio>(Dio());

void _initViewModels() {
  final UsecaseGetPokemonData usecasePokemonData = Get.find<UsecaseGetPokemonData>();

  Get.put<ViewModelHome>(
    ViewModelHome(usecase: usecasePokemonData),
  );
}

void _initRepositories() {
  final Dio dio = Get.find<Dio>();

  Get.put<RepositoryPokemonData>(RepositoryPokemonData(dio));
  Get.put<RepositoryPokemon>(RepositoryPokemon(dio));
}

void _initUsecases() {
  final RepositoryPokemonData repoPokemonData = Get.find<RepositoryPokemonData>();

  Get.put<UsecaseGetPokemonData>(
    UsecaseGetPokemonData(repo: repoPokemonData),
  );
}

void init() {
  _initHttp();
  _initRepositories();
  _initUsecases();
  _initViewModels();
}
