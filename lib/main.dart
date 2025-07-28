import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/authPage/loginPage.dart';
import 'package:testing/pages/authPage/registrasiPage.dart';
import 'package:testing/pages/authPage/registrasiPageDua.dart';
import 'package:testing/pages/authPage/registrasiPageSatu.dart';
import 'package:testing/pages/chatbotPage/chatbotPage.dart';
import 'package:testing/pages/navbar.dart';
import 'package:testing/pages/starterPage/splashPage.dart';
import 'package:testing/pages/starterPage/starterPageSatu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing/providers/chatbotProvider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatbotProvider()),
      ],
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
          routes: {
            StarterPageSatu.routeName: (context) => StarterPageSatu(),
            LoginPage.routeName: (context) => LoginPage(),
            RegistrasiPage.routeName: (context) => RegistrasiPage(),
            RegistrasiPageSatu.routeName: (context) => RegistrasiPageSatu(),
            RegistrasiPageDua.routeName: (context) => RegistrasiPageDua(),
            Navbar.routeName: (context) => Navbar(),
            ChatbotPage.routeName: (context) => ChatbotPage(),
          },
        );
      },
    );
  }
}
