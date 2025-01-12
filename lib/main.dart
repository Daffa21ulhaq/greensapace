import 'package:flutter/material.dart';
import 'login.dart'; // Import file login.dart
import 'beranda.dart'; // Import file beranda.dart
import 'profil.dart' as profil_lib; // Import file profil.dart
import 'video.dart' as vidio_lib; // Import file video.dart
import 'chat.dart' as chat_lib; // Import file chat.dart
import 'kalkulator.dart'; // Import file kalkulator.dart
import 'berat.dart'; // Import file kalkulator_berat.dart
import 'suhu.dart'; // Import file kalkulator_suhu.dart
import 'uang.dart'; // Import file kalkulator_uang.dart
import 'dasar.dart'; // Import file kalkulator_dasar.dart
import 'pesan.dart'; // Import file pesan.dart
import 'surat.dart'; // Import file surat.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/', // Rute awal saat aplikasi dijalankan
      routes: <String, WidgetBuilder>{
        '/': (context) => const SplashScreen(), // Rute splash screen
        '/login': (context) => LoginScreen(), // Rute untuk LoginScreen
        '/beranda': (context) => BerandaScreen(), // Rute untuk BerandaScreen
        '/profil': (context) => profil_lib.ProfilScreen(), // Rute untuk ProfilScreen
        '/video': (context) => vidio_lib.VideoScreen(), // Rute untuk VideoScreen
        '/chat': (context) => chat_lib.ChatScreen(), // Rute untuk ChatScreen
        '/kalkulator': (context) => KalkulatorScreen(), // Rute untuk KalkulatorScreen
        '/kalkulator_berat': (context) => KonversiBeratScreen(), // Rute untuk Kalkulator Berat
        '/kalkulator_suhu': (context) => KonversiSuhuScreen(), // Rute untuk Kalkulator Suhu
        '/kalkulator_uang': (context) => KonversiMataUangScreen(), // Rute untuk Kalkulator Uang
        '/kalkulator_dasar': (context) => KalkulatorDasarScreen(), // Rute untuk Kalkulator Dasar
        '/pesan': (context) => PesanScreen(), // Rute untuk PesanScreen
        '/surat': (context) => SuratScreen(), // Rute untuk SuratScreen
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/logo.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'GREENSPACE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'by dioda grup',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
