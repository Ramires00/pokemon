class AbilitiesDetails {
  AbilitiesDetails({
    String? name,
    String? url,
  })  : _name = name,
        _url = url;

  final String? _name;
  final String? _url;

  String get name => _name ?? "";
  String get url => _url ?? "";

  factory AbilitiesDetails.fromJson(Map json) => AbilitiesDetails(
        name: json['name'],
        url: json['url'],
      );
}
