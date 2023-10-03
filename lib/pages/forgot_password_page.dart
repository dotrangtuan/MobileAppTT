import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Màn hình reset lại mật khẩu
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  Future forgotPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print("------------------------");
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          "Cấp lại mật khẩu",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
              const Text("Bạn hãy nhập địa chỉ Email để chúng tôi"
                  " giúp bạn thiết lập lại mật khẩu:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 20, 48, 20),
                  labelText: "Nhập địa chỉ Email",
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade700,
                    ), // Đổi màu border tại đây
                  ),
                  // enabledBorder: const OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.white)
                  // ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade800, width: 2)
                  ),
                  // fillColor: Colors.grey.shade200,
                  // filled: true,
                  // hintText: hintText,
                  // hintStyle: TextStyle(color: Colors.grey[500])

                ),
              ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
                child: TextButton(
                    onPressed: forgotPassword,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 228, 102),),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Đặt độ cong của border
                          // Các thuộc tính khác của border như borderColor, borderSide cũng có thể được thiết lập ở đây.
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Tiếp tục",
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                    ),
                ),

            ),

          ],
        ),
      ),
    );
  }
}