 import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../widgets/custom_inputs.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

    final _formKey = GlobalKey<FormState>();
    late String _userName;
    late String _password;

  @override
  Widget build(BuildContext context) {
    List images = ["g.png", "t.png", "f.png"];

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
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
                    height: 50,
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
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: w * 0.5,
              height: h * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage("img/loginbtn.png"), fit: BoxFit.fill)),
              child: const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Have an account?",
                  style: const TextStyle(fontSize: 20, color: Colors.grey)),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            RichText(
              text: const TextSpan(
                text: "Sign up using one of the following methods",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            Wrap(
              children: List<Widget>.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("img/" + images[index]),
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}