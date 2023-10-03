import 'package:app_auth/components/error_message.dart';
import 'package:app_auth/components/my_button.dart';
import 'package:app_auth/components/my_textfield.dart';
import 'package:app_auth/components/square_tilte.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/google_auth.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key, required this.onTap});

  late Function() onTap;

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  late bool _isClickSignUp;
  late bool _localIsValid;
  late bool _isHidePassword;
  late bool _isHideConfirmPassword;
  late String _messageError;



  @override
  void initState() {
    _localIsValid =  true;
    _isClickSignUp = true;
    _isHidePassword = true;
    _isHideConfirmPassword = true;
    _messageError = "";
  }


  void signUp() async {
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
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          setState(() {
            _messageError = "Tối thiểu 6 ký tự !";
            _localIsValid = false;
          });
        }
        // check email tồn tại
        if (e.code == 'email-already-in-use') {
          setState(() {
            _messageError = "Email đã tồn tại !";
            _localIsValid = false;
          });
        }
      }

    } else {
      setState(() {
        _messageError = "Không được để trống !";
        _localIsValid = false;
      });
    }

    // ignore: use_build_context_synchronously
    Navigator.pop(context);


  }

  @override
  Widget build(BuildContext context) {
    // thiết lập icon ẩn/hiện mật khẩu
    Icon icon1 = _isHidePassword ?
    const Icon(Icons.visibility_off, size: 20,)
        : const Icon(Icons.visibility, size: 20,);

    Icon icon2 = _isHideConfirmPassword ?
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
                ),

                const SizedBox(height: 20),

                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                  isValid: _localIsValid,
                ),

                const SizedBox(height: 14),

                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    MyTextField(
                      controller: passwordController,
                      hintText: "Password",
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
                          child: icon1
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 14),

                Visibility(
                  visible: !_localIsValid && _isClickSignUp,
                  child: ErrorMessage(errorMessage: _messageError),
                ),

                const SizedBox(height: 28),

                MyButton(onTap: signUp, title: "Sign Up"),

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

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        'Bạn Đã Có Tài Khoản?'
                    ),
                    const SizedBox(width: 3,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.white,
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                              color: Colors.blue,
                          ),
                        ),

                      ),
                    )
                  ],
                )

              ],
            ),
          )
        ),
      ),
    );

  }
}