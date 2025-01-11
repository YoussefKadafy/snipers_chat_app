import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:snipers/consts/consts.dart';
import 'package:snipers/helper/snack_bar.dart';
import 'package:snipers/screens/chat_screen.dart';
import 'package:snipers/widgets/custom_bottum.dart';
import 'package:snipers/widgets/custom_widget.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  static String id = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;
  bool isShowPassword = true;

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
                    'Register',
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
                        return 'Enter email adress';
                      }
                    },
                    onChanged: (data) {
                      email = data;
                    },
                    color: Color(0xffFFCB45),
                    hintText: 'Enter your email',
                    labelText: 'Email',
                    obsecureText: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
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
                          : Icon(
                              Icons.visibility,
                              color: Color(0xffFFCB45),
                            ),
                    ),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Color(0xffFFCB45),
                    ),
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
                    labelText: 'Password',
                    obsecureText: isShowPassword,
                  ),
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
                            UserCredential user = await getUser();
                            getSnackBar(context, 'registration is successed');
                            Navigator.pushNamed(context, ChatScreen.id);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'email-already-in-use') {
                              getSnackBar(context, 'Email already exist');
                            } else if (e.code == 'weak-password') {
                              getSnackBar(context, 'password is weak');
                            } else {
                              getSnackBar(
                                  context, 'Registration failed: ${e.message}');
                            }
                          }
                        }
                        isLoading = false;
                        setState(() {});
                      } else {
                        getSnackBar(context, 'validation error');
                      }
                    },
                    tittle: 'Sign up',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'have an account already ?',
                        style: TextStyle(
                            fontSize: 22,
                            //fontWeight: FontWeight.bold,
                            color: Color(0xffFFCB45)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login now ',
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

  Future<UserCredential> getUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    return user;
  }
}
