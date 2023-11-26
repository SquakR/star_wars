import './gender.dart';

class Character {
  final String url;
  final String name;
  final Gender gender;
  final List<String> starshipUrls;
  final List<String> filmUrls;

  Character({
    required this.url,
    required this.name,
    required this.gender,
    required this.starshipUrls,
    required this.filmUrls,
  });
}
