abstract class RemoteRepository<T> {
  Future<T> fetch(String uri);
  Future<Iterable<T>> fetchMany(String search, int page);

  Stream<T> refetch(Iterable<String> uris) async* {
    for (final uri in uris) {
      yield await fetch(uri);
    }
  }
}
