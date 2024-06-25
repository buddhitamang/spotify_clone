import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclone/model/playlist_provider.dart';
import 'package:spotifyclone/pages/song_page.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  late final PlaylistProvider playListProvider;

  @override
  void initState() {
    super.initState();
    playListProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  // Go to song
  void goToSong(int songIndex) {
    playListProvider.currentSongIndex = songIndex;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SongPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      final playlist = value.myArtists;

      final currentArtist = playlist[value.currentArtistIndex ?? 0];

      return Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Background Image
                  Container(
                    height: 280,
                    width: double.infinity,
                    color: Colors.black,
                    child: Image.asset(
                      currentArtist.artistImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Positioned back button
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left_sharp,
                      color: Colors.white,
                      size: 45,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Positioned(
                      top: 230,
                      left: 20,
                      child: Text(
                        currentArtist.artistName,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'List of Songs',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: currentArtist.songs.length,
                              itemBuilder: (context, index) {
                                final song = currentArtist.songs[index];
                                return GestureDetector(
                                  onTap: () {
                                    goToSong(index);
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          currentArtist.artistImage),
                                    ),
                                    title: Text(song.songName),
                                    trailing: IconButton(
                                      icon: Icon(Icons.favorite_border),
                                      onPressed: () {},
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
