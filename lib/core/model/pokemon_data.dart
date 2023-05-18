class PokemonData {
  PokemonData({
    int? id,
    String? name,
    int? baseExperience,
    int? height,
    bool? isDefault,
    int? order,
    int? weight,
    List<AbilitiesDetails>? abilities,
    List<MovesDetails>? moves,
    List<SpritesDetails>? sprites,
    List<TypesDetails>? types,
  })  : _id = id,
        _name = name,
        _baseExperience = baseExperience,
        _height = height,
        _isDefault = isDefault,
        _order = order,
        _weight = weight,
        _abilities = abilities,
        _moves = moves,
        _sprites = sprites,
        _types = types;

  final int? _id;
  final String? _name;
  final int? _baseExperience;
  final int? _height;
  final bool? _isDefault;
  final int? _order;
  final int? _weight;
  final List<AbilitiesDetails>? _abilities;
  final List<MovesDetails>? _moves;
  final List<SpritesDetails>? _sprites;
  final List<TypesDetails>? _types;

  int get id => _id ?? 0;
  String? get name => _name ?? "";
  int get baseExperience => _baseExperience ?? 0;
  int get height => _height ?? 0;
  bool get isDefault => _isDefault ?? false;
  int get order => _order ?? 0;
  int get weight => _weight ?? 0;
  List<AbilitiesDetails> get abilities => _abilities ?? [];
  List<MovesDetails> get moves => _moves ?? [];
  List<SpritesDetails> get sprites => _sprites ?? [];
  List<TypesDetails> get types => _types ?? [];

  factory PokemonData.fromJson(Map json) => PokemonData(
        id: json['id'],
        name: json['name'],
        baseExperience: json['baseExperience'],
        height: json['height'],
        isDefault: json['isDefault'],
        order: json['order'],
        weight: json['weight'],
        abilities: json['abilities']
            .map(
              (ability) => AbilitiesDetails.fromJson(ability),
            )
            .toList(),
        moves: json['moves']
            .map(
              (moves) => MovesDetails.fromJson(moves),
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

class AbilitiesDetails {
  AbilitiesDetails();

  factory AbilitiesDetails.fromJson(Map json) => AbilitiesDetails();
}

class MovesDetails {
  MovesDetails();
  factory MovesDetails.fromJson(Map json) => MovesDetails();
}

class SpritesDetails {
  final String? frontDefault;
  SpritesDetails({this.frontDefault});
  factory SpritesDetails.fromJson(Map json) => SpritesDetails(
        frontDefault: json['front_default'],
      );
}

class TypesDetails {
  TypesDetails();
  factory TypesDetails.fromJson(Map json) => TypesDetails();
}
