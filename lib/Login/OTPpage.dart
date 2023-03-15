// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  // final String phoneNumber;

  // OTPScreen({required this.phoneNumber});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   'Please enter the verification code sent to ${widget.phoneNumber}',
            //   style: TextStyle(fontSize: 18.0),
            // ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Verification Code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            // ElevatedButton(
            //   onPressed: () async {
            //     // Verify the OTP
            //     try {
            //       await FirebaseAuth.instance
            //           .signInWithCredential(PhoneAuthProvider.credential(
            //               verificationId: verificationId,
            //               smsCode: _codeController.text))
            //           .then((value) {
            //         // Do something after verification
            //       });
            //     } catch (e) {
            //       print(e);
            //     }
            //   },
            //   child: Text('Verify'),
            // ),
          ],
        ),
      ),
    );
  }
}
