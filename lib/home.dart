import 'package:dash_invitation/arabic/arabic.dart';
import 'package:dash_invitation/english/english.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF00CCFF)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(),
          Image.asset('assets/dash.png', height: 40.h),
          const SizedBox(
            height: 30.0,
          ),
          Text('مرحباً بك في تطبيق دعوات داش',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
          Text("Welcome in Dash's Invitiaion App.",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            height: 70,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF00CCFF),
                //padding: const EdgeInsets.only(top: 30, bottom: 30)
              ),
              child: Text('العربية',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ArabicHome()),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            height: 70,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF00CCFF),
                //padding: const EdgeInsets.only(top: 30, bottom: 30)
              ),
              child: Text('English',
                  style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EnglishHome()),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
