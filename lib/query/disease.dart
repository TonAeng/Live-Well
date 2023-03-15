import 'package:flutter/material.dart';
import 'other.dart';

class SeventhPage extends StatefulWidget {
  final String name;
  final String gender;
  final int height;
  final int weight;
  final List<bool> allergens;

  SeventhPage({
    required this.name,
    required this.gender,
    required this.height,
    required this.weight,
    required this.allergens,
  });
  _SeventhPageState createState() => _SeventhPageState();
}

class _SeventhPageState extends State<SeventhPage> {
  bool _hasDisease = false;
  List<bool> _diseases = List<bool>.filled(5, false);

  String _getDiseaseName(int index) {
    switch (index) {
      case 0:
        return 'โรคเบาหวาน';
      case 1:
        return 'โรคไต';
      case 2:
        return 'โรคเก๊าท์';
      case 3:
        return 'โรคหัวใจและหลอดเลือด';
      case 4:
        return 'ความดันโลหิตสูง';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 7: Diseases'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'มีโรคประจำตัวที่เกี่ยวกับอาหารหรือไม่?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: false,
                    groupValue: _hasDisease,
                    onChanged: (bool? value) {
                      setState(() {
                        _hasDisease = value!;
                      });
                    },
                  ),
                  Text('ไม่มี'),
                  Radio(
                    value: true,
                    groupValue: _hasDisease,
                    onChanged: (bool? value) {
                      setState(() {
                        _hasDisease = value!;
                      });
                    },
                  ),
                  Text('มี'),
                ],
              ),
              if (_hasDisease)
                Column(
                  children: List<Widget>.generate(
                    5,
                    (index) => CheckboxListTile(
                      title: Text(_getDiseaseName(index)),
                      value: _diseases[index],
                      onChanged: (bool? value) {
                        setState(() {
                          _diseases[index] = value!;
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
                        builder: (context) => EighthPage(
                          name: widget.name,
                          gender: widget.gender,
                          height: widget.height,
                          weight: widget.weight,
                          allergens: widget.allergens,
                          diseases: _diseases,
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
                  'Step 7/8',
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
