import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen1 extends StatelessWidget {
  const LoginScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void login() {
      // Implementasikan logika login di sini
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginScreen1(),
        ),
        (route) => false,
      );
    }

    void forgotPassword() {
      if (kDebugMode) {
        print('Lupa kata sandi ditekan');
      }
      // Implementasikan logika lupa kata sandi di sini
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 170, 194, 255),
                Color.fromRGBO(255, 255, 255, 1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
                bottom: 30), // Padding spesifik untuk setiap sisi
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/aja.png',
                      width: 60,
                      height: 70,
                    ),
                  ),
                  const SizedBox(height: 45),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'YAYASAN\n',
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: const Color.fromARGB(255, 0, 57, 133),
                            ),
                            children: const [
                              TextSpan(
                                text: 'AISYAH BERBAGI',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Color.fromARGB(255, 0, 57, 133),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Masuk untuk melanjutkan',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 57, 133),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // TextField Username
                        _buildInputField(
                          controller: usernameController,
                          hintText: 'Username',
                        ),
                        const SizedBox(height: 16.0),

                        // TextField Password
                        _buildInputField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),
                        const SizedBox(height: 16.0),

                        // Lupa Password

                        GestureDetector(
                          onTap: forgotPassword,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Lupa Kata Sandi ?',
                              style: GoogleFonts.manrope(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 0, 57, 133),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 70),

                        // Tombol Login
                        ElevatedButton(
                          onPressed: login,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 0, 57, 133),
                            foregroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                          child: Text(
                            'LOGIN',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Registrasi
                        GestureDetector(
                          onTap: () {
                            // Logika pendaftaran
                          },
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0xFF101317),
                              ),
                              children: const [
                                TextSpan(
                                  text: 'Belum punya akun ? ',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 172, 172, 172),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Daftar',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 57, 133),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Foto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Keuangan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Profil',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Tangani perubahan tab
        },
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // Mengubah radius border
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20), // Mengurangi padding
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(
              fontSize: 14.0), // Ganti ukuran font di sini jika perlu
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(
                fontSize: 14.0), // Ganti ukuran font hint di sini jika perlu
          ),
        ),
      ),
    );
  }
}
