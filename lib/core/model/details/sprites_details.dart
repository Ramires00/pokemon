class SpritesDetails {
  SpritesDetails({
    String? frontDefault,
    String? artwork,
  })  : _frontDefault = frontDefault,
        _artwork = artwork;

  final String? _frontDefault;
  final String? _artwork;

  String get frontDefault => _frontDefault ?? "";
  String get artwork => _artwork ?? "";

  factory SpritesDetails.fromJson(Map json) => SpritesDetails(
        frontDefault: json['front_default'],
        artwork: json['other']['official-artwork']['front_default'],
      );
}
