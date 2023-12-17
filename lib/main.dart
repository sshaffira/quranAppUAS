import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quran_uas/view/Login.dart';
import 'package:quran_uas/view/home1.dart';
import 'package:quran_uas/view/prayerscreen.dart';
import 'package:quran_uas/view/splash_screen.dart';
import 'package:quran_uas/view/surahscreen.dart';
import 'package:quran_uas/tabs/surah_tab.dart';


late FirebaseApp app;
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB67XnA5Lp1AtEaEnPUpQtc99KDwr1zhew", 
      appId: "1:446923152710:android:198377ee2c9b72202d1947", 
      messagingSenderId: "446923152710", 
      projectId: "my-quran-d5cbb"));
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/splash',
      routes: {
        '/': (context) => Login(),
        '/splash': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/quran': (context) => SurahScreen(),
        '/prayer': (context) => PrayerScreen(),
        '/surah': (context) => SurahTab(),
      },
    );
  }
}

