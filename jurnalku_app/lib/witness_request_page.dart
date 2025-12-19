import 'package:flutter/material.dart';
import 'package:jurnalku_app/widgets/dashboard_app_bar.dart';


class WitnessRequestPage extends StatelessWidget {
  const WitnessRequestPage({super.key});

  String getTodayDate() {
    final now = DateTime.now();

    const days = [
      "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"
    ];

    const months = [
      "Januari", "Februari", "Maret", "April", "Mei", "Juni",
      "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ];

    String dayName = days[now.weekday - 1];
    String monthName = months[now.month - 1];

    return "$dayName, ${now.day} $monthName ${now.year}";
  }

  @override
  Widget build(BuildContext context) {
    final today = getTodayDate();

    return Scaffold(
      appBar: DashboardAppBar(titleText: "Permintaan Saksi"),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),

              const Text(
                "Permintaan Saksi",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                "Kelola permintaan menjadi saksi dari siswa lain",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color(0xffe5edff),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  today,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff2e4cff),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: Text(
                        "PENGIRIM",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "TANGGAL",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "KONFIRMASI",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.groups_2_outlined,
                          size: 50,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Belum ada permintaan",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Belum ada yang mengirim permintaan saksi kepada Anda",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
