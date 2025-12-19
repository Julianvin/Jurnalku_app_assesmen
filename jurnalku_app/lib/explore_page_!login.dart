import 'package:flutter/material.dart';
import 'package:jurnalku_app/dashboard_page.dart';
import 'package:jurnalku_app/login_page.dart';
import 'package:jurnalku_app/profile_page%20_login.dart';
import 'dart:ui';


class ExplorePageLogin extends StatefulWidget {
  const ExplorePageLogin({super.key});

  @override
  State<ExplorePageLogin> createState() => _ExplorePageLoginState();
}

class _ExplorePageLoginState extends State<ExplorePageLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  // Arahkan ke halaman lain (atau halaman sama)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.menu_book_rounded,
                        color: Colors.blue[900], size: 28),
                    SizedBox(width: 8),
                    Text(
                      "Jurnalku",
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xfff5f6f8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // 🔵 Background blur
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Image.asset(
                      "assets/images/1 login.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // 🔵 Overlay gelap
                Container(
                  height: 220,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.35),
                ),

                // 🔵 Isi konten
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Direktori Siswa",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Temukan dan jelajahi profil siswa SMK Wikrama Bogor",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // 🔎 SEARCH BAR
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                    ),
                                    child: const TextField(
                                      decoration: InputDecoration(
                                        hintText:
                                            "Cari nama siswa, NIS, atau rombel...",
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.search_outlined,
                                            size: 22),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: Color(0xff0b2f6a),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    "Cari",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // 🔽 FILTER
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.filter_list),
                                  SizedBox(width: 5),
                                  Text("Filter Lanjutan"),
                                  SizedBox(width: 4),
                                  Icon(Icons.keyboard_arrow_down_rounded,
                                      size: 20),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _studentCard(
              name: "Abdee Munzie Alazkha",
              nis: "12510778",
              photoUrl: "assets/images/profile.jpg",
              rombel: "PPLG X-3",
              rayon: "Cia 1",
              portfolio: 2,
              sertifikat: 14,
            ),
            _studentCard(
              name: "Abdul Hadi",
              nis: "12309480",
              photoUrl: "assets/images/profile.jpg",
              rombel: "PPLG XII-4",
              rayon: "Cic 3",
              portfolio: 3,
              sertifikat: 6,
            ),
            _studentCard(
              name: "Nisa Samrotul Fuadah",
              nis: "12309480",
              photoUrl: "assets/images/profile.jpg",
              rombel: "PPLG XII-5",
              rayon: "Cic 9",
              portfolio: 9,
              sertifikat: 10,
            ),
            _studentCard(
              name: "Nisa Auliani",
              nis: "12309480",
              photoUrl: "assets/images/profile.jpg",
              rombel: "PPLG XII-5",
              rayon: "Cic 8",
              portfolio: 2,
              sertifikat: 5,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _studentCard({
    required String name,
    required String nis,
    required String photoUrl,
    required String rombel,
    required String rayon,
    required int portfolio,
    required int sertifikat,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 38,
            backgroundImage: NetworkImage(photoUrl),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "$nis | $rombel | $rayon",
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.folder, size: 18, color: Colors.grey[700]),
                  const SizedBox(width: 6),
                  Text("$portfolio Portfolio"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.verified, size: 18, color: Colors.grey[700]),
                  const SizedBox(width: 6),
                  Text("$sertifikat Sertifikat"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePageLogin()),
                      );
                    },
                    child: const Text(
                      "Lihat Detail",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
