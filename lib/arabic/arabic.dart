import 'package:dash_invitation/arabic/arabic_view.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ArabicHome extends StatefulWidget {
  const ArabicHome({Key? key}) : super(key: key);

  @override
  State<ArabicHome> createState() => _ArabicHomeState();
}

class _ArabicHomeState extends State<ArabicHome> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            elevation: 0,
            iconTheme: const IconThemeData(color: Color(0xFF00CCFF)),
          ),
          body: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/dash-smart.png',
                    height: 40.h,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text('أدخل إسم المدعو',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: FormBuilderTextField(
                        name: 'name',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'المدعو')),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text('أختر المدينة',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: FormBuilderDropdown(
                        name: 'city',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        items: const [
                          DropdownMenuItem(
                            child: Text('الرياض'),
                            value: 'riyadh',
                          ),
                          DropdownMenuItem(
                            child: Text('جدة'),
                            value: 'jeddah',
                          ),
                          DropdownMenuItem(
                            child: Text('الدمام'),
                            value: 'dammam',
                          ),
                          DropdownMenuItem(
                            child: Text('اون لاين'),
                            value: 'Online',
                          ),
                        ],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'المدينة')),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
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
                        child: Text('التالي',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ArabicView(
                                        name: _formKey
                                            .currentState!.value['name'],
                                        city: _formKey
                                            .currentState!.value['city'])));
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              )),
        ));
  }
}
