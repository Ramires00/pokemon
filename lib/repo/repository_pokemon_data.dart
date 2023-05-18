import 'package:pokemon/core/data.dart';
import 'package:pokemon/core/model/pokemon_data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'repository_pokemon_data.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RepositoryPokemonData {
  factory RepositoryPokemonData(Dio dio, {String baseUrl}) =
      _RepositoryPokemonData;

  @GET(endpointPokemonData)
  Future<PokemonData> getPokemonData();
}
