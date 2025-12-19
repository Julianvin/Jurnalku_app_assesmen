import 'package:flutter/material.dart';
import 'package:jurnalku_app/widgets/dashboard_app_bar.dart';
import 'package:jurnalku_app/widgets/feature_box.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0D47A1);

    return Scaffold(
      appBar: DashboardAppBar(titleText: "Dashboard"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -------------------- HEADER --------------------
            Container(
              height: 320,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/backgorund_dashboard.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Selamat Datang di Jurnalku",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Solusi cerdas untuk memantau perkembangan kompetensi siswa secara efektif",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // -------------------- "APA ITU JURNALKU" BOX --------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: darkBlue,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Apa itu Jurnalku?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Jurnalku membantu guru & siswa memantau kompetensi secara efektif, terstruktur, dan real-time.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // -------------------- FEATURE BOXES --------------------
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  FeatureBox(
                    image: 'assets/icons/school.png',
                    title: "Dirancang Khusus",
                    description: "Memenuhi kebutuhan spesifik sekolah kami.",
                  ),
                  FeatureBox(
                    image: 'assets/icons/student.png',
                    title: "Pemantauan Real-Time",
                    description: "Lihat perkembangan siswa langsung.",
                  ),
                  FeatureBox(
                    image: 'assets/icons/wisuda.png',
                    title: "Pencapaian Kompetensi",
                    description: "Pantau sertifikasi dan progres kamu.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // -------------------- MENU APLIKASI --------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "MENU APLIKASI",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  MenuItemCard(
                    icon: 'assets/icons/user.png',
                    title: "Profil",
                    description: "Lihat dan kelola profilmu.",
                    onTap: () {},
                  ),
                  MenuItemCard(
                    icon: 'assets/icons/bag.png',
                    title: "Portofolio",
                    description: "Kelola portofolio kompetensimu.",
                    onTap: () {},
                  ),
                  MenuItemCard(
                    icon: 'assets/icons/medal.png',
                    title: "Sertifikat",
                    description: "Lihat & unduh sertifikatmu.",
                    onTap: () {},
                  ),

                  const SizedBox(height: 10),

                  MenuItemCard(
                    icon: 'assets/icons/buku.png',
                    title: "Jurnal Pembiasaan",
                    description: "Catat kegiatan pembiasaanmu.",
                    onTap: () {},
                  ),
                  MenuItemCard(
                    icon: 'assets/icons/user.png',
                    title: "Permintaan Saksi",
                    description: "Daftar teman yang meminta saksi.",
                    onTap: () {},
                  ),
                  MenuItemCard(
                    icon: 'assets/icons/chart.png',
                    title: "Progress",
                    description: "Pantau progres kompetensimu.",
                    onTap: () {},
                  ),
                  MenuItemCard(
                    icon: 'assets/icons/warning.png',
                    title: "Catatan Sikap",
                    description: "Catatan perilaku dari guru.",
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // -------------------- STATISTIK --------------------
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 25),
              child: Text(
                "STATISTIK KOMPETENSI",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: const [
                  Expanded(
                    child: StatCard(
                      title: "Materi Diselesaikan",
                      value: "1",
                      label: "Selesai",
                      icon: Icons.check_circle_outline,
                      iconColor: Colors.green,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: StatCard(
                      title: "Pending",
                      value: "0",
                      label: "Pending",
                      icon: Icons.access_time,
                      iconColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  Expanded(
                    child: StatCard(
                      title: "Hari Ini",
                      value: "0",
                      label: "Hari Ini",
                      icon: Icons.event,
                      iconColor: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: StatCard(
                      title: "Revisi",
                      value: "0",
                      label: "Revisi",
                      icon: Icons.refresh,
                      iconColor: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Lihat Progress Kamu →",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const KompetensiListCard(
              title: "AJAX",
              status: "Approved",
            ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ProgressAkademikCard(
                selesai: 1,
                pending: 0,
                belum: 0,
                hariIni: 0,
              ),
            ),

            const SizedBox(height: 30),

            // -------------------- FOOTER --------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Color(0xFFE6F0FF),
              child: const Center(
                child: Text(
                  "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
                  style: TextStyle(
                    color: Color(0xFF1A73E8),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ===================================================================
//                        MENU ITEM CARD
// ===================================================================

class MenuItemCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final VoidCallback? onTap;

  const MenuItemCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Image.asset(
          icon,
          width: 32,
          errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      ),
    );
  }
}




class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String label;
  final IconData icon;
  final Color iconColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.label,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 3),
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: iconColor),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}


// ===================================================================
//                    KOMPETENSI LIST CARD
// ===================================================================

class KompetensiListCard extends StatelessWidget {
  final String title;
  final String status;

  const KompetensiListCard({
    super.key,
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.book, size: 32, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: status == "Approved"
                  ? Colors.green.withOpacity(0.15)
                  : Colors.orange.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: status == "Approved" ? Colors.green : Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}


// ===================================================================
//                    PROGRESS AKADEMIK CARD
// ===================================================================

class ProgressAkademikCard extends StatelessWidget {
  final int selesai;
  final int pending;
  final int belum;
  final int hariIni;

  const ProgressAkademikCard({
    super.key,
    required this.selesai,
    required this.pending,
    required this.belum,
    required this.hariIni,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Progress Akademik Kamu",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _item("Selesai", selesai, Colors.green),
              _item("Pending", pending, Colors.orange),
              _item("Belum", belum, Colors.red),
              _item("Today", hariIni, Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _item(String label, int value, Color color) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 20,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}
