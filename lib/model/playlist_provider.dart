import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotifyclone/model/artist.dart';
import 'package:spotifyclone/model/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Artist> _myArtists = [
    Artist(
      id: 1,
      artistName: 'Unknown Playlist',
      artistImage: 'assets/images/billie.jpg',
      songs: [
        Song(songName: 'Bahara', songAudio: 'audios/unknown/Bahara.mp3'),
        Song(songName: 'Bujhne Lai', songAudio: 'audios/unknown/Bujhne Lai.mp3'),
        Song(songName: 'O mahi', songAudio: 'audios/unknown/HUSN.mp3'),
      ],
    ),
    Artist(
      id: 2,
      artistName: 'Swoopna Suman',
      artistImage: 'assets/images/swoopna.jpeg',
      songs: [
        Song(songName: 'jhyal bata', songAudio: 'audios/sopnil_songs/jyotsna.mp3'),
        Song(songName: 'Parkha Na', songAudio: 'audios/sopnil_songs/niyali hera.mp3'),
        Song(songName: 'Sarangi', songAudio: 'audios/sopnil_songs/timro ankha.mp3'),
      ],
    ),
    Artist(
      id: 3,
      artistName: 'Lewis Capaldi',
      artistImage: 'assets/images/lewis.jpg',
      songs: [
        Song(songName: 'Someone You Loved', songAudio: 'audios/lewis_songs/before you go.mp3'),
        Song(songName: 'Wish You The Best', songAudio: 'audios/lewis_songs/say you wont le it go.mp3'),
        Song(songName: 'Hold Me While You Wait', songAudio: 'audios/lewis_songs/someone you loved.mp3'),
      ],
    ),
    Artist(
      id: 4,
      artistName: 'Sajjan Raj Vaidhya',
      artistImage: 'assets/images/sajjan.jpg',
      songs: [
        Song(songName: 'Sasto Mutu', songAudio: 'audios/sajjan_songs/hyateri.mp3'),
        Song(songName: 'Chitthi Bhitra', songAudio: 'audios/sajjan_songs/sasto mutu.mp3'),
        Song(songName: 'Mooskaan', songAudio: 'audios/sajjan_songs/suna kanchi.mp3'),
      ],
    ),
  ];

  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _currentArtistIndex;
  int? _currentSongIndex;

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;


  PlaylistProvider() {
    listenToDuration();
  }

  //Initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    if (_currentArtistIndex != null && _currentSongIndex != null) {
      final String path = _myArtists[_currentArtistIndex!].songs[_currentSongIndex!].songAudio;
      await _audioPlayer.stop(); //stop current song
      await _audioPlayer.play(AssetSource(path));
      _audioPlayer.setVolume(1.0);
      _isPlaying = true;
      notifyListeners();
    }
  }

  //pause the song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  //seek to specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong() {
    if (_currentSongIndex != null && _currentArtistIndex != null) {
      if (_currentSongIndex! < _myArtists[_currentArtistIndex!].songs.length - 1) {
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
  }

  //play previous song
  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      await _audioPlayer.seek(Duration.zero);
    } else {
      if (_currentSongIndex != null && _currentArtistIndex != null) {
        if (_currentSongIndex! > 0) {
          currentSongIndex = _currentSongIndex! - 1;
        } else {
          currentSongIndex = _myArtists[_currentArtistIndex!].songs.length - 1;
        }
      }
    }
  }

  //listen to duration
  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  List<Artist> get myArtists => _myArtists;
  int? get currentArtistIndex => _currentArtistIndex;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;


  set currentSongIndex(int? newIndex) {
    if (newIndex == _currentSongIndex && _isPlaying) {
      // If clicking the same song and it's already playing, do nothing
      return;
    }

    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play(); // Play the song at the new index
    }
    notifyListeners();
  }



  set currentArtistIndex(int? newIndex) {
    _currentArtistIndex = newIndex;
    if (newIndex != null) {
      _currentSongIndex = 0; // Start with the first song of the new artist
      //play(); //play the song at the new index
    }
    notifyListeners();
  }
}
