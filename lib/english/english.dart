import 'package:dash_invitation/english/english_view.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EnglishHome extends StatefulWidget {
  const EnglishHome({Key? key}) : super(key: key);

  @override
  State<EnglishHome> createState() => _EnglishHomeState();
}

class _EnglishHomeState extends State<EnglishHome> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              elevation: 0,
              iconTheme: const IconThemeData(color: Color(0xFF00CCFF)),
            ),
            body: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  Image.asset(
                    'assets/dash-smart.png',
                    height: 40.h,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text('Enter Invitated Name',
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
                            border: OutlineInputBorder(),
                            labelText: 'Invitated Name')),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text('Choose City',
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
                            child: Text('Riyadh'),
                            value: 'riyadh',
                          ),
                          DropdownMenuItem(
                            child: Text('Jeddah'),
                            value: 'jeddah',
                          ),
                          DropdownMenuItem(
                            child: Text('Dammam'),
                            value: 'dammam',
                          ),
                          DropdownMenuItem(
                            child: Text('Online'),
                            value: 'Online',
                          ),
                        ],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'City')),
                  ),
                  const SizedBox(
                    height: 50.0,
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
                        child: Text('Next',
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
                                    builder: (context) => EnglishView(
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
            )));
  }
}
