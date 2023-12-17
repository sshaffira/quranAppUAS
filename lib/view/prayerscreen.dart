import 'package:flutter/material.dart';
import 'package:quran_uas/globals.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
                          )
                        ],
                    body: Dashboard(height: height,)))));
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
            bottom: 0, right: 0, 
            child: Image.asset('assets/svgs/prayer.png'), height: 120, width: 150,),
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
                    'Waktu Sholat',
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
                'JANGAN LUPAKAN SHOLAT',
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
                '"Sholat Lebih Baik Daripada Tidur"',
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
}

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sholat Times',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SholatColumn(
                      names: ['Shubuh', 'Dhuhr', 'Asr', 'Maghrib', 'Isha']),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Adzan Times',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  AdzanColumn(times: [
                    '03:44 AM',
                    '11:29 PM',
                    '2:55 PM',
                    '5:46 PM',
                    '7:02 PM'
                  ]),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SholatColumn extends StatelessWidget {
  final List<String> names;

  const SholatColumn({Key? key, required this.names}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: names.map((name) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            name,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class AdzanColumn extends StatelessWidget {
  final List<String> times;

  const AdzanColumn({Key? key, required this.times}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: times.map((time) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            time,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        );
      }).toList(),
    );
  }
}
