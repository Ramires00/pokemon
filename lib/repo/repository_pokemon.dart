import 'package:pokemon/core/data.dart';
import 'package:pokemon/core/model/pokemon.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'repository_pokemon.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RepositoryPokemon {
  factory RepositoryPokemon(Dio dio, {String baseUrl}) = _RepositoryPokemon;

  @GET("$endpointPokemonData/{id}")
  Future<Pokemon> getPokemon(@Path() String id);
}
