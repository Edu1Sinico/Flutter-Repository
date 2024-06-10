// ignore_for_file: prefer_const_constructors

import 'package:exemplo_mplayer/service/musicService.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MusicService _musicService = new MusicService();

  Future<void> listMusic() async {
    try {
      await _musicService.fetchListMusic();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Player"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: FutureBuilder(
              future: _musicService.fetchListMusic(),
              builder: (context, snapshot) {
                if (_musicService.listMusic.isNotEmpty) {
                  return ListView.builder(
                      itemCount: _musicService.listMusic.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_musicService.listMusic[index].title),
                          subtitle: Text(_musicService.listMusic[index].artist),
                        );
                      });
                }
              }),
        ),
      ), //Future.builder
    );
  }
}
