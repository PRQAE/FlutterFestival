import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ArabicView extends StatelessWidget {
  const ArabicView({Key? key, required this.name, required this.city})
      : super(key: key);
  final String name;
  final String city;

  @override
  Widget build(BuildContext context) {
    String cityText = city == 'riyadh'
        ? 'في مدينة الرياض'
        : city == 'jeddah'
            ? 'في مدينة جدة'
            : city == 'dammam'
                ? 'في مدينة الدمام'
                : 'اون لاين على زوم';
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
                                  Text('دعوة حضور',
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 20),
                                  Text('عزيزي / ' + name,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 10),
                                  Text('سأسعد برؤيتك يوم 19 نوفمبر،',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600)),
                                  Text(cityText,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 16),
                                  Text('مع تحياتي،',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600)),
                                  Text('داش.',
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
                    child: Text('مشاركة كـ نص',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600)),
                    onPressed: () => Share.share("""
                        دعوة حضور

                        عزيزي / $name

                        سأسعد برؤيتك يوم 19 نوفمبر،
                        $cityText
                        
                        مع تحياتي،
                        داش.
                        """, subject: 'دعوة حضور لـ $name')),
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
                    child: Text('مشاركة كـ صورة',
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
