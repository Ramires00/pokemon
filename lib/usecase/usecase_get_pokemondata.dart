import 'package:pokemon/core/interfaces/usecase.dart';
import 'package:pokemon/core/model/pokemon_data.dart';
import 'package:pokemon/repo/repository_pokemon_data.dart';

class UsecaseGetPokemonData implements Usecase<PokemonData> {
  UsecaseGetPokemonData({required this.repo});

  final RepositoryPokemonData repo;

  PokemonData data = PokemonData();

  @override
  Future<PokemonData> execute([dynamic args]) => repo.get(args).then<PokemonData>(
        onExecuteReturn,
      );

  Future<PokemonData> onExecuteReturn(PokemonData newValueFetched) async {
    data = newValueFetched;
    return newValueFetched;
  }
}
