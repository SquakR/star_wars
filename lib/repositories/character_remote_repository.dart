import 'package:star_wars/api/api.dart' as api;
import 'package:star_wars/models/models.dart';

import './remote_repository.dart';

class CharacterRemoteRepository extends RemoteRepository<Character> {
  @override
  Future<Character> fetch(String uri) async {
    return await api.fetch(Uri.parse(uri), Character.fromJson);
  }

  @override
  Future<Iterable<Character>> fetchMany(String search, int page) async {
    return await api.fetchMany('/people', search, page, Character.fromJson);
  }
}
