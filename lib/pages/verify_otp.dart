import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyOTP extends StatefulWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final verificationId;

  VerifyOTP({super.key, required this.verificationId});

  @override
  State<VerifyOTP> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTP> {
  final _emailController = TextEditingController();
  late final _smsCode;
  Future verifyPhoneNumber() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: _smsCode);

      // Sign the user in (or link) with the credential
      await widget.auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print("------------------------");
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 60,
      textStyle: const TextStyle(
          fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Verification"
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const SizedBox(height: 40,),
            const Text("VerifyCation",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Pinput(
                onCompleted: (pin) {
                  print("----------------------");
                  print(pin);
                  setState(() {
                    _smsCode = pin;
                  });
                  },
                defaultPinTheme: defaultPinTheme,
                length: 6,
              ),
            ),
            const SizedBox(height: 26,),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: verifyPhoneNumber,
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

          ],
        ),
      ),
    );
  }
}