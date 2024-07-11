import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import "package:yayasan/screen/galeri_screen.dart";
import "package:yayasan/screen/profil_screen.dart";
import "package:yayasan/screen/donasi_screen.dart";
import "package:yayasan/screen/dashboard_screen.dart";

class ModalScreen extends StatefulWidget {
  const ModalScreen({Key? key}) : super(key: key);

  @override
  _ModalScreenState createState() => _ModalScreenState();
}

class _ModalScreenState extends State<ModalScreen> {
  int _selectedIndex = 2;

  final TextEditingController namaDonaturController = TextEditingController();
  final TextEditingController noTeleponController = TextEditingController();
  final TextEditingController rekDonasiController = TextEditingController();
  final TextEditingController jumlahDonasiController = TextEditingController();
  final TextEditingController namaProgramController = TextEditingController();

  bool _isLoading = false;

  Future<void> _submitDonation() async {
    final name = namaDonaturController.text;
    final phone = noTeleponController.text;
    final accountNumber = rekDonasiController.text;
    final amount = jumlahDonasiController.text;
    final program = namaProgramController.text;

    if (name.isEmpty || phone.isEmpty || accountNumber.isEmpty || amount.isEmpty || program.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final url = Uri.parse('http://10.11.9.6:8080/api/donasi');
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'nm_donatur': name,
          'no_telp': phone,
          'rek_donasi': accountNumber,
          'jumlah_donasi': int.parse(amount),
          'nama_program': program,
        }),
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Donation submitted successfully')),
        );
        _clearFields();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Donation submitted successfully')),
        );
        print('Failed to submit donation - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit donation. Please try again.')),
      );
      print('Error submitting donation: $e');
    }
  }

  void _clearFields() {
    namaDonaturController.clear();
    noTeleponController.clear();
    rekDonasiController.clear();
    jumlahDonasiController.clear();
    namaProgramController.clear();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GaleriScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DonasiScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
=======

class ModalScreen extends StatelessWidget {
  const ModalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the controllers
    final TextEditingController passwordController = TextEditingController();

    Future.delayed(const Duration(seconds: 3)).then((value) {});

>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 37, 105),
      body: SafeArea(
        child: Padding(
<<<<<<< HEAD
          padding: const EdgeInsets.all(30.0),
=======
          padding:
              const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 30),
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
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
<<<<<<< HEAD
                  _buildInputSection('Nama Donatur', namaDonaturController, false),
                  const SizedBox(height: 16.0),
                  _buildInputSection('No Telepon', noTeleponController, false),
                  const SizedBox(height: 16.0),
                  _buildInputSection('Rek Donasi', rekDonasiController, false),
                  const SizedBox(height: 16.0),
                  _buildInputSection('Jumlah Donasi', jumlahDonasiController, false, isNumeric: true),
                  const SizedBox(height: 16.0),
                  _buildInputSection('Nama Program', namaProgramController, false),
                  const SizedBox(height: 24.0),
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: _submitDonation,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color.fromARGB(255, 11, 37, 105); // Pressed color
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
                              const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            ),
                          ),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 11, 37, 105), // Text color
                            ),
                          ),
                        ),
=======
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
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
                ],
              ),
            ),
          ),
        ),
      ),
<<<<<<< HEAD
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Profil',
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
            label: 'Donasi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
=======
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
    );
  }

  Widget _buildInputSection(
<<<<<<< HEAD
      String label, TextEditingController controller, bool obscureText, {bool isNumeric = false}) {
=======
      String label, TextEditingController controller, bool obscureText) {
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
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
<<<<<<< HEAD
          isNumeric: isNumeric,
=======
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
        ),
      ],
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
<<<<<<< HEAD
    bool isNumeric = false,
=======
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
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
<<<<<<< HEAD
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
=======
>>>>>>> 24032be2cba1f2da9a2d299bef0380e5170eb385
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
