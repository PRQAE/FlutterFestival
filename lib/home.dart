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
        backgroundColor: const Color(0xfff6f7f9),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff00a992)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(children: [
              const SizedBox(
                height: 50.0,
              ),
              Image.asset('assets/dash.png'),
              const SizedBox(
                height: 30.0,
              ),
              const Text('ادخل رمز التحقق',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'قمنا بإرسال رمز تحقق',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ]),
          )),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            height: 70,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xff00a991),
                //padding: const EdgeInsets.only(top: 30, bottom: 30)
              ),
              child: const Text('دخول',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                  (Route<dynamic> route) => false),
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
