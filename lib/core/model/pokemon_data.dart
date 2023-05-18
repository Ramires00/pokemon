import 'package:pokemon/core/model/pokemon_metadata.dart';

class PokemonData {
  PokemonData({
    int? count,
    String? next,
    String? previous,
    List<PokemonMetadata>? pokemonMetadatas,
  })  : _count = count,
        _next = next,
        _previous = previous,
        _pokemonMetadatas = pokemonMetadatas;

  final int? _count;
  final String? _next;
  final String? _previous;
  final List<PokemonMetadata>? _pokemonMetadatas;

  int get count => _count ?? 0;
  String get next => _next ?? "";
  String get previous => _previous ?? "";
  List<PokemonMetadata> get pokemonMetadatas => _pokemonMetadatas ?? [];

  factory PokemonData.fromJson(Map json) => PokemonData(
        count: json['count'],
        next: json['next'],
        pokemonMetadatas: (json['results'] as List)
            .map(
              (pokemonMetadata) => PokemonMetadata.fromJson(pokemonMetadata),
            )
            .toList(),
        previous: json['previous'],
      );
}
