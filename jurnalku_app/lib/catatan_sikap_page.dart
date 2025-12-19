import 'package:flutter/material.dart';
import 'package:jurnalku_app/widgets/dashboard_app_bar.dart';


class CatatanSikapPage extends StatelessWidget {
  const CatatanSikapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        "no": 1,
        "kategori": "Kerapian",
        "catatan": "Tidak memakai seragam lengkap.",
        "status": "Dalam Perbaikan",
        "dilaporkan": "12 Jan 2025",
        "update": "14 Jan 2025",
      },
      {
        "no": 2,
        "kategori": "Perilaku",
        "catatan": "Sering terlambat masuk kelas.",
        "status": "Sudah Berubah",
        "dilaporkan": "5 Jan 2025",
        "update": "10 Jan 2025",
      },
    ];

    return Scaffold(
      appBar: DashboardAppBar(
        titleText: "Catatan Sikap",
      ),
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            
            const Text(
              "Catatan Sikap Saya",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "Lihat catatan sikap dan perilaku yang telah dilaporkan",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.yellow.shade200),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.warning_amber_rounded,
                      color: Colors.orange),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Jika Anda merasa ada catatan yang tidak sesuai atau keliru, "
                      "silakan hubungi guru jurusan untuk mengajukan klarifikasi.",
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey.shade800),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

          
            Column(
              children: [
                _summaryCard(
                  title: "Total Catatan",
                  value: data.length.toString(),
                  icon: Icons.article_rounded,
                  color: Colors.blue,
                ),
                const SizedBox(height: 16),

                _summaryCard(
                  title: "Dalam Perbaikan",
                  value: data
                      .where((e) => e["status"] == "Dalam Perbaikan")
                      .length
                      .toString(),
                  icon: Icons.bolt_rounded,
                  color: Colors.orange,
                ),
                const SizedBox(height: 16),

                _summaryCard(
                  title: "Sudah Berubah",
                  value: data
                      .where((e) => e["status"] == "Sudah Berubah")
                      .length
                      .toString(),
                  icon: Icons.check_circle_rounded,
                  color: Colors.green,
                ),
              ],
            ),


            const SizedBox(height: 20),

            if (data.isEmpty)
              const _EmptyState()
            else
              Column(
                children: data.map((item) => CatatanItem(item)).toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 14, color: Colors.black54)),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: color.withOpacity(0.15),
                child: Icon(icon, color: color, size: 20),
              )
            ],
          ),
        ],
      ),
    );
  }
}


class CatatanItem extends StatefulWidget {
  final Map<String, dynamic> item;

  const CatatanItem(this.item, {super.key});

  @override
  State<CatatanItem> createState() => _CatatanItemState();
}

class _CatatanItemState extends State<CatatanItem> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      child: Column(
        children: [
          // HEADER → untuk membuka dropdown
          InkWell(
            onTap: () => setState(() => expand = !expand),
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.blue.shade50,
                    child: Text(
                      widget.item["no"].toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item["kategori"],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.circle,
                                size: 10,
                                color: widget.item["status"] == "Sudah Berubah"
                                    ? Colors.green
                                    : widget.item["status"] ==
                                            "Dalam Perbaikan"
                                        ? Colors.orange
                                        : Colors.red),
                            const SizedBox(width: 6),
                            Text(
                              widget.item["status"],
                              style: TextStyle(
                                color:
                                    widget.item["status"] == "Sudah Berubah"
                                        ? Colors.green
                                        : widget.item["status"] ==
                                                "Dalam Perbaikan"
                                            ? Colors.orange
                                            : Colors.red,
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  Icon(
                    expand
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 28,
                    color: Colors.grey[700],
                  ),
                ],
              ),
            ),
          ),

          // DETAIL DROPDOWN
          if (expand)
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _detail("Catatan", widget.item["catatan"]),
                  _detail("Dilaporkan", widget.item["dilaporkan"]),
                  _detail("Update Terakhir", widget.item["update"]),
                  const SizedBox(height: 12),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _detail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }
}


class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        children: [
          Icon(Icons.check_circle_outline,
              size: 70, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          const Text(
            "Tidak ada catatan",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            "Belum ada catatan sikap yang dilaporkan",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
