import "package:flutter/material.dart";
import "package:yayasan/screen/dashboard_screen.dart";
<<<<<<< HEAD
import "package:yayasan/screen/splash_screen.dart";

=======
import "package:yayasan/screen/login_screen.dart";
import "package:yayasan/screen/modal_screent.dart";
import "package:yayasan/screen/splash_screen.dart";
import "package:yayasan/screen/galeri_dart.dart";
import "package:yayasan/screen/profil_dart.dart";
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yayasan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 61, 36, 105)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: SplashScreen(),
=======
      home: const ProfilScreen(),
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
    );
  }
}
