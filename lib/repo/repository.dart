import 'package:pokemon/core/data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../core/model/pokemon_data.dart';

part 'repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(endpointPokemonData)
  Future<List<PokemonData>> getPokemonData();
}
