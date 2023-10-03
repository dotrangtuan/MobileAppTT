import 'package:app_auth/pages/home_page.dart';
import 'package:app_auth/pages/login_or_register.dart';
import 'package:app_auth/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


// xác thực
// nếu đã đăng nhập thì vào màn hình home
// nếu chưa thì ở màn hình đăng ký
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginOrRegister();
            }
        }
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}