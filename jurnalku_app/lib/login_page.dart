import 'package:flutter/material.dart';
import 'package:jurnalku_app/dashboard_page.dart';
import 'package:jurnalku_app/explore_page_!login.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ExplorePageLogin(),
            ),
          );
        },
        label: const Text(
          "Jelajahi siswa",
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(Icons.explore),
        backgroundColor: const Color(0xFF02398C),
        elevation: 10,
        hoverElevation: 20,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        extendedIconLabelSpacing: 8,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/images/1 login.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: "Masuk untuk memulai "),
                        TextSpan(
                          text: "Jurnalku",
                          style: TextStyle(color: Color(0xFF02398C)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Username atau NIS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Masukkan username atau NIS",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Masukkan password",
                      suffixIcon: const Icon(Icons.visibility),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                        backgroundColor: const Color(0xFF02398C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Masuk",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "Lupa password? Hubungi guru laboran.",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Menyatukan Upaya untuk Kemajuan Siswa",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa "
                "dalam memantau dan mengelola kompetensi keahlian siswa secara efektif.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildFeature(
              icon: Icons.school,
              bgColor: Colors.yellow.shade100,
              title: "Dirancang untuk Sekolah Kami",
              description:
                  "Dikembangkan khusus untuk memenuhi kebutuhan sekolah kami dengan fokus pada kemajuan siswa kami.",
            ),
            _buildFeature(
              icon: Icons.grid_view_rounded,
              bgColor: Colors.purple.shade100,
              title: "Pemantauan yang Terstruktur",
              description:
                  "Memudahkan guru dalam menyusun dan memantau daftar kompetensi keahlian yang harus dikuasai siswa.",
            ),
            _buildFeature(
              icon: Icons.auto_graph_rounded,
              bgColor: Colors.blue.shade100,
              title: "Fitur Praktis dan Bermanfaat",
              description:
                  "Termasuk reminder otomatis, grafik perkembangan, dan analisis mendalam untuk efektivitas belajar.",
            ),
            _buildFeature(
              icon: Icons.assignment_turned_in_rounded,
              bgColor: Colors.orange.shade100,
              title: "Pengajuan Kompetensi oleh Siswa",
              description:
                  "Siswa dapat mengajukan kompetensi yang telah dikuasai untuk diverifikasi guru.",
            ),
            _buildFeature(
              icon: Icons.verified_rounded,
              bgColor: Colors.green.shade100,
              title: "Validasi dan Tanda Tangan Guru",
              description:
                  "Kompetensi yang disetujui akan diberikan tanda terima dan tanda tangan guru sebagai bukti.",
            ),
            _buildFeature(
              icon: Icons.monitor_heart_rounded,
              bgColor: Colors.pink.shade100,
              title: "Pantauan Real-Time dan Transparan",
              description:
                  "Monitoring langsung yang menciptakan lingkungan belajar efisien.",
            ),
            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              color: const Color(0xFF02398C),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/ig.png',
                        width: 30,
                        height: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      Image.asset(
                        'assets/icons/wa.png',
                        width: 30,
                        height: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      Image.asset(
                        'assets/icons/yt.png',
                        width: 30,
                        height: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 20),
                      Image.asset(
                        'assets/icons/linkin.png',
                        width: 30,
                        height: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved..",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
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

  Widget _buildFeature({
    required IconData icon,
    required Color bgColor,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1.3,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 30),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
