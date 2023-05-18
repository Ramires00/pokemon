import 'package:pokemon/core/data.dart';
import 'package:pokemon/core/interfaces/repository_path.dart';
import 'package:pokemon/core/model/pokemon.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'repository_pokemon.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RepositoryPokemon extends RepositoryPath<Pokemon> {
  factory RepositoryPokemon(Dio dio, {String baseUrl}) = _RepositoryPokemon;

  @override
  @GET("$endpointPokemonData/{arg}")
  Future<Pokemon> get(@Path() String arg);
}
