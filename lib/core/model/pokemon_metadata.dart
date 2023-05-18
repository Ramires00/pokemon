class PokemonMetadata {
  PokemonMetadata({
    String? name,
    String? url,
  })  : _name = name,
        _url = url;

  final String? _name;
  final String? _url;

  String get name => _name ?? "";
  String get url => _url ?? "";

  factory PokemonMetadata.fromJson(Map json) => PokemonMetadata(
        url: json['url'],
        name: json['name'],
      );
}
