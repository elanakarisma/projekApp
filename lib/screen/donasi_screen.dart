import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:yayasan/screen/modal_screent.dart";
import "package:yayasan/screen/profil_screen.dart";
import "package:yayasan/screen/galeri_screen.dart";
import "package:yayasan/screen/dashboard_screen.dart";

class DonasiScreen extends StatefulWidget {
  const DonasiScreen({super.key});

@override
  _DonasiScreenState createState() => _DonasiScreenState();
}

class _DonasiScreenState extends State<DonasiScreen> {
  // ignore: unused_field
  int _selectedIndex = 3; 

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
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 6, 38, 119),
                Color.fromRGBO(255, 255, 255, 1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
                30), // Padding yang seragam untuk setiap sisi
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/aja.png',
                      width: 50,
                      height: 60,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'DONASI',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Color.fromARGB(255, 234, 237, 241),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  DonationCard(
                    imagePath: 'assets/images/9.jpeg',
                    title: 'Sedekah Jum\'at Rutin',
                    description:
                        'Sedekah untuk membantu masyarakat atau organisasi masyarakat yang sedang mengalami kemalangan dan kesusahan',
                  ),
                  SizedBox(height: 20),
                  DonationCard(
                    imagePath: 'assets/images/2.jpeg',
                    title: 'Santunan Anak Yatim',
                    description:
                        'Sedekah yang diperuntukkan untuk membantu anak yatim dan fakir miskin',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Foto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Donasi',
          ),
        ],
        currentIndex: 3,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DonationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const DonationCard({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 0, 57, 133),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const ModalScreen(),
                        ),
                        (route) => false);
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 3, 11, 83),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        'Donasi',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color.fromARGB(255, 214, 217, 221),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
