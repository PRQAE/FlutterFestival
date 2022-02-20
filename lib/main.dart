import 'package:dash_invitation/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dash | داش',
        theme: ThemeData(
          textTheme: GoogleFonts.tajawalTextTheme()
              .apply(bodyColor: const Color(0xff252a30)),
          primarySwatch: Colors.blue,
          backgroundColor: const Color(0xfff6f7f9),
        ),
        home: ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return const Home();
          },
        ));
  }
}
