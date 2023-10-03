import 'package:app_auth/components/error_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Màn hình reset lại mật khẩu
class PhoneNumberPage extends StatefulWidget {

  Function() onTap;
  PhoneNumberPage({super.key, required this.onTap});


  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final _emailController = TextEditingController();
  late bool isClickButton = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Đăng nhập bằng số điện thoại"
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          const Text("Bạn hãy nhập số điện thoại để chúng tôi gửi mã xác thực:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(20, 20, 48, 20),
                labelText: "Nhập số điện thoại",
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
              keyboardType: TextInputType.number,
            ),
          ),

          //isClickButton ?  ErrorMessage(errorMessage: "Không được để trống !"),

          const SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              width: double.infinity,
              child: TextButton(
                onPressed: widget.onTap,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
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
                        color: Colors.white
                    ),
                  ),
                ),
              ),

            ),
          ),

        ],
      ),
    );
  }
}