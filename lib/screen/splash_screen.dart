import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yayasan/screen/dashboard_screen.dart';

<<<<<<< HEAD
import 'package:yayasan/screen/login_screen.dart';

=======
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
<<<<<<< HEAD
          builder: (context) => const LoginScreen1(),
=======
          builder: (context) => const DashboardScreen(),
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
        ),
        (route) => false,
      );
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 37, 105),
      body: SafeArea(
        // Di atas adalah warna latar belakang yang inginkan
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/aja.png',
                width: 120,
              ),
              const SizedBox(height: 8),
              Text(
                'YAYASAN',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: const Color.fromARGB(255, 241, 242, 243),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'AISYAH BERBAGI',
                style: GoogleFonts.poppins(
                  fontSize: 34,
                  color: const Color.fromARGB(255, 238, 240, 241),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
