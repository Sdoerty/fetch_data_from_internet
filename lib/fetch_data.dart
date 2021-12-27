import 'dart:convert';

import 'package:fetch_data_from_internet/album.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async{
  final url = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
  final response = await http.get(url);
  if(response.statusCode == 200){
    return Album.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('Failed to load Album');
  }
}