import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quran_uas/globals.dart';
import 'package:quran_uas/style/style.dart';
import 'package:quran_uas/view/Login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
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
                    body: Dashboard(height: height)))));
  }

  AppBar _appBar() => AppBar(
        backgroundColor: background,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(children: [
          IconButton(
              onPressed: (() => {}),
              icon: Image.asset('assets/svgs/menu-icon.png')),
          const SizedBox(
            width: 24,
          ),
          Text(
            'Quran App',
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          InkWell(
            onTap: () {
              _auth.signOut();
              Navigator.push(context, 
              MaterialPageRoute(
                builder: (context) => const Login()));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),),
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

}

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Column(
            children: [
              CustomContainer(
                height1: height * .2,
                image: 'assets/svgs/quran.png',
                title: "Quran",
                color: Color(0xFFB070FD),
                onpressed: () {
                  Navigator.pushNamed(context, '/quran');
                },
              ),
            ],
          ),
        ),
        Spacer(),
        SizedBox(
          child: Column(
            children: [
              CustomContainer(
                height1: height * .2,
                image: 'assets/svgs/pray.png',
                title: "Prayers",
                color: Color(0xFFB070FD),
                onpressed: () {
                  Navigator.pushNamed(context, '/prayer');
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key,
      required this.height1,
      required this.image,
      required this.title,
      required this.color,
      this.onpressed})
      : super(key: key);

  final double height1;
  final String image;
  final String title;
  final Function? onpressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: width * .06),
      child: GestureDetector(
        onTap: () {
          if (onpressed != null) {
            onpressed!(); // Call the provided function if it's not null
          } else {
            // If onpressed is not provided, you can add a default behavior here
            Navigator.pushNamed(context, '/defaultRoute');
          }
        },
        child: Container(
          height: height1,
          width: width * .4,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(1.5, 3), // changes position of shadow
                ),
              ],
              image: const DecorationImage(
                  image: AssetImage('assets/icons/dashboard.png'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(25)),
          child: Container(
            decoration: BoxDecoration(
                color: color.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * .02,
                horizontal: width * .02,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(image),
                    width: width * .15,
                    height: height * .07,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * .02),
                    child: Text(title, style: titleStyle()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
