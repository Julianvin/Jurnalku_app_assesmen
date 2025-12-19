import 'package:flutter/material.dart';
import 'package:jurnalku_app/widgets/dashboard_app_bar.dart';


class PanduanPage extends StatelessWidget {
  const PanduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color warnaBiruTua = const Color(0xFF0D47A1);

    return Scaffold(
      appBar: DashboardAppBar(titleText: "Panduan Pengguna"),
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            // SECTION: BODY
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SECTION: TITLE
                    Row(
                      children: [
                        Icon(Icons.menu_book_outlined,
                            color: warnaBiruTua, size: 28),
                        const SizedBox(width: 10),
                        Text(
                          "Panduan Penggunaan",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: warnaBiruTua,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "Selamat datang di panduan penggunaan aplikasi Jurnalku. Panduan ini akan membantu Anda memahami cara menggunakan fitur-fitur yang tersedia dengan optimal.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // SECTION: UMUM
                    const Text(
                      "Umum",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),

                    _itemKartu(
                      judul: "Unggah Profile",
                      deskripsi: "Panduan untuk mengunggah profile pengguna",
                      icon: Icons.assignment_ind_outlined,
                      warnaBiruTua: warnaBiruTua,
                    ),

                    _itemKartu(
                      judul: "Ganti Password",
                      deskripsi: "Panduan untuk mengganti password pengguna",
                      icon: Icons.lock_reset_outlined,
                      warnaBiruTua: warnaBiruTua,
                    ),

                    const SizedBox(height: 20),

                    // SECTION: UNTUK SISWA
                    const Text(
                      "Untuk Siswa",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),

                    _itemKartu(
                      judul: "Mengisi Jurnal",
                      deskripsi: "Panduan untuk mengisi kegiatan sehari - hari",
                      icon: Icons.assignment_outlined,
                      warnaBiruTua: warnaBiruTua,
                    ),

                    _itemKartu(
                      judul: "Kelengkapan Profile",
                      deskripsi: "Panduan untuk melengkapi profile",
                      icon: Icons.perm_contact_calendar_outlined,
                      warnaBiruTua: warnaBiruTua,
                    ),

                    _itemKartu(
                      judul: "Mengelola Portfolio",
                      deskripsi:
                          "Panduan untuk menambah, edit, dan hapus portfolio",
                      icon: Icons.image_outlined,
                      warnaBiruTua: warnaBiruTua,
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // SECTION: ITEM KARTU
  Widget _itemKartu({
    required String judul,
    required String deskripsi,
    required IconData icon,
    required Color warnaBiruTua,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: warnaBiruTua,
            size: 24,
          ),
        ),
        title: Text(
          judul,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            deskripsi,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
