import 'package:pokemon/core/model/details/abilities_details.dart';
import 'package:pokemon/core/model/details/sprites_details.dart';
import 'package:pokemon/core/model/details/types_details.dart';

class Pokemon {
  Pokemon({
    int? id,
    String? name,
    int? height,
    int? weight,
    List? abilities,
    SpritesDetails? sprites,
    List? types,
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
  final List? _abilities;
  final SpritesDetails? _sprites;
  final List? _types;

  int get id => _id ?? 0;
  String get name => _name ?? "";
  int get height => _height ?? 0;
  int get weight => _weight ?? 0;
  List get abilities => _abilities ?? [];
  SpritesDetails get sprites => _sprites ?? SpritesDetails();
  List get types => _types ?? [];

  factory Pokemon.fromJson(Map json) => Pokemon(
        id: json['id'],
        name: json['name'],
        height: json['height'],
        weight: json['weight'],
        abilities: json['abilities']
            .map(
              (ability) => AbilitiesDetails.fromJson(ability['ability']),
            )
            .toList(),
        sprites: SpritesDetails.fromJson(json['sprites']),
        types: json['types']
            .map(
              (types) => TypesDetails.fromJson(types['type']),
            )
            .toList(),
      );
}
