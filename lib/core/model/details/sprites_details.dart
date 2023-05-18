class SpritesDetails {
  final String? frontDefault;
  SpritesDetails({this.frontDefault});
  factory SpritesDetails.fromJson(Map json) => SpritesDetails(
        frontDefault: json['front_default'],
      );
}