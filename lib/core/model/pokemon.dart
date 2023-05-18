import 'package:pokemon/core/model/details/abilities_details.dart';
import 'package:pokemon/core/model/details/sprites_details.dart';
import 'package:pokemon/core/model/details/types_details.dart';

class PokemonData {
  PokemonData({
    int? id,
    String? name,
    int? height,
    int? weight,
    List<AbilitiesDetails>? abilities,
    List<SpritesDetails>? sprites,
    List<TypesDetails>? types,
  })  : _id = id,
        _name = name,
        _height = height,
        _weight = weight,
        _abilities = abilities,
        _sprites = sprites,
        _types = types;

  final int? _id;
  final String? _name;
  final int? _height;
  final int? _weight;
  final List<AbilitiesDetails>? _abilities;
  final List<SpritesDetails>? _sprites;
  final List<TypesDetails>? _types;

  int get id => _id ?? 0;
  String? get name => _name ?? "";
  int get height => _height ?? 0;
  int get weight => _weight ?? 0;
  List<AbilitiesDetails> get abilities => _abilities ?? [];
  List<SpritesDetails> get sprites => _sprites ?? [];
  List<TypesDetails> get types => _types ?? [];

  factory PokemonData.fromJson(Map json) => PokemonData(
        id: json['id'],
        name: json['name'],
        height: json['height'],
        weight: json['weight'],
        abilities: json['abilities']
            .map(
              (ability) => AbilitiesDetails.fromJson(ability),
            )
            .toList(),
        sprites: json['sprites']
            .map(
              (sprites) => SpritesDetails.fromJson(sprites),
            )
            .toList(),
        types: json['types']
            .map(
              (types) => TypesDetails.fromJson(types),
            )
            .toList(),
      );
}