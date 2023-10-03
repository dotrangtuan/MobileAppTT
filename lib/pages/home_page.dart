import 'package:app_auth/components/user_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NavBar();


  }

}