import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalScreen extends StatelessWidget {
  const ModalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the controllers
    final TextEditingController passwordController = TextEditingController();

    Future.delayed(const Duration(seconds: 3)).then((value) {});

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 37, 105),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 1),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'FORMULIR DONASI',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30), // Added spacing between elements
                  _buildInputSection('Nama Donatur', passwordController, true),
                  const SizedBox(height: 16.0),
                  _buildInputSection('No Telepon', passwordController, true),
                  const SizedBox(height: 16.0),
                  _buildInputSection('Rek Donasi', passwordController, true),
                  const SizedBox(height: 16.0),
                  _buildInputSection('Jumlah Donasi', passwordController, true),
                  const SizedBox(height: 16.0),
                  _buildInputSection('Nama Program', passwordController, true),
                  const SizedBox(height: 16.0),
                  _buildInputSection(
                      'Bukti Transfer', passwordController, true),
                  const SizedBox(height: 40), // Added spacing before button
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                      print('Button pressed');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color.fromARGB(
                                255, 11, 37, 105); // Pressed color
                          }
                          return Colors.white; // Default color
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(
                            255, 11, 37, 105), // Text color
                      ),
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

  Widget _buildInputSection(
      String label, TextEditingController controller, bool obscureText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        _buildInputField(
          controller: controller,
          hintText: '',
          obscureText: obscureText,
        ),
      ],
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
        borderRadius: BorderRadius.circular(30),
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(fontSize: 14.0),
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}
