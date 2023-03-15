import 'package:flutter/material.dart';
import 'disease.dart';

class SixthPage extends StatefulWidget {
  final int age;
  final String name;
  final String gender;
  final int height;
  final int weight;

  SixthPage(
      {required this.age,
      required this.name,
      required this.gender,
      required this.height,
      required this.weight});
  _SixthPageState createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  bool _hasAllergy = false;
  List<bool> _allergens = List<bool>.filled(9, false);

  String _getAllergenName(int index) {
    switch (index) {
      case 0:
        return 'ไข่';
      case 1:
        return 'ปลา';
      case 2:
        return 'นม';
      case 3:
        return 'ถั่วเหลือง';
      case 4:
        return 'ถั่วลิสง';
      case 5:
        return 'แป้งสาลีและกลูเต็น';
      case 6:
        return 'สัตว์น้ำเปลือกแข็ง เช่น กุ้ง ปู หอย หมึก ฯลฯ';
      case 7:
        return 'ถั่วตระกูล Tree Nuts เช่น อัลมอนด์ วอลนัท มะม่วงหิมพานต์ แมคคาเดเมีย พิสตาชิโอ ฯลฯ';
      case 8:
        return 'ผักและผลไม้ อาจเกิดอาการแพ้ที่ริมฝีปากและในลำคอ';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 6: Allergies'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add this line
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'คุณมีอาการแพ้อาหารใดๆหรือไม่?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: false,
                    groupValue: _hasAllergy,
                    onChanged: (bool? value) {
                      setState(() {
                        _hasAllergy = value!;
                      });
                    },
                  ),
                  Text('ไม่มี'),
                  Radio(
                    value: true,
                    groupValue: _hasAllergy,
                    onChanged: (bool? value) {
                      setState(() {
                        _hasAllergy = value!;
                      });
                    },
                  ),
                  Text('มี'),
                ],
              ),
              if (_hasAllergy)
                Column(
                  children: List<Widget>.generate(
                    9,
                    (index) => CheckboxListTile(
                      title: Text(_getAllergenName(index)),
                      value: _allergens[index],
                      onChanged: (bool? value) {
                        setState(() {
                          _allergens[index] = value!;
                        });
                      },
                    ),
                  ),
                ),
              Center(
                child: ElevatedButton(
                  child: Text('Next'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeventhPage(
                          name: widget.name,
                          gender: widget.gender,
                          height: widget.height,
                          weight: widget.weight,
                          allergens: _allergens,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  'Step 6/8',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
