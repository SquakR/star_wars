import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

typedef FromFunction<T> = T Function(Map<String, dynamic>);

const authority = 'swapi.dev';
const apiPrefix = 'api';

Future<T> fetch<T>(Uri uri, FromFunction<T> fromJson) async {
  final client = RetryClient(http.Client());
  try {
    final body = await client.read(uri);
    final decoded = jsonDecode(body);
    return fromJson(decoded);
  } finally {
    client.close();
  }
}

Future<Iterable<T>> fetchMany<T>(
  String path,
  String search,
  int page,
  FromFunction<T> fromJson,
) async {
  final client = RetryClient(http.Client());
  try {
    final body = await client.read(Uri.https(authority, '$apiPrefix/$path', {
      'search': search,
      'page': page.toString(),
    }));
    final results = jsonDecode(body)['results'] as List;
    return results.map((e) => fromJson(e)).toList();
  } finally {
    client.close();
  }
}
