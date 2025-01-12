import 'package:flutter/material.dart';

class PesanScreen extends StatefulWidget {
  @override
  _PesanScreenState createState() => _PesanScreenState();
}

class _PesanScreenState extends State<PesanScreen> {
  int _currentIndex = 2; // Set index ke 2 untuk halaman Buku Telepon

  // Contoh data kontak
  final List<Map<String, String>> _contacts = [
    {'name': 'daffa', 'phone': '081234567890'},
    {'name': 'dhia', 'phone': '082345678901'},
    {'name': 'ulhaq', 'phone': '083456789012'},
    {'name': 'Davis', 'phone': '084567890123'},
  ];

  void _addContact(String name, String phone) {
    setState(() {
      _contacts.add({'name': name, 'phone': phone});
    });
  }

  void _editContact(int index, String name, String phone) {
    setState(() {
      _contacts[index] = {'name': name, 'phone': phone};
    });
  }

  void _deleteContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  void _showContactDialog({int? index}) {
    String name = index != null ? _contacts[index]['name']! : '';
    String phone = index != null ? _contacts[index]['phone']! : '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'Tambah Kontak' : 'Edit Kontak'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nama'),
                onChanged: (value) => name = value,
                controller: TextEditingController(text: name),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Nomor Telepon'),
                keyboardType: TextInputType.phone,
                onChanged: (value) => phone = value,
                controller: TextEditingController(text: phone),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                if (index == null) {
                  _addContact(name, phone);
                } else {
                  _editContact(index, name, phone);
                }
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buku Telepon'),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/chat');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pushNamed(context, '/chat');
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _showContactDialog(index: index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteContact(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
