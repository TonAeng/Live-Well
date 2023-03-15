import 'package:flutter/material.dart';
import 'gender.dart';

// Repeat similar structure for other pages (e.g., SecondPage, ThirdPage, etc.)
// ...
// And pass the user's inputs to the next page using the constructor

class ResultPage extends StatelessWidget {
  final String name;
  final String gender;
  final double height;
  final double weight;
  final int age;
  final String allergies;
  final String medicalConditions;
  final int mealsPerDay;
  final int activityLevel;
  final int exerciseLevel;

  ResultPage(
      {required this.name,
      required this.gender,
      required this.height,
      required this.weight,
      required this.age,
      required this.allergies,
      required this.medicalConditions,
      required this.mealsPerDay,
      required this.activityLevel,
      required this.exerciseLevel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display user's inputs and results here...
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                // Save the user's data
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 1: Enter your name'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/query1_1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'บอกเราเกี่ยวกับข้อมูลบางส่วนของคุณ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'เราจะเก็บข้อมูลส่วนตัวของคุณเพื่อใช้ในการคำนวนโปรแกรมของคุณเพียงเท่านั้น',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'คุณชื่ออะไร',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      child: Text('Next'),
                      onPressed: () {
                        String name = nameController.text;
                        if (name.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondPage(name: name),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please enter your name')),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Text(
                      'Step 1/8',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
