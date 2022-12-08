// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:e_commerce/Pages/authintication/login.dart';
import 'package:e_commerce/Pages/products/dialogs/signup_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../provider/auth-provider.dart';
import '../../utils/validator/validator.dart';
import '../Home/home-page.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "ToDo App",
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "sign up",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(66),
                          border: Border.all(
                            color: Color.fromARGB(255, 158, 152, 235),
                          ),
                        ),
                        width: 266,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          validator: Validators.validateEmail,
                          controller: emailController,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                              ),
                              hintText: "Your Email :",
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 158, 152, 235),
                          ),
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 266,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          validator: Validators.validateSimpleString,
                          controller: usernameController,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                size: 19,
                              ),
                              hintText: "username :",
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 158, 152, 235),
                          ),
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 266,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          validator: Validators.validatePassword,
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              suffix: Icon(
                                Icons.visibility,
                              ),
                              icon: Icon(
                                Icons.lock,
                                size: 19,
                              ),
                              hintText: "Password :",
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .signup(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                    usernameController.text.trim(),
                                    context);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SignupSuccessfullyDialog();
                                });
                            Future.delayed(Duration(seconds: 3), () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            });
                          }
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 89, vertical: 5)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27))),
                        ),
                        child: Text(
                          "sign up",
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      "login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              SizedBox(
                width: 299,
                child: Row(
                  children: const [
                    Expanded(
                        child: Divider(
                      thickness: 0.6,
                    )),
                    Text(
                      "OR",
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.6,
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
