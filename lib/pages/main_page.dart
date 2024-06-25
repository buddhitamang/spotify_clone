import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclone/components/best_artists_page.dart';
import 'package:spotifyclone/components/conainter.dart';
import 'package:spotifyclone/components/episodes_page.dart';
import 'package:spotifyclone/components/main_container.dart';
import 'package:spotifyclone/model/artist.dart';
import 'package:spotifyclone/model/playlist_provider.dart';
import 'package:spotifyclone/pages/playlist_page.dart';

import '../components/favorite_artists.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List artists = [
    ['Arijit Singh', 'assets/images/arijitsingh.jpeg'],
    ['Sushant KC', 'assets/images/sushant.jpg'],
    ['Lewis Capaldi', 'assets/images/lewis.jpg'],
    ['Sajjan Raj Vaidhya', 'assets/images/sajjan.jpg'],
  ];

  final List episodes = [
    [
      'assets/images/ep1.jpg',
      'Why did it take 56 years and is the main charactoer of the',
      'Maha bharat with'
    ],
    ['assets/images/ep2.jpg', 'From the universe', 'Chanakya Niti '],
    ['assets/images/ep3.jpeg', 'One piece', 'calm it down'],
    ['assets/images/ep4.jpg', 'The Crown Queen', 'Silsia ye chaahat ka'],
  ];

  final List bestArtists = [
    ['assets/images/arijit.jpeg', 'Arijit Singh, pritam,', 'Anirudh Ravichander,'],
    ['assets/images/taylor.png', 'The essential tracks, all in', 'one playlist. '],
    [
      'assets/images/novo.jpg',
      'This is Lewis Capaldi',
      'essential tracks, all i on ..'
    ],
    [
      'assets/images/ep4.jpg',
      'This is Sajjan Raj Vaidya',
      'The essential tracks, all i...'
    ],
  ];

  late final dynamic playListProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get playlist provider'
    playListProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  //navigate to playlistpage
  void navigatePlayList(int songIndex) {
    playListProvider.currentArtistIndex = songIndex;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PlaylistPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('B'),
            ),
            SizedBox(
              width: 8,
            ),
            ContainerPage(
              text: 'All',
              color: Colors.green,
            ),
            SizedBox(
              width: 8,
            ),
            ContainerPage(
              text: 'Music',
              color: Colors.grey.shade700,
            ),
            SizedBox(
              width: 8,
            ),
            ContainerPage(
              text: 'Podcasts',
              color: Colors.grey.shade700,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.white24,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music_sharp), label: 'Your Library'),
          BottomNavigationBarItem(
              icon: Icon(Icons.workspace_premium), label: 'Premium'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainContainer(
              firstName: 'Anuv jain',
              secondName: 'Arijit Singh',
              image1: 'assets/images/anuv.jpeg',
              image2: 'assets/images/arijitsingh.jpeg',
            ),
            MainContainer(
              firstName: 'Sajan Raj ',
              secondName: 'Novo Amor',
              image1: 'assets/images/sajjan.jpg',
              image2: 'assets/images/novo.jpg',
            ),
            MainContainer(
              firstName: 'Anuv Jain Mix',
              secondName: 'Lewis Capaldi ',
              image1: 'assets/images/anuv.jpeg',
              image2: 'assets/images/lewis.jpg',
            ),
            MainContainer(
              firstName: 'Sajan Raj Mix',
              secondName: 'On PUrpose',
              image1: 'assets/images/sajjan.jpg',
              image2: 'assets/images/ep2.jpg',
            ),
            SizedBox(
              height: 18,
            ),
            Container(
                height: 200,
                child: Consumer<PlaylistProvider>(
                  builder: (BuildContext context, PlaylistProvider value,
                      Widget? child) {
                    final List<Artist> myArtists = value.myArtists;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your favourite artists',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: artists.length,
                                itemBuilder: (context, index) {
                                  final Artist artist = myArtists[index];
                                  return GestureDetector(
                                    onTap: () {
                                      navigatePlayList(index);
                                    },
                                    child: FavoriteArtists(
                                      name: artist.artistName,
                                      image: artist.artistImage,
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  },
                )),
            Container(
              height: 260,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Episodes for you',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: episodes.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              child: EpisodesPage(
                                text1: episodes[index][1],
                                image: episodes[index][0],
                                text2: episodes[index][2],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 260,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Best of artists',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: bestArtists.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              child: BestArtistsPage(
                                text1: bestArtists[index][1],
                                image: bestArtists[index][0],
                                text2: bestArtists[index][2],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
