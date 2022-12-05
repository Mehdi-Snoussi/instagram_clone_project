import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:second_app/pages/bottom_app.dart';
import 'package:second_app/pages/home_page.dart';
import 'package:second_app/pages/signup_page.dart';
import 'package:second_app/widgets/custom_header.dart';

import '../widgets/custom_inputs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _userName;
  late String _password;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const CustomHeader(),
              Container(
                width: w,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    CustomInputs(
                      obscureText: false,
                      textInputType: TextInputType.emailAddress,
                      validator: RequiredValidator(errorText: 'enter email'),
                      onsaved: (value) => _userName = value!,
                      hintText: 'Email',
                      prefix: const Icon(
                        Icons.email,
                        color: Color.fromRGBO(255, 171, 64, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomInputs(
                      obscureText: true,
                      textInputType: TextInputType.text,
                      validator: RequiredValidator(errorText: 'enter password'),
                      onsaved: (value) => _password = value!,
                      hintText: 'Password',
                      prefix: const Icon(
                        Icons.password_outlined,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          "Sign into your account",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print(_userName + " " + _password);
                    Get.to(() => const BottomScreen(), transition: Transition.leftToRightWithFade);
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('invalid')));
                  }
                },
                child: Ink(
                  width: w * 0.5,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage("img/loginbtn.png"),
                          fit: BoxFit.fill)),
                  child: const Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              RichText(
                text: TextSpan(
                    text: "Dont't have an account?",
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => SignUpPage(), transition: Transition.leftToRightWithFade),
                        text: " Create",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
