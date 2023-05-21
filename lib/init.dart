import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pokemon/repo/repository_pokemon.dart';
import 'package:pokemon/repo/repository_pokemon_data.dart';
import 'package:pokemon/usecase/usecase_get_pokemon.dart';
import 'package:pokemon/usecase/usecase_get_pokemondata.dart';
import 'package:pokemon/viewmodel/viewmodel_home.dart';
import 'package:pokemon/viewmodel/viewmodel_pokemon_details.dart';

void _initHttp() => Get.put<Dio>(Dio());

void _initViewModels() {
  final UsecaseGetPokemonData usecasePokemonData =
      Get.find<UsecaseGetPokemonData>();
  final UsecaseGetPokemon usecasePokemon = Get.find<UsecaseGetPokemon>();

  Get.put<ViewModelHome>(
    ViewModelHome(usecase: usecasePokemonData),
  );
  Get.put<ViewModelPokemonDetails>(
    ViewModelPokemonDetails(usecase: usecasePokemon),
  );
}

void _initRepositories() {
  final Dio dio = Get.find<Dio>();

  Get.put<RepositoryPokemonData>(RepositoryPokemonData(dio));
  Get.put<RepositoryPokemon>(RepositoryPokemon(dio));
}

void _initUsecases() {
  final RepositoryPokemonData repoPokemonData =
      Get.find<RepositoryPokemonData>();
  final RepositoryPokemon repoPokemon = Get.find<RepositoryPokemon>();

  Get.put<UsecaseGetPokemonData>(
    UsecaseGetPokemonData(repo: repoPokemonData),
  );

  Get.put<UsecaseGetPokemon>(
    UsecaseGetPokemon(repo: repoPokemon),
  );
}

void init() {
  _initHttp();
  _initRepositories();
  _initUsecases();
  _initViewModels();
}
