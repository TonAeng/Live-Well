import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Live Well',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'เบอร์มือถือ',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // ส่งเบอร์มือถือไปยังหน้ารับ OTP
                },
                child: Text('ยืนยัน'),
              ),
              SizedBox(height: 30),
              Text(
                'หรือเข้าสู่ระบบด้วย',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // เข้าสู่ระบบด้วย Facebook
                    },
                    icon: Icon(Icons.facebook),
                    label: Text('Facebook'),
                    style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // เข้าสู่ระบบด้วย Gmail
                    },
                    icon: Icon(Icons.mail),
                    label: Text('Gmail'),
                    style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
