import 'package:app_auth/components/real_time.dart';
import 'package:app_auth/pages/video_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

import '../services/configure_database.dart';
import '../services/notifi_service.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: Container(
            color: Color.fromARGB(255, 255, 228, 102),
            child: ListView(

              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                    accountName: Text(
                        user!.displayName!,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 29, 48, 65)
                      ),
                    ),
                    accountEmail: Text(
                        user!.email!,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 29, 48, 65)
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(child: Image.asset("assets/images/avatar2.png"),),
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 228, 102)
                    ),
                ),

                ListTile(
                  onTap: () {

                  },
                    leading: const Icon(
                      Icons.person,
                        color: Color.fromARGB(255, 29, 48, 65)

                    ),
                  title: const Text(
                      "Profile",
                    style: TextStyle(
                        color: Color.fromARGB(255, 29, 48, 65)
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {

                  },
                  leading: const Icon(
                      Icons.settings,
                      color: Color.fromARGB(255, 29, 48, 65)
                  ),
                  title: const Text(
                      "Setting",
                    style: TextStyle(
                        color: Color.fromARGB(255, 29, 48, 65)
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      backgroundColor: Colors.white,
                      surfaceTintColor: Colors.white,
                      title: const Icon(
                          Icons.info,
                          size: 42,
                          color: Colors.redAccent,
                      ),
                      content: const Text(
                          'Bạn có chắc chắn muốn đăng xuất không ?',
                          textAlign: TextAlign.center,
                      ),
                      actions: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.pop(context, 'Cancel'),
                          child: Container(
                            width: 126,
                            height: 42,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black)
                            ),
                            child: const Center(
                              child: Text(
                                  'Đóng',
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context, 'OK');
                            await FirebaseAuth.instance.signOut();
                          },
                          child: Container(
                            width: 126,
                            height: 42,
                            //padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 228, 102),
                                borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Đồng ý',
                              ),
                            ),
                          ),
                        ),
                      ],
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  leading: const Icon(
                      Icons.logout,
                      color: Color.fromARGB(255, 29, 48, 65)
                  ),
                  title: const Text(
                      "Sign Out",
                    style: TextStyle(
                        color: Color.fromARGB(255, 29, 48, 65)
                    ),
                  ),
                )
              ],
            ),
          ),

        ),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent
          ),
          elevation: 0.5,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                    Icons.menu_rounded,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () { Scaffold.of(context).openDrawer(); },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          centerTitle: true,
          title: const Text(
              "Chống Trộm"
          ),
          actions: <Widget>[
            Container(
              width: 40.0, // Đặt chiều rộng và chiều cao theo ý muốn của bạn
              height: 40.0,
              margin: const EdgeInsets.only(right: 14),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/images/avatar2.png")
            ),
          ],
        ),
        body: <Widget> [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, size: 20,color: Color.fromARGB(255, 255, 228, 102),),
                          SizedBox(width: 10,),
                          Text("Streaming"),
                        ],
                      ),
                      RealTime(),
                    ],
                  ),

                  const SizedBox(height: 20,),
                  const Mjpeg(
                    isLive: true,
                    stream: 'http://192.168.132.229:81/stream',
                  ),
                  TextButton(
                      onPressed: () {
                        sendData("ON", "HT");
                      },
                      child: const Text("Bật Hệ Thống")),
                  TextButton(
                      onPressed: () {
                        sendData("OFF", "HT");
                      },
                      child: const Text("Tắt Hệ Thống")),
                  TextButton(
                      onPressed: () {
                        NotificationService()
                            .showNotification(title: 'Sample title', body: 'Cảnh báo có trộm !');
                      },
                      child: const Text("Gửi thông báo")),
                ],
              ),
            ),
          Text("hihi"),
          VideoList(),
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          elevation: 8,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Color.fromARGB(255, 255, 228, 102),
          selectedIndex: currentPageIndex,
          destinations: const <Widget> [
            NavigationDestination(
              //selectedIcon: Icon(Icons.home_outlined, color: Colors.black,),
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              //selectedIcon: Icon(Icons.home_outlined, color: Colors.black,),
              icon: Icon(Icons.control_camera_rounded),
              label: 'Control',
            ),
            NavigationDestination(
              icon: Icon(Icons.movie_creation_rounded),
              label: 'Video Recorded',
            ),
          ],
        ),
      ),
    );
  }
}
