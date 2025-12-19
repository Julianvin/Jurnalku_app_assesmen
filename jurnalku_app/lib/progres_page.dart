import 'package:flutter/material.dart';
import 'package:jurnalku_app/gim_detail.dart';
import 'package:jurnalku_app/mobile_detail.dart';
import 'package:jurnalku_app/projek_work_detail.dart';
import 'package:jurnalku_app/ukk_detail.dart';
import 'package:jurnalku_app/widgets/dashboard_app_bar.dart';


class ProgresPage extends StatelessWidget {
  const ProgresPage({super.key});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "disetujui":
      case "selesai":
        return Colors.green.shade700;
      case "pending":
        return Colors.orange.shade700;
      case "ditolak":
        return Colors.red.shade700;
      default:
        return Colors.black87;
    }
  }

  Map<String, dynamic> _createSubjectData({
    required String subjectTitle,
    required String detailTitle,
    required String competency,
    required String teacher,
    required String date,
    required String status,
    required String teacherNote,
    required String studentNote,
  }) {
    return {
      'subjectTitle': subjectTitle,
      'detailTitle': detailTitle,
      'competency': competency,
      'teacher': teacher,
      'date': date,
      'status': status,
      'teacherNote': teacherNote,
      'studentNote': studentNote,
    };
  }

  void _handleSubjectTap(BuildContext context, String subjectTitle, Map<String, dynamic> subjectData) {
    Widget destinationPage;

    switch (subjectTitle) {
      case "Project Work":
        destinationPage = ProjekWorkDetail(data: subjectData);
        break;
      case "Mobile Apps":
        destinationPage = MobileDetail(data: subjectData);
        break;
      case "UKK (Uji Kompetensi Keahlian)":
        destinationPage = UkkDetail(data: subjectData);
        break;
      case "GIM":
        destinationPage = GimDetail(data: subjectData);
        break;
      default:
        debugPrint("Halaman detail untuk $subjectTitle tidak ditemukan.");
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destinationPage),
    );
  }

  Widget _buildClickableSubjectCard({
    required BuildContext context,
    required String subjectTitle,
    required String detailTitle,
    required String competency,
    required String teacher,
    required String date,
    required String status,
    required String teacherNote,
    required String studentNote,
  }) {
    final subjectData = _createSubjectData(
      subjectTitle: subjectTitle,
      detailTitle: detailTitle,
      competency: competency,
      teacher: teacher,
      date: date,
      status: status,
      teacherNote: teacherNote,
      studentNote: studentNote,
    );

    return InkWell(
      onTap: () => _handleSubjectTap(context, subjectTitle, subjectData),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subjectTitle,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Status: $status",
                    style: TextStyle(
                      fontSize: 15,
                      color: _getStatusColor(status),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    competency,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required String subtitle,
    required Color subtitleColor,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.circle, size: 8, color: subtitleColor),
                    const SizedBox(width: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: subtitleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.black45, size: 28),
          ),
        ],
      ),
    );
  }

  // NOTE: Fungsi _buildLainnyaTable() asli yang menggunakan DataTable telah DITAHAN.
  // Widget _buildLainnyaTable() {
  //   return Container(
  //     // ... DataTable code ...
  //   );
  // }

  // 🆕 FUNGSI BARU: Menggantikan DataTable dengan ExpansionTile untuk tampilan mobile yang lebih baik.
  Widget _buildLainnyaExpansionList() {
    // Data dari _buildLainnyaTable()
    final List<Map<String, String>> dataTambahan = [
      {"kompetensi": "Diagram", "tanggal": "20 Nov 2025", "catatan": "Tidak ada catatan"},
      {"kompetensi": "Sql (BikeStores)", "tanggal": "20 Nov 2025", "catatan": "Tidak ada catatan"},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(), // Agar bisa di-scroll bersama SingleChildScrollView
        shrinkWrap: true,
        itemCount: dataTambahan.length,
        itemBuilder: (context, index) {
          final item = dataTambahan[index];
          return ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            leading: const Icon(Icons.notes, color: Colors.blueGrey),
            title: Text(
              item['kompetensi']!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text("Tanggal: ${item['tanggal']!}"),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow("Tanggal Ujian", item['tanggal']!),
                    _buildDetailRow("Catatan Guru", item['catatan']!),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: valueColor ?? Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          const Divider(height: 1, color: Colors.black12),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const DashboardAppBar(titleText: "Progres"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Progress Belajar",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Pantau perkembangan kompetensi dan materi pembelajaran Anda",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Thursday, 20 November 2025",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B6FD6),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Info Cards
            _buildInfoCard(
              title: "Total Pengajuan",
              value: "2",
              subtitle: "Semua status",
              subtitleColor: Colors.blue,
              icon: Icons.check_circle_outline,
              iconColor: Colors.blue.shade100,
            ),
            const SizedBox(height: 14),

            _buildInfoCard(
              title: "Halaman Ini",
              value: "1",
              subtitle: "Data ditampilkan",
              subtitleColor: Colors.green,
              icon: Icons.calendar_today_outlined,
              iconColor: Colors.green.shade100,
            ),
            const SizedBox(height: 14),

            _buildInfoCard(
              title: "Status Pending",
              value: "0",
              subtitle: "Perlu validasi",
              subtitleColor: Colors.orange,
              icon: Icons.access_time,
              iconColor: Colors.orange.shade100,
            ),
            const SizedBox(height: 14),

            _buildInfoCard(
              title: "Total Halaman",
              value: "1",
              subtitle: "Navigasi tersedia",
              subtitleColor: const Color.fromARGB(255, 204, 4, 244),
              icon: Icons.folder_copy_outlined,
              iconColor: Colors.purple.shade100,
            ),

            const SizedBox(height: 28),
            const Divider(thickness: 0.7, color: Colors.black12),
            const SizedBox(height: 10),

            const Text(
              "Daftar Mata Pelajaran",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Subject Cards
            _buildClickableSubjectCard(
              context: context,
              subjectTitle: "Project Work",
              detailTitle: "Nama Project Work",
              competency: "Membuat Aplikasi Mobile Sederhana",
              teacher: "Pa Guru",
              date: "27 Nov 2025",
              status: "Disetujui",
              teacherNote: "Hasil sangat bagus, tingkatkan lagi!",
              studentNote: "Sudah melakukan revisi sesuai arahan.",
            ),

            _buildClickableSubjectCard(
              context: context,
              subjectTitle: "Mobile Apps",
              detailTitle: "Kompetensi Utama Mobile Apps",
              competency: "Pengembangan Flutter Dasar",
              teacher: "Ibu Guru",
              date: "4 Nov 2025",
              status: "Pending",
              teacherNote: "Menunggu submit tugas 3",
              studentNote: "Sedang mengerjakan tugas integrasi API.",
            ),

            _buildClickableSubjectCard(
              context: context,
              subjectTitle: "UKK (Uji Kompetensi Keahlian)",
              detailTitle: "Persiapan Uji Kompetensi",
              competency: "Simulasi Uji Praktik",
              teacher: "Guru Produktif",
              date: "5 Nov 2025",
              status: "Pending",
              teacherNote: "Pastikan semua modul dipelajari.",
              studentNote: "Selesai revisi laporan, siap diuji.",
            ),

            _buildClickableSubjectCard(
              context: context,
              subjectTitle: "GIM",
              detailTitle: "Materi Desain Grafis",
              competency: "Desain UI/UX menggunakan Figma",
              teacher: "Guru Gim",
              date: "05 Nov 2025",
              status: "Disetujui",
              teacherNote: "Konsep warna sudah baik.",
              studentNote: "Sudah mengumpulkan final design.",
            ),

            const SizedBox(height: 30),
            const Divider(thickness: 0.7, color: Colors.black12),
            const SizedBox(height: 18),

            const Text(
              "Lainnya",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Kompetensi dan materi tambahan",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500, 
              ),
            ),
            const SizedBox(height: 20),

            // 🛠️ PENGGANTIAN DI SINI: Memanggil Expansion List yang baru
            _buildLainnyaExpansionList(),
          ],
        ),
      ),
    );
  }
}