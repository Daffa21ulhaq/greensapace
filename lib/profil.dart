import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  int _currentIndex = 3; // Set initial index to 3 (for Profil)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengguna'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Avatar dan nama pengguna
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('asset/images/avatar.png'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Nama Pengguna',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'emailpengguna@mail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Informasi pengguna
              ListTile(
                leading: Icon(Icons.person, color: Colors.teal),
                title: Text('Nama Lengkap'),
                subtitle: Text('Nama Pengguna'),
                trailing: Icon(Icons.edit),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => _buildEditDialog(
                      context,
                      'Edit Nama Lengkap',
                      'Nama Pengguna',
                      'Masukkan nama lengkap baru',
                    ),
                  );
                },
              ),
              Divider(),

              ListTile(
                leading: Icon(Icons.email, color: Colors.teal),
                title: Text('Email'),
                subtitle: Text('emailpengguna@mail.com'),
                trailing: Icon(Icons.edit),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => _buildEditDialog(
                      context,
                      'Edit Email',
                      'emailpengguna@mail.com',
                      'Masukkan email baru',
                    ),
                  );
                },
              ),
              Divider(),

              ListTile(
                leading: Icon(Icons.phone, color: Colors.teal),
                title: Text('Nomor Telepon'),
                subtitle: Text('+62 812 3456 7890'),
                trailing: Icon(Icons.edit),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => _buildEditDialog(
                      context,
                      'Edit Nomor Telepon',
                      '+62 812 3456 7890',
                      'Masukkan nomor telepon baru',
                    ),
                  );
                },
              ),
              Divider(),

              SizedBox(height: 24),

              // Tombol Logout dan Pengaturan Akun
              ElevatedButton.icon(
                onPressed: () {
                  // Aksi logout
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Konfirmasi Logout'),
                      content: Text('Apakah Anda yakin ingin logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Tutup dialog
                          },
                          child: Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigasi ke halaman LoginScreen setelah logout
                            Navigator.of(context).pop(); // Tutup dialog
                            Navigator.pushReplacementNamed(context, '/login'); // Ganti dengan route login
                          },
                          child: Text('Logout'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.logout),
                label: Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set active index to 3 (for Profil)
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
            _currentIndex = index;
          });

          // Navigasi berdasarkan index yang dipilih
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/beranda');
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

              break;
            default:
              break;
          }
        },
      ),
    );
  }

  // Dialog untuk edit data profil
  Widget _buildEditDialog(BuildContext context, String title, String currentValue, String hint) {
    TextEditingController controller = TextEditingController(text: currentValue);
    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hint),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Tutup dialog
          },
          child: Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            // Aksi simpan perubahan
            print('Data baru: ${controller.text}');
            Navigator.of(context).pop(); // Tutup dialog
          },
          child: Text('Simpan'),
        ),
      ],
    );
  }
}
