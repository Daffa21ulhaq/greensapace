import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _currentIndex = 2; // Set index ke 2 untuk halaman Buku Telepon

  // Contoh data kontak
  final List<Map<String, String>> _contacts = [
    {'name': 'Daffa', 'phone': '081234567890'},
    {'name': 'Dhia', 'phone': '082345678901'},
    {'name': 'Ulhaq', 'phone': '083456789012'},
    {'name': 'Davis', 'phone': '084567890123'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buku Telepon'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/pesan'); // Navigasi ke pesan.dart
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_placeholder.png'),
              backgroundColor: Colors.transparent,
            ),
            title: Text(_contacts[index]['name']!),
            subtitle: Text(_contacts[index]['phone']!),
            onTap: () {
              // Navigasi ke halaman SuratScreen dengan data nama kontak
              Navigator.pushNamed(
                context,
                '/surat',
                arguments: {
                  'contactName': _contacts[index]['name'],
                },
              );
            },
          );
        },
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
            icon: Icon(Icons.contact_phone),
            label: 'Buku Telepon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Kalkulator',
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

          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/beranda');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/video');
              break;
            case 2:
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/kalkulator');
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
}
