import 'package:flutter/material.dart';
import 'package:jurnalku_app/login_page.dart';

class ProfilePageLogin extends StatelessWidget {
  const ProfilePageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    const double profileRadius = 45;
    const double positionedBottom = -profileRadius;
    const double spacerHeight = profileRadius + 10;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
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
                      MaterialPageRoute(builder: (context) => LoginPage()),
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
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage("assets/images/boxis.png"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.darken),
                    ),
                  ),
                ),
                Positioned(
                  bottom: positionedBottom,
                  left: 20,
                  child: CircleAvatar(
                    radius: profileRadius,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: profileRadius - 5,
                      backgroundImage: const AssetImage(
                        "assets/images/orange_cat.png",
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: spacerHeight),

            // Name + Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Anak Wikrama",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "12309719 | PPLG XII-5 | Cis 6",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade800),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================================
            // 2. TAB BAR
            // =========================================
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: const Color(0xFF0056D2), // Warna teks aktif
                unselectedLabelColor: Colors.black54, // Warna teks tidak aktif
                indicatorColor: const Color(0xFF0056D2), // Garis bawah biru
                // Jika ingin menghilangkan garis bawah dan hanya main warna teks,
                // set indicatorColor: Colors.transparent
                tabs: const [
                  Tab(text: "Overview"),
                  Tab(text: "Portfolio"),
                  Tab(text: "Sertifikat"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // =========================================
            // 3. ISI TAB (TAB BAR VIEW)
            // =========================================
            Expanded(
              child: TabBarView(
                children: [
                  // --- TAB 1: OVERVIEW ---
                  // Isinya lengkap (Box Portfolio, Sertif, CV, Sosmed)
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 40, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionBox(
                          title: "Portfolio Terbaru",
                          icon: Icons.work,
                          desc: "Portfolio akan ditampilkan di sini",
                        ),
                        _sectionBox(
                          title: "Sertifikat Terbaru",
                          icon: Icons.emoji_events,
                          desc: "Sertifikat akan ditampilkan di sini",
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Dokumen",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        _cvCard(),
                        const SizedBox(height: 20),
                        _socialMediaCard(),
                      ],
                    ),
                  ),

                  // --- TAB 2: PORTFOLIO ---
                  // Hanya menampilkan Container Portfolio
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        _sectionBox(
                          title: "Portfolio",
                          icon: Icons.work,
                          desc: "Portfolio akan ditampilkan di sini",
                          showButton:
                              false, // Opsi sembunyikan tombol lihat semua jika mau
                        ),
                      ],
                    ),
                  ),

                  // --- TAB 3: SERTIFIKAT ---
                  // Container dengan teks khusus
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        _sectionBox(
                          title: "Sertifikat",
                          icon: Icons.emoji_events,
                          desc:
                              "Anda belum mendapatkan sertifikat apapun", // Teks Khusus
                          showButton: false,
                        ),
                      ],
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

  // --- Widget Helper (Sedikit modifikasi agar fleksibel) ---
  Widget _sectionBox({
    required String title,
    required IconData icon,
    required String desc,
    bool showButton =
        true, // Parameter baru untuk menyembunyikan tombol "Lihat Semua"
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                if (showButton)
                  Text(
                    "Lihat Semua",
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      fontSize: 13,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Icon(icon, size: 40, color: Colors.brown.shade400),
          const SizedBox(height: 10),
          Text(
            desc,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // --- Widget Helper: CV Card ---
  Widget _cvCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Curriculum Vitae",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "Dokumen CV siswa",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.file_copy_outlined, size: 18),
              label: const Text("Lihat CV"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003E8C),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
            ),
          )
        ],
      ),
    );
  }

  // --- Widget Helper: Social Media Card ---
  Widget _socialMediaCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Media Sosial",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Colors.black12),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.link, color: Colors.black54),
            ),
            title: const Text(
              "Instagram",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              "https://instagram.com/devaajul/",
              style: TextStyle(color: Colors.blue.shade700),
              overflow: TextOverflow.ellipsis,
            ),
            trailing:
                const Icon(Icons.open_in_new, size: 20, color: Colors.grey),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
