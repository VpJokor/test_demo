import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../bean/Album.dart';

Future<Album> fetchAlbum() async {
  print("fetchAlbum");
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  print("Response code is ${response.statusCode}");
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
  print('fetchAlbum：Failed to load album');
  throw Exception('Failed to load album');
}
