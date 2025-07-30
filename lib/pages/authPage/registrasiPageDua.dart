import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing/widgets/button.dart';
import 'package:testing/widgets/inputForm.dart';

class RegistrasiPageDua extends StatelessWidget {
  static const routeName = '/registrasiPageDua';
  const RegistrasiPageDua({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Amankan akun anda!',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                ),
              ),
              Text(
                'Buat password yang kuat dan dapat anda diingat',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Color(0xFF828282),
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'Password',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 10.h),
              InputPassword(controller: TextEditingController()),
              SizedBox(height: 20.h),
              Text(
                'Konfirmasi Password',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 10.h),
              InputPassword(controller: TextEditingController()),

              SizedBox(height: 40.h),
              LongButton(
                text: 'Daftar',
                color: '007B29',
                colorText: 'FFFFFF',
                onPressed: () {
                  Navigator.pushNamed(context, '/navbar');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
