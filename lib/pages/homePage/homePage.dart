import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.16,
              right: 10.w,
              child: FloatingActionButton(
                shape: const CircleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                elevation: 2,
                backgroundColor: Color(0xFFF7AB0A),
                onPressed: () {
                  Navigator.pushNamed(context, '/chatbotPage');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image(
                    image: const AssetImage('assets/images/logo-ai-chat.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
