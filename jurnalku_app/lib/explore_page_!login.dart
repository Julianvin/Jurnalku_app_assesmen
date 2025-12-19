import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:jurnalku_app/dashboard_page.dart';
import 'package:jurnalku_app/login_page.dart';
import 'package:jurnalku_app/profile_page%20_login.dart';
import 'package:jurnalku_app/models/student_model.dart';
import 'package:jurnalku_app/services/student_service.dart';

class ExplorePageLogin extends StatefulWidget {
  const ExplorePageLogin({super.key});

  @override
  State<ExplorePageLogin> createState() => _ExplorePageLoginState();
}

class _ExplorePageLoginState extends State<ExplorePageLogin> {
  late Future<List<Student>> _studentsFuture;

  @override
  void initState() {
    super.initState();
    _studentsFuture = StudentService.fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardPage()),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.menu_book_rounded,
                        color: Colors.blue[900], size: 28),
                    const SizedBox(width: 8),
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
                    MaterialPageRoute(
                        builder: (context) => const LoginPage()),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
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
            _headerSection(),
            const SizedBox(height: 10),

            /// 🔽 DATA SISWA DARI API
            FutureBuilder<List<Student>>(
              future: _studentsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.all(40),
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                final students = snapshot.data!;

                return Column(
                  children: students.map((student) {
                    return _studentCard(
                      name: student.nama,
                      nis: student.nis.toString(),
                      photoUrl:
                          'http://127.0.0.1:8000/storage/${student.photo}',
                      rombel: student.rombel,
                      rayon: student.rayon,
                      portfolio: 0,
                      sertifikat: 0,
                    );
                  }).toList(),
                );
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _headerSection() {
    return Stack(
      children: [
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
        Container(
          height: 220,
          width: double.infinity,
          color: Colors.black.withOpacity(0.35),
        ),
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
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.grey.shade300),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText:
                                    "Cari nama siswa, NIS, atau rombel...",
                                border: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.search_outlined),
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.filter_list),
                          SizedBox(width: 5),
                          Text("Filter Lanjutan"),
                          SizedBox(width: 4),
                          Icon(Icons.keyboard_arrow_down_rounded),
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
    );
  }

  // ================= CARD =================
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
                  Icon(Icons.verified,
                      size: 18, color: Colors.grey[700]),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ProfilePageLogin()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                padding:
                    const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Lihat Detail",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
