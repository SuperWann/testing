// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      bool isRead = prefs.getBool('isRead') ?? false;

      if (isRead) {
        Navigator.pushReplacementNamed(context, '/loginPage');
        
      } else {
        Navigator.pushReplacementNamed(context, '/starterPageSatu');
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/images/bg-splash.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: Image.asset('assets/images/logo-nama.png'),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
            child: Text(
              'Menjembatani masyarakat untuk belajar, bertransaksi, dan berinteraksi dalam menjaga ketahanan pangan.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
