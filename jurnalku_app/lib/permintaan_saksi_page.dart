import 'package:flutter/material.dart';
import 'package:jurnalku_app/widgets/dashboard_app_bar.dart';


class PermintaanSaksiPage extends StatelessWidget {
  const PermintaanSaksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dataSiswa = [
      {
        "nama": "Ahmad Rizky",
        "kelas": "PPLG X-3",
        "status": "Menunggu",
        "pesan": "Tolong jadi saksi saya untuk kejadian di kantin."
      },
      {
        "nama": "Siti Aminah",
        "kelas": "PPLG XI-2",
        "status": "Diterima",
        "pesan": "Makasih ya kak sudah mau jadi saksi helm hilang."
      },
      {
        "nama": "Budi Santoso",
        "kelas": "PPLG XII-5",
        "status": "Ditolak",
        "pesan": "Bro, bantuin jadi saksi tawuran kemarin dong."
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DashboardAppBar(titleText: "Permintaan Saksi"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Daftar Permintaan Masuk",
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold,
                color: Color(0xFF002147),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Di bawah ini adalah daftar siswa yang meminta kamu menjadi saksi untuk laporan mereka.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true, 
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dataSiswa.length,
              itemBuilder: (context, index) {
                final siswa = dataSiswa[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFE3F2FD),
                      child: Text(siswa['nama']![0]),
                    ),
                    title: Text(
                      siswa['nama']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(siswa['kelas']!),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Status: ${siswa['status']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: siswa['status'] == 'Menunggu' ? Colors.orange : Colors.green,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text("Pesan Siswa:"),
                            Text(
                              "\"${siswa['pesan']}\"",
                              style: const TextStyle(fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(height: 10),
                            if (siswa['status'] == 'Menunggu')
                              ElevatedButton(
                                onPressed: (){}, 
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF002147)
                                ),
                                child: const Text("Respon Permintaan", style: TextStyle(color: Colors.white)),
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
