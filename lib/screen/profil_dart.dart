import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //------GRADIASI-------
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromARGB(255, 170, 194, 255),
              ],
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //------LOGO ATAS------
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/aja.png',
                      width: 50,
                      height: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 5),

                        //------SEJARAH---------
                        Text(
                          'SEJARAH',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 57, 133),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Rumah Quran dan Rumah Yatim Aisyah bernaung di bawah Yayasan Aisyah Berbagi yang berdiri 4 tahun lalu. Yayasan ini mengawali kegiatannya dengan program Sedekah Jumat Rp10.000 yang hasilnya dialokasikan ke sejumlah pondok pesantren di Bengkalis, membantu fakir miskin, dhuafa, anak yatim dan yang membutuhkan lainnya. Saat ini Yayasan memiliki hampir 400 donatur, berasal dari dalam daerah, luar daerah hingga luar negeri.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                        SizedBox(height: 40),

                        //-------PENGURUS YAYASAN------
                        Text(
                          'PENGURUS YAYASAN',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 57, 133),
                          ),
                        ),
                        SizedBox(height: 20),
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          children: [
                            _buildPengurusItem('Pembina Yayasan', ''),
                            _buildPengurusItem('Ketua Yayasan',
                                'assets/images/ketuayayasan.jpeg'),
                            _buildPengurusItem('Sekretaris Yayasan', ''),
                            _buildPengurusItem('Bendahara Yayasan', ''),
                          ],
                        ),
                        SizedBox(height: 20),

                        //------VISI MISI---------
                        Text(
                          'VISI MISI',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 57, 133),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Visi',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 57, 133),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Menjadi Yayasan Yang Amanah, Solid, dan Unggul Dalam Pengelolaan dan Pelayanan.',
                                style: GoogleFonts.poppins(fontSize: 16),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Misi',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 57, 133),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Mengelola kegiatan masyarakat dalam bidang sosial, keagamaan, dan kemanusiaan. Memberikan Pelayanan yang amanah kepada masyarakat. Menjadi fasilitator yang amanah dan terpercaya. Membangun organisasi yang solid dan unggul.',
                                style: GoogleFonts.poppins(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),

                        //--------FOOTER---------
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 7),
                              Text(
                                'Kontak Kami',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 57, 133),
                                ),
                              ),
                              SizedBox(height: 20),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.phone, color: Colors.blue),
                                      SizedBox(width: 10),
                                      Text(
                                        '082288409503',
                                        style:
                                            GoogleFonts.poppins(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          color: Colors.blue),
                                      SizedBox(width: 10),
                                      Text(
                                        'JL Bathin Alam, Kuala Alam Bengkalis, Riau',
                                        style:
                                            GoogleFonts.poppins(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.facebook, color: Colors.blue),
                                      SizedBox(width: 10),
                                      Text(
                                        'Aisyah Berbagi',
                                        style:
                                            GoogleFonts.poppins(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              )
                            ],
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

      //--------NAVIGASI--------
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildPengurusItem(String title, String imagePath) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: imagePath.isEmpty ? Colors.grey[300] : null,
              image: imagePath.isNotEmpty
                  ? DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    )
                  : null,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
