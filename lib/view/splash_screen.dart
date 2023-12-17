import 'package:flutter/material.dart';
import 'package:quran_uas/globals.dart';
import 'package:quran_uas/view/Login.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Quran App',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Learn Quran and\nRecite once everyday',
                    style: TextStyle( fontFamily: 'Nunito', fontSize: 18, color: text),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 450,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFF672CBC)),
                        child: Image.asset('assets/svgs/splash.png'),
                      ),
                      Positioned(
                        left: 0,
                        bottom: -23,
                        right: 0,
                        child: Center(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Login(),
                              ));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 16),
                              decoration: BoxDecoration(
                                  color: orange,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                   fontFamily: 'Nunito', fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

