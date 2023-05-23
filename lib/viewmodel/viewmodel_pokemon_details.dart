import 'package:get/get.dart';
import 'package:pokemon/core/interfaces/viewmodel.dart';
import 'package:pokemon/core/model/pokemon.dart';
import 'package:pokemon/usecase/usecase_get_pokemon.dart';

class ViewModelPokemonDetails extends GetxController with ViewModel<Pokemon> {
  ViewModelPokemonDetails({required UsecaseGetPokemon usecase}) : _usecase = usecase;

  final UsecaseGetPokemon _usecase;

  Pokemon pokemon = Pokemon();

  RxBool isLoading = RxBool(false);

  Future<Pokemon> fetchPokemon(String pokemonId) async => _usecase
      .execute(pokemonId)
      .then(
        (value) => pokemon = value,
      )
      .onError(onError)
      .whenComplete(() => isLoading.value = false);
}
