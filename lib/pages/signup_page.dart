import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:second_app/helpers/login_helper.dart';
import 'package:second_app/models/user.dart';
import 'package:second_app/pages/login_page.dart';
import '../widgets/custom_inputs.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final User _user = User();
  LoginHelper log = LoginHelper();

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
              Container(
                width: w,
                height: h * 0.35,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/signup.png"), fit: BoxFit.fill)),
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.16,
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60,
                      backgroundImage: AssetImage("img/profile1.png"),
                    )
                  ],
                ),
              ),
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
                      textInputType: TextInputType.text,
                      validator: RequiredValidator(errorText: 'enter username'),
                      onsaved: (value) => _user.userName = value!,
                      hintText: 'username',
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
                      onsaved: (value) => _user.pwd = value!,
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
                          "Create your account",
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
                    log.saveUser(_user);
                    Get.to(() => const LoginPage(),
                        transition: Transition.leftToRightWithFade);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('invalid input')));
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
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have an account?",
                    style: const TextStyle(fontSize: 20, color: Colors.grey)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
