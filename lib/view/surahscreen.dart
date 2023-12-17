import 'package:flutter/material.dart';
import 'package:quran_uas/globals.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  List _surah = [
    SurahTile(namaSurah: "An-Naba'", noSurah: 78),
    SurahTile(namaSurah: "An-Nazi'at", noSurah: 79),
    SurahTile(namaSurah: "'Abasa", noSurah: 80),
    SurahTile(namaSurah: "At-Takwir", noSurah: 81),
    SurahTile(namaSurah: "Al-Infithar", noSurah: 82),
    SurahTile(namaSurah: "Al-Muthaffifiin", noSurah: 83),
    SurahTile(namaSurah: "Al-Insyiqaq", noSurah: 84),
    SurahTile(namaSurah: "Al-Buruj", noSurah: 85),
    SurahTile(namaSurah: "At-Thariq", noSurah: 86),
    SurahTile(namaSurah: "Al-A'la", noSurah: 87),
    SurahTile(namaSurah: "Al-Gasyiyah", noSurah: 88),
    SurahTile(namaSurah: "Al-Fajr", noSurah: 89),
    SurahTile(namaSurah: "Al-Balad", noSurah: 90),
    SurahTile(namaSurah: "As-Syams", noSurah: 91),
    SurahTile(namaSurah: "Al-Lail", noSurah: 92),
    SurahTile(namaSurah: "Ad-Dhuha", noSurah: 93),
    SurahTile(namaSurah: "Al-Insyirah", noSurah: 94),
    SurahTile(namaSurah: "At-Tin", noSurah: 95),
    SurahTile(namaSurah: "Al-Alaq", noSurah: 96),
    SurahTile(namaSurah: "Al-Qadr", noSurah: 97),
    SurahTile(namaSurah: "Al-Bayyinah", noSurah: 98),
    SurahTile(namaSurah: "Al-Zalzalah", noSurah: 90),
    SurahTile(namaSurah: "Al-Adiyat", noSurah: 100),
    SurahTile(namaSurah: "Al-Adiyat", noSurah: 101),
    SurahTile(namaSurah: "Al-Qori'ah", noSurah: 102),
    SurahTile(namaSurah: "At-Takasur", noSurah: 103),
    SurahTile(namaSurah: "Al-'Asr", noSurah: 104),
    SurahTile(namaSurah: "Al-Humazah", noSurah: 105),
    SurahTile(namaSurah: "Al-Fill", noSurah: 106),
    SurahTile(namaSurah: "Al-Quraisy", noSurah: 107),
    SurahTile(namaSurah: "Al-Ma'un", noSurah: 108),
    SurahTile(namaSurah: "Al-Kausar", noSurah: 109),
    SurahTile(namaSurah: "Al-Kafirun", noSurah: 110),
    SurahTile(namaSurah: "Al-Nasr", noSurah: 111),
    SurahTile(namaSurah: "Al-Lahab", noSurah: 112),
    SurahTile(namaSurah: "Al-Falaq", noSurah: 113),
    SurahTile(namaSurah: "An-Nas", noSurah: 114),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: _appBar(),
        body: DefaultTabController(
            length: 4,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                          SliverToBoxAdapter(
                            child: _greeting(),
                          ),
                          SliverAppBar(
                            pinned: true,
                            elevation: 0,
                            backgroundColor: background,
                            automaticallyImplyLeading: false,
                            shape: Border(
                                bottom: BorderSide(
                                    width: 3,
                                    color: const Color(0xFFAAAAAA)
                                        .withOpacity(.1))),
                            bottom: PreferredSize(
                              preferredSize: const Size.fromHeight(0),
                              child: _tab(),
                            ),
                          )
                        ],
                    body: ListView.builder(
                        itemCount: _surah.length,
                        itemBuilder: (context, index) => _surah[index])))));
  }

  AppBar _appBar() => AppBar(
        backgroundColor: background,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context, '/home');
            },
            icon: Icon(Icons.arrow_back), color: Colors.white,
          ),
          Text(
            'Quran App',
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          const Spacer(),
        ]),
      );

  Column _greeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamualaikum',
          style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: text),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Nazira Cantik',
          style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        const SizedBox(
          height: 24,
        ),
        _lastRead()
      ],
    );
  }

  Stack _lastRead() {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0,
                    .6,
                    1
                  ],
                  colors: [
                    Color(0xFFDF98FA),
                    Color(0xFFB070FD),
                    Color(0xFF9055FF)
                  ])),
        ),
        Positioned(
            bottom: 0, right: 0, child: Image.asset('assets/svgs/quran.png')),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/svgs/book.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Last Read',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Al-Fatihah',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Ayat No: 1',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  TabBar _tab() {
    return TabBar(
        unselectedLabelColor: text,
        labelColor: Colors.white,
        indicatorColor: primary,
        indicatorWeight: 3,
        tabs: [_tabItem(label: "Surah")]);
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(
            fontFamily: 'Nunito', fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class SurahTile extends StatelessWidget {
  final String namaSurah;
  final int noSurah;
  const SurahTile({
    super.key,
    required this.namaSurah,
    required this.noSurah,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4,
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/surah', arguments: {
          'noSurah': noSurah,
          'nama_surah': namaSurah,
        }),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //Surah Number
                Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  child: Text(
                    noSurah.toString(),
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                // Surah Name and Juz
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaSurah,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
