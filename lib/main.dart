import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const TowingKuApp());
}

class TowingKuApp extends StatelessWidget {
  const TowingKuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TowingKu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),  // <-- halaman pertama harus login
    );
  }
}
