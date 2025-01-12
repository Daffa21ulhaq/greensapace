import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/chat': (context) => ChatScreen(), // Daftarkan ChatScreen
      },
      home: BerandaScreen(),
    );
  }
}

class BerandaScreen extends StatefulWidget {
  @override
  _BerandaScreenState createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  int _currentIndex = 0; // Set initial index to 0 (for Beranda)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(
            'asset/images/logo.png', // Ganti dengan path logo Anda
            height: 40,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome text
              Text(
                'Selamat datang, Pengguna!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 16),

              // Banner image
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('asset/images/banner.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Feature title
              Text(
                'Fitur Utama',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),

              // Feature grid
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                  return GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildFeatureCard(
                        context,
                        icon: Icons.video_library,
                        title: 'Video Edukasi',
                        routeName: '/video',
                      ),
                      _buildFeatureCard(
                        context,
                        icon: Icons.nature_people,
                        title: 'Komunitas',
                        routeName: '/komunitas',
                      ),
                      _buildFeatureCard(
                        context,
                        icon: Icons.water_damage,
                        title: 'Pelestarian Air',
                        routeName: '/pelestarian_air',
                      ),
                      _buildFeatureCard(
                        context,
                        icon: Icons.park,
                        title: 'Konservasi Alam',
                        routeName: '/konservasi_alam',
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 24),

              // Section: Latest Updates
              Text(
                'Update Terbaru',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),

              // List of updates or news
              _buildUpdateCard(
                context,
                title: 'Program Penanaman Pohon 2024',
                description: 'Bergabung dalam gerakan menanam 10.000 pohon di seluruh negeri.',
              ),
              SizedBox(height: 12),
              _buildUpdateCard(
                context,
                title: 'Pelatihan Pelestarian Air',
                description: 'Pelajari bagaimana cara menjaga sumber air bersih.',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
            label: 'Chat', // Ganti label menjadi Chat
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'kalkulator', // Ganti label menjadi Chat
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
            _currentIndex = index;
          });

          // Navigasi berdasarkan index yang dipilih
          switch (index) {
            case 0:
            // Already on BerandaScreen, no need to navigate
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/video');
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
      ),
    );
  }

  // Method to build the feature cards
  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon, required String title, required String routeName}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // Method to build the update cards
  Widget _buildUpdateCard(BuildContext context, {required String title, required String description}) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(description),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Tutup'),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen Chat yang sederhana
class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text('Fitur Chat belum tersedia.', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
