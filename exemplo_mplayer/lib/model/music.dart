class Music {
  // Atributos
  final String title;
  final String artist;
  final String url;

  // Construtir
  Music({required this.title, required this.artist, required this.url});

  // fromJson
  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      title: json['title'],
      artist: json['artist'],
      url: json['url'],
    );
  }
}
