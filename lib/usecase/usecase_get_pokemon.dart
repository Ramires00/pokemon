import 'package:pokemon/core/interfaces/usecase.dart';
import 'package:pokemon/core/model/pokemon.dart';
import 'package:pokemon/repo/repository_pokemon.dart';

class UsecaseGetPokemon implements Usecase<Pokemon> {
  UsecaseGetPokemon({required this.repo});

  final RepositoryPokemon repo;

  Pokemon data = Pokemon();

  @override
  Future<Pokemon> execute([dynamic args]) => repo.get(args).then<Pokemon>(
        onExecuteReturn,
      );

  Future<Pokemon> onExecuteReturn(Pokemon newValueFetched) async {
    data = newValueFetched;
    return newValueFetched;
  }
}
