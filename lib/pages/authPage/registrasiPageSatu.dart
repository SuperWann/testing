import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing/widgets/button.dart';
import 'package:testing/widgets/inputForm.dart';

class RegistrasiPageSatu extends StatelessWidget {
  static const routeName = '/registrasiPageSatu';
  const RegistrasiPageSatu({super.key});

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
                'Dimana anda berada?',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                ),
              ),
              Text(
                'Masukkan data lokasi',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Color(0xFF828282),
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'Provinsi',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 10.h),
              InputFormWithHintText(
                type: TextInputType.text,
                text: 'Masukkan Nama Lengkap',
                controller: TextEditingController(),
              ),
              SizedBox(height: 20.h),
              Text(
                'Kabupaten',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 10.h),
              InputFormWithHintText(
                type: TextInputType.emailAddress,
                text: 'Masukkan Email',
                controller: TextEditingController(),
              ),
              SizedBox(height: 20.h),
              Text(
                'Kecamatan',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 10.h),
              InputFormWithHintText(
                type: TextInputType.emailAddress,
                text: 'Masukkan Nomor Telepon',
                controller: TextEditingController(),
              ),
              SizedBox(height: 40.h),
              LongButton(
                text: 'Lanjutkan',
                color: '007B29',
                colorText: 'FFFFFF',
                onPressed: () {
                  Navigator.pushNamed(context, '/registrasiPageDua');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
