// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:e_commerce/Pages/authintication/signup.dart';
import 'package:e_commerce/provider/auth-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../Home/home-page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Log in",
                  style: TextStyle(fontSize: 33),
                ),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  width: 288,
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(66),
                            border: Border.all(
                              color: const Color.fromARGB(255, 158, 152, 235),
                            ),
                          ),
                          width: 266,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            // validator: Validators.validateEmail,
                            controller: emailController,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                ),
                                hintText: "Your Email :",
                                border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 158, 152, 235),
                            ),
                            borderRadius: BorderRadius.circular(66),
                          ),
                          width: 266,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            //  validator: Validators.validatePassword,
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
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
                        ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .login(emailController.text.trim(),
                                      passwordController.text.trim());
                            }
                            await Future.delayed(const Duration(seconds: 2));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 106, vertical: 10)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27))),
                          ),
                          child: const Text(
                            "login",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: const Text(
                          "sign up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
