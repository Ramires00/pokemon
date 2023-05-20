extension ExtString on String {
  String get pokemonImage {
    List<String> substringPokemon = split('pokemon');
    String pokemonId = substringPokemon[1].replaceAll('/', '');
    return "$pokemonId.png";
  }

  String get firstCapital => this[0].toUpperCase() + substring(1, length);
}
