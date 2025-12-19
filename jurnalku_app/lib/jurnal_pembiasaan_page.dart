import 'package:flutter/material.dart';
import 'package:jurnalku_app/widgets/dashboard_app_bar.dart';


class JurnalPembiasaanPage extends StatelessWidget {
  const JurnalPembiasaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dummyPekerjaan = [
      {
        "pekerjaan": "Memperbaiki Wifi Lab",
        "tanggal": "12 Nov 2025",
        "saksi": "Pak Budi",
        "status": "Selesai"
      },
      {
        "pekerjaan": "Install Ulang PC 05",
        "tanggal": "13 Nov 2025",
        "saksi": "Bu Siti",
        "status": "Proses"
      },
    ];

    final List<Map<String, String>> dummyMateri = [
      {
        "materi": "Routing Statis MikroTik",
        "status": "A",
        "tanggal": "10 Nov 2025",
        "catatan": "Sudah paham konsep dasar."
      },
      {
        "materi": "VLAN Trunking",
        "status": "P",
        "tanggal": "11 Nov 2025",
        "catatan": "Menunggu pengecekan mentor."
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const DashboardAppBar(titleText: "Jurnal Pembiasaan"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Jurnal Pembiasaan",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "NOVEMBER - 2025",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios, size: 14),
                label: const Text("Lihat Bulan Sebelumnya"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 25),
            _buildSectionTitle("A. Pembiasaan harian"),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                _buildLegend(Colors.green, "Sudah diisi"),
                _buildLegend(Colors.orange, "Belum diisi"),
                _buildLegend(Colors.red, "Tidak diisi"),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildCalendar(),
              ),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle("B. Pekerjaan yang dilakukan"),
            const SizedBox(height: 10),
            if (dummyPekerjaan.isEmpty)
              _buildEmptyState("Belum ada pekerjaan.")
            else
              Column(
                children: dummyPekerjaan.map((data) {
                  return _buildExpansionCard(
                    title: data['pekerjaan']!,
                    subtitle: data['tanggal']!,
                    icon: Icons.work_outline,
                    children: [
                      _buildDetailRow("Saksi", data['saksi']!),
                      _buildDetailRow("Status", data['status']!),
                    ],
                  );
                }).toList(),
              ),
            _buildAddButton("Tambah Pekerjaan"),
            const SizedBox(height: 30),
            _buildSectionTitle("C. Materi yang dipelajari"),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                _buildLegend(Colors.green, "A : Approved"),
                _buildLegend(Colors.orange, "P : Pending"),
                _buildLegend(Colors.red, "R : Revisi"),
              ],
            ),
            const SizedBox(height: 12),
            if (dummyMateri.isEmpty)
              _buildEmptyState("Belum ada materi.")
            else
              Column(
                children: dummyMateri.map((data) {
                  Color statusColor = Colors.grey;
                  if (data['status'] == 'A') statusColor = Colors.green;
                  if (data['status'] == 'P') statusColor = Colors.orange;
                  if (data['status'] == 'R') statusColor = Colors.red;

                  return _buildExpansionCard(
                    title: data['materi']!,
                    subtitle: data['tanggal']!,
                    icon: Icons.menu_book_rounded,
                    trailing: CircleAvatar(
                      radius: 14,
                      backgroundColor: statusColor,
                      child: Text(
                        data['status']!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    children: [
                      _buildDetailRow("Catatan", data['catatan']!),
                    ],
                  );
                }).toList(),
              ),
            _buildAddButton("Tambah Materi"),
            const SizedBox(height: 30),
            _buildSectionTitle("D. Poin Mingguan"),
            const SizedBox(height: 10),
            _buildPoinCard(
              title: "Project & Progress Belajar",
              totalPoin: 15,
              m1: 5,
              m2: 5,
              m3: 5,
              m4: 0,
            ),
            _buildPoinCard(
              title: "Laporan Pengetahuan Materi",
              totalPoin: 8,
              m1: 2,
              m2: 2,
              m3: 2,
              m4: 2,
            ),
            const SizedBox(height: 16),
            Card(
              color: const Color(0xFF002147),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "TOTAL POIN MINGGU INI",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "23",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF002147)),
    );
  }

  Widget _buildExpansionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    Widget? trailing,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.blue.shade700, size: 20),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
          trailing: trailing,
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(label,
                style: const TextStyle(color: Colors.grey, fontSize: 13)),
          ),
          const Text(":  ", style: TextStyle(color: Colors.grey)),
          Expanded(
            child: Text(value,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
          ),
        ],
      ),
    );
  }

  Widget _buildPoinCard(
      {required String title,
      required int totalPoin,
      required int m1,
      required int m2,
      required int m3,
      required int m4}) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey.shade300)),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "$totalPoin Pts",
              style: TextStyle(
                  color: Colors.blue.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            const Divider(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildWeekScore("Hari 1", m1),
                _buildWeekScore("Hari 2", m2),
                _buildWeekScore("Hari 3", m3),
                _buildWeekScore("Hari 4", m4),
                _buildWeekScore("Hari 5", m4),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWeekScore(String label, int score) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(score.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }

  Widget _buildEmptyState(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Center(
          child: Text(text, style: TextStyle(color: Colors.grey.shade500))),
    );
  }

  Widget _buildAddButton(String text) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add, size: 18),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF002147),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildLegend(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildCalendar() {
    List<String> days = [
      "03",
      "04",
      "05",
      "06",
      "07",
      "10",
      "11",
      "12",
      "13",
      "14",
      "17",
      "18",
      "19",
      "20",
      "21",
      "24",
      "25",
      "26",
      "27",
      "28",
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: days.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          alignment: Alignment.center,
          child: Text(
            days[index],
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }
}
