import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:exemplo_mplayer/model/music.dart';

class MusicService {
  final Uri Url = "http://URL_JSON.com" as Uri;

  List<Music> _listMusic = [];
  List<Music> get listMusic => _listMusic;

  // Fetch lista de músicas
  Future<List<Music>> fetchListMusic() async {
    final response = await http.get(Url);
    if (response.statusCode == 200) {
      _listMusic = json
          .decode(response.body)
          .map<Music>((item) => Music.fromJson(item))
          .toList();
    }
    return _listMusic;
  }
}
