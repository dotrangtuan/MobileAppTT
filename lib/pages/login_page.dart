import 'package:app_auth/components/error_message.dart';
import 'package:app_auth/components/my_button.dart';
import 'package:app_auth/components/my_textfield.dart';
import 'package:app_auth/components/square_tilte.dart';
import 'package:app_auth/pages/phone_number_page.dart';
import 'package:app_auth/pages/verify_otp.dart';
import 'package:app_auth/services/google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgot_password_page.dart';


class LoginPage extends StatefulWidget {
  LoginPage({super.key, required this.onTap});

  Function() onTap;
  final bool isValid = true;
  final bool isClickSignIn = true;
  final bool isHidePassword = true;


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  late bool _isClickSignIn;
  late bool _localIsValid;
  late bool _isHidePassword;



  @override
  void initState() {
    _localIsValid =  widget.isValid;
    _isClickSignIn = widget.isClickSignIn;
    _isHidePassword = widget.isHidePassword;
  }

  // hàm authention


  void signIn() async {

    setState(() {
      _isClickSignIn = true;
    });


    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );

    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );

        setState(() {
          _localIsValid = true;
        });

      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          setState(() {
            _localIsValid = false;
          });
        }
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          setState(() {
            _localIsValid = false;
          });
        }
      }

    } else {
      setState(() {
        _localIsValid = false;
      });
    }

    Navigator.pop(context);


  }

  @override
  Widget build(BuildContext context) {
    // thiết lập icon ẩn/hiện mật khẩu
    Icon icon = _isHidePassword ?
    const Icon(Icons.visibility_off, size: 20,)
        : const Icon(Icons.visibility, size: 20,);

    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Icon(
                    Icons.lock,
                    size: 80,
                  color: Colors.black,
                ),

                const SizedBox(height: 20),

                //const SizedBox(height: 25),

                MyTextField(
                  controller: emailController,
                  hintText: "Enter Your Email",
                  obscureText: false,
                  isValid: _localIsValid,
                ),

                const SizedBox(height: 14),

                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    MyTextField(
                      controller: passwordController,
                      hintText: "Enter Your Password",
                      obscureText: _isHidePassword,
                      isValid: _localIsValid,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 42),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isHidePassword = !_isHidePassword;
                          });
                        },
                          child: icon
                      ),
                    )
                  ],
                ),



                Visibility(
                  visible: !_localIsValid && _isClickSignIn,
                  child: const ErrorMessage(errorMessage: "Vui lòng kiểm tra lại !"),
                ),

                const SizedBox(height: 18),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(

                        // đẩy sang màn hình reset mật khẩu
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                  return ForgotPasswordPage();
                              })
                          );
                        },
                        child: const Text(
                          "Bạn Quên Mật Khẩu ?",
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black, // Màu của underline
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 1.5
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                MyButton(onTap: signIn, title: "Sign In",),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Expanded(
                            flex: 0,
                            child: Text(
                              'Hoặc Đăng Nhập với',
                              style: TextStyle(
                                color: Colors.grey[700]
                              ),
                            ),

                        ),
                      ),
                      Expanded(
                        flex: 1,
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          )
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                SquareTitle(
                  imagePath: 'assets/images/google.png',
                  onTap: signInWithGoogle,
                  title: "Google",
                ),

                const SizedBox(height: 20),

                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        'Bạn chưa có Tài Khoản?'
                    ),
                    const SizedBox(width: 3,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        color: Colors.white,
                        child: const Text(
                          'Đăng ký ngay',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),

                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

}