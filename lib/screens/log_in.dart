import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:snipers/consts/consts.dart';
import 'package:snipers/helper/snack_bar.dart';
import 'package:snipers/screens/chat_screen.dart';
import 'package:snipers/screens/register.dart';
import 'package:snipers/widgets/custom_bottum.dart';
import 'package:snipers/widgets/custom_widget.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});
  static String id = 'login';

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;
  String? email;
  String? password;
  bool isShowPassword = true;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 200,
                    width: 220,
                    child: Image.asset('assets/logo (1).png'),
                  ),
                  Text(
                    'Snipers Chats',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 44,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico',
                        color: Colors.orange),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 34,
                        //fontWeight: FontWeight.bold,
                        color: Color(0xffFFCB45)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xffFFCB45),
                      ),
                      obsecureText: false,
                      suffixIcon: IconButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                          },
                          icon: Icon(
                            Icons.done,
                            color: Color(0xffFFCB45),
                          )),
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'Enter email adress ';
                        }
                      },
                      onChanged: (data) {
                        email = data;
                      },
                      color: Color(0xffFFCB45),
                      hintText: 'Enter your email',
                      labelText: 'Email'),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Color(0xffFFCB45),
                      ),
                      obsecureText: isShowPassword,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isShowPassword = !isShowPassword;
                              print(isShowPassword);
                            });
                          },
                          icon: isShowPassword
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Color(0xffFFCB45),
                                )
                              : Icon(Icons.visibility,
                                  color: Color(0xffFFCB45))),
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'Enter password';
                        }
                      },
                      onChanged: (data) {
                        password = data;
                      },
                      color: Color(0xffFFCB45),
                      hintText: 'Enter your password',
                      labelText: 'Password'),
                  SizedBox(
                    height: 20,
                  ),
                  CustomBottum(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        if (email != null && password != null) {
                          try {
                            // await signUser();
                            Navigator.pushNamed(context, ChatScreen.id,
                                arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              getSnackBar(
                                  context, 'User not found register first ');
                            } else if (e.code == 'weak-password') {
                              getSnackBar(context, 'password is weak');
                            } else {
                              getSnackBar(
                                  context, 'Registration failed: ${e.message}');
                            }
                          } catch (e) {
                            log(e.toString());
                            getSnackBar(context, 'errrrrrrrror');
                          }
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    tittle: 'Sign in',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Don\'t have an account ? ',
                        style: TextStyle(
                            fontSize: 22,
                            //fontWeight: FontWeight.bold,
                            color: Color(0xffFFCB45)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: Text(
                            'Register now ',
                            style: TextStyle(
                                fontSize: 22,
                                //fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
