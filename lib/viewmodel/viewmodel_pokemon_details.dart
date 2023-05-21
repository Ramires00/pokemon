import 'package:get/get.dart';
import 'package:pokemon/core/model/pokemon.dart';
import 'package:pokemon/usecase/usecase_get_pokemon.dart';

class ViewModelPokemonDetails extends GetxController {
  ViewModelPokemonDetails({required UsecaseGetPokemon usecase})
      : _usecase = usecase;

  final UsecaseGetPokemon _usecase;

  Pokemon pokemon = Pokemon();

  Future<Pokemon> fetchPokemon(String pokemonId) async =>
      _usecase.execute(pokemonId).then(
            (value) => pokemon = value,
          );
}
