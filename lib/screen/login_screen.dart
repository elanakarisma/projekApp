import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 170, 194, 255),
                Color.fromRGBO(255, 255, 255, 255),
              ],
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
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
                        TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                          labelText: 'Username',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          )
                          ),
                        ),
                        const SizedBox(height: 16.0),

                        // TextField Password
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
                        _isLoading
                          ? const CircularProgressIndicator()

                        : ElevatedButton(
                          onPressed: _login,
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
                            // Implement your registration logic here
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
    );
  }
}
