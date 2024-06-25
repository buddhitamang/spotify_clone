
import 'dart:ffi';

import 'package:spotifyclone/model/song.dart';

class Artist{
  late int id;
  late String artistName;
  late String artistImage;
  late List<Song> songs;

  Artist({required this.id,required this.artistName,required this.artistImage,required this.songs,});

  Artist.fromMap(Map<String, dynamic> map) {
    this.id=map['id'];
    this.artistName=map['artistName'];
    this.songs=map['songs'];
    this.artistImage=map['artistImage'];

  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': artistName,
      'songs': songs,
      'artistImage':artistImage,
    };
  }

}