import 'package:pokemon/core/data.dart';
import 'package:pokemon/core/interfaces/repository_path.dart';
import 'package:pokemon/core/model/pokemon_data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'repository_pokemon_data.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RepositoryPokemonData extends RepositoryPath<PokemonData> {
  factory RepositoryPokemonData(Dio dio, {String baseUrl}) =
      _RepositoryPokemonData;

  @override
  @GET("$endpointPokemonData?offset={arg}")
  Future<PokemonData> get(@Path() String arg);
}
