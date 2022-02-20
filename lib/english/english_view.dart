import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class EnglishView extends StatelessWidget {
  const EnglishView({Key? key, required this.name, required this.city})
      : super(key: key);
  final String name;
  final String city;

  @override
  Widget build(BuildContext context) {
    String cityText = city == 'riyadh'
        ? 'in Riyadh City.'
        : city == 'jeddah'
            ? 'in Jeddah City.'
            : city == 'dammam'
                ? 'in Dammam City.'
                : 'Online on Zoom.';
    ScreenshotController screenshotController = ScreenshotController();

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
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
              SizedBox(
                  width: 90.w,
                  child: Screenshot(
                      controller: screenshotController,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                            onTap: null,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/dash-coffee.png',
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 20),
                                  Text('Invitation',
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 20),
                                  Text('Dear ' + name,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 10),
                                  Text("I'll be Happy to See You on 19th of Nov,",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600)),
                                  Text(cityText,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 16),
                                  Text('Kind Regards,',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600)),
                                  Text('Dash.',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 16),
                                ])),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.all(10),
                      ))),
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
                    child: Text('Share as Text',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600)),
                    onPressed: () => Share.share("""
                        Invitation

                        Dear $name

                        I'll be Happy to See You on 19th of Nov,
                        $cityText
                        
                        Kind Regards,
                        Dash.
                        """, subject: 'Invitation For $name')),
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
                    child: Text('Share as Image',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600)),
                    onPressed: () async {
                      await screenshotController
                          .capture(delay: const Duration(milliseconds: 10))
                          .then((Uint8List? image) async {
                        if (image != null) {
                          final directory =
                              await getApplicationDocumentsDirectory();
                          final imagePath =
                              await File('${directory.path}/image.png')
                                  .create();
                          await imagePath.writeAsBytes(image);

                          /// Share Plugin
                          await Share.shareFiles([imagePath.path]);
                        }
                      });
                    }),
              ),
              const SizedBox(height: 30.0)
            ],
          ),
        ));
  }
}
