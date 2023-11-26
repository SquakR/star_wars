import './gender.dart';

class Character {
  final String uri;
  final String name;
  final Gender gender;
  final List<String> starshipUris;
  final List<String> filmUris;

  Character({
    required this.uri,
    required this.name,
    required this.gender,
    required this.starshipUris,
    required this.filmUris,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    final starshipUris = json['starships'] as List;
    final filmUris = json['films'] as List;
    return Character(
      uri: json['url'],
      name: json['name'],
      gender: Gender.values.firstWhere(
        (e) => e.toString() == 'Gender.${json['gender'].toLowerCase()}',
      ),
      starshipUris: starshipUris.map((e) => e as String).toList(),
      filmUris: filmUris.map((e) => e as String).toList(),
    );
  }
}
