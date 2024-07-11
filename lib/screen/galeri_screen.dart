import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:yayasan/screen/profil_screen.dart";
import "package:yayasan/screen/donasi_screen.dart";
import "package:yayasan/screen/dashboard_screen.dart";

class GaleriScreen extends StatefulWidget {
  const GaleriScreen({super.key});

@override
  _GaleriScreenState createState() => _GaleriScreenState();
}

class _GaleriScreenState extends State<GaleriScreen> {
  // ignore: unused_field
  int _selectedIndex = 1; 

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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/ngaji2.jpeg",
              fit: BoxFit.fill,
            ),
          ),
          ListView(
            padding: EdgeInsets.only(top: 20),
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/ngaji2.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 1),
                        Color.fromRGBO(170, 194, 255, 1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                    padding: const EdgeInsets.only(bottom: 110),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'GALERI',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 24),
                            fontWeight: FontWeight.w800,
                            color: const Color.fromARGB(255, 6, 38, 119),
                          ),
                        ),
                        
                        const ImageGrid(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/1.jpeg',
      'assets/images/2.jpeg',
      'assets/images/3.jpeg',
      'assets/images/4.jpeg',
      'assets/images/5.jpeg',
      'assets/images/6.jpeg',
      'assets/images/7.jpeg',
      'assets/images/8.jpeg',
      'assets/images/9.jpeg',
      // 'assets/images/7.jpeg',
      // 'assets/images/8.jpeg',
      // 'assets/images/9.jpeg',
    ];

    return GridView.count(
padding: const EdgeInsets.only(top: 20),
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: imagePaths.map((path) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
    );
  }
}
