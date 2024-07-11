import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:yayasan/screen/admin_page.dart';
import 'package:yayasan/screen/dashboard_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({Key? key}) : super(key: key);

  @override
  State<LoginScreen1> createState() {
    return _LoginScreen1State();
  }
}

class _LoginScreen1State extends State<LoginScreen1> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscureText = true;

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your username and password')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    const url = 'http://10.11.9.6:8080/api/auth/login';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      final user = data['user'];
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('token', token);
      await prefs.setString('user', jsonEncode(user));

      if (user['username'] == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashScreen()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
=======

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

>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 170, 194, 255),
<<<<<<< HEAD
                Color.fromRGBO(255, 255, 255, 255),
=======
                Color.fromRGBO(255, 255, 255, 1),
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
              ],
            ),
          ),
          child: Padding(
<<<<<<< HEAD
            padding:
                const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
=======
            padding: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
                bottom: 30), // Padding spesifik untuk setiap sisi
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
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
<<<<<<< HEAD
                        TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                          labelText: 'Username',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          )
                          ),
=======
                        _buildInputField(
                          controller: usernameController,
                          hintText: 'Username',
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
                        ),
                        const SizedBox(height: 16.0),

                        // TextField Password
<<<<<<< HEAD
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),

                        // Lupa Password
                        GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('Lupa kata sandi ditekan');
                            }
                          },
=======
                        _buildInputField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),
                        const SizedBox(height: 16.0),

                        // Lupa Password

                        GestureDetector(
                          onTap: forgotPassword,
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
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
<<<<<<< HEAD
                        _isLoading
                          ? const CircularProgressIndicator()

                        : ElevatedButton(
                          onPressed: _login,
=======
                        ElevatedButton(
                          onPressed: login,
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
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
<<<<<<< HEAD
                                  'LOGIN',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
=======
                            'LOGIN',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
                        ),
                        const SizedBox(height: 16),

                        // Registrasi
                        GestureDetector(
                          onTap: () {
<<<<<<< HEAD
                            // Implement your registration logic here
=======
                            // Logika pendaftaran
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
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
<<<<<<< HEAD
=======
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
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
    );
  }
}
