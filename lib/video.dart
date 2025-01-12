import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;

  // Daftar video yang akan ditampilkan dalam list
  final List<String> videoUrls = [
    'https://www.youtube.com/watch?v=Wtgqc_YvzpU',
    'https://www.youtube.com/watch?v=HPJKxAhLw5I',
    'https://www.youtube.com/watch?v=sAng2FwkZLE',
    'https://www.youtube.com/watch?v=mJJlkIbdkJE',
  ];

  int _currentIndex = 1;  // Set initial index ke Video

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrls[0])!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();  // Jangan lupa untuk dispose controller
    super.dispose();
  }

  // Method untuk membuat Bottom Navigation
  Widget buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,  // Menandakan halaman yang aktif
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library),
          label: 'Video',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'kalkulator',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profil',
        ),
      ],
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          _currentIndex = index;  // Mengubah index ketika dipilih
        });

        // Navigasi berdasarkan index yang dipilih
        switch (index) {
          case 0:
           Navigator.pushReplacementNamed(context, '/beranda');
            break;
          case 1:

            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/chat'); // Navigasi ke ChatScreen
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/kalkulator'); // Navigasi ke ChatScreen
            break;
          case 4:
            Navigator.pushReplacementNamed(context, '/profil');
            break;
          default:
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Edukasi'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // Youtube Video Player
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.teal,
            onReady: () {
              print("Player is ready.");
            },
          ),
          // Video List to choose from
          Expanded(
            child: ListView.builder(
              itemCount: videoUrls.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.play_circle_fill),
                  title: Text('Video ${index + 1}'),
                  onTap: () {
                    setState(() {
                      _controller.load(YoutubePlayer.convertUrlToId(videoUrls[index])!);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }
}