import 'package:dash_invitation/home.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dash | داش',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.tajawalTextTheme()
              .apply(bodyColor: const Color(0xff252a30)),
          primarySwatch: Colors.blue,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
        home: ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return  const Home();
          },
        ));
  }
}
