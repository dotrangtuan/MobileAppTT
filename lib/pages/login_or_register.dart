import 'package:app_auth/pages/home_page.dart';
import 'package:app_auth/pages/login_page.dart';
import 'package:app_auth/pages/preview_video.dart';
import 'package:app_auth/pages/register_page.dart';
import 'package:app_auth/pages/verify_otp.dart';
import 'package:app_auth/pages/video_list.dart';
import 'package:app_auth/pages/video_page.dart';
import 'package:flutter/cupertino.dart';

import '../components/test_thumbnail.dart';


// chuyển qua lại giữa màn hình đăng ký và đăng nhập
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  late bool isShowLoginPage = true;
  void togglePages() {
    setState(() {
      isShowLoginPage = !isShowLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    if (isShowLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}