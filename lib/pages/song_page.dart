import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclone/model/playlist_provider.dart';
import '../components/neu_box.dart'; // Adjust import path as needed

class SongPage extends StatelessWidget {
  const SongPage({Key? key}) : super(key: key);

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      final playlist = value.myArtists;
      final currentArtist = playlist[value.currentArtistIndex ?? 0];
      final currentSongIndex = value.currentSongIndex ?? 0;
      final currentSong = currentArtist.songs[currentSongIndex];

      return Scaffold(
        backgroundColor:  Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.keyboard_arrow_left_outlined, size: 45),
                  ),
                  Text(
                    currentArtist.artistName,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color:  Theme.of(context).primaryTextTheme.headlineLarge?.color),
                  ),
                  Icon(Icons.menu),
                ],
              ),
              SizedBox(height: 10),
              // Album artwork
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  width: 400,
                  height: 400,
                  child: NeuBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        currentArtist.artistImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Song details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentSong.songName,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          currentArtist.artistName,
                          style: TextStyle(
                              fontSize: 15, color: Theme.of(context).primaryTextTheme.headlineMedium?.color),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        // Toggle favorite status of the song
                        // Implement your logic here
                      },
                      icon: Icon(Icons.favorite),
                      // Change color based on 'isLiked' state
                      // color: isLiked ? Colors.red : Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Playback controls
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                ),
                child: Slider(
                  min: 0,
                  max: value.totalDuration.inSeconds.toDouble(),
                  activeColor:  Theme.of(context).colorScheme.secondary,
                  value: value.currentDuration.inSeconds.toDouble(),
                  onChanged: (double newValue) {
                    // During when the user is sliding around
                  },
                  onChangeEnd: (double newValue) {
                    // Sliding has finished, go to that position in song duration
                    value.seek(Duration(seconds: newValue.toInt()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatDuration(value.currentDuration),style: TextStyle( color:Theme.of(context).primaryTextTheme.headlineSmall?.color),), // Display current time
                    Icon(Icons.shuffle),
                    Icon(Icons.repeat),
                    Text(formatDuration(value.totalDuration),style: TextStyle( color:Theme.of(context).primaryTextTheme.headlineSmall?.color),), // Display total duration
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Playback controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle skip previous
                      value.playPreviousSong();
                    },
                    child: NeuBox(
                      child: Icon(Icons.skip_previous),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      value.pauseOrResume();
                      // Handle play/pause
                    },
                    child: NeuBox(
                      child: value.isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle skip next
                      value.playNextSong();
                    },
                    child: NeuBox(
                      child: Icon(Icons.skip_next),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
