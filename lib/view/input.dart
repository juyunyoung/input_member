
import 'package:flutter/material.dart';
import 'entity.dart';
import 'confirm.dart';
import 'result.dart';
import 'home.dart';

class MemberInfoInput extends StatefulWidget {
  const MemberInfoInput({super.key});

  @override
  State<MemberInfoInput> createState() => _MemberInfoInputState();
}


class _MemberInfoInputState extends State<MemberInfoInput> {

  static  TextEditingController myNameController =  TextEditingController();
  static  TextEditingController myAgeController = TextEditingController();
  static  TextEditingController myAddressController = TextEditingController();
  static String selectedGenderText ='NA';


  void _submitInfo() {
    final MemberInfoTo memberto =  new MemberInfoTo();
    memberto.name = myNameController.text;
    memberto.age = myAgeController.text;
    memberto.addr = myAddressController.text;
    memberto.gender = selectedGenderText;
    InfoTo.allUser.add(memberto);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShowMemberInfo(membTo:memberto)),
    );
  }
  void _backPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeView()),
    );
  }

  void _resultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultView()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please input your info'),
      ),
      body: ListView(
        children: [
          nameSection,
          ageSection,
          addressSection,
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GENDER:',
                ),
                DropdownButton<String?>(
                  onChanged:(String? newValue){
                    setState((){
                      selectedGenderText = newValue.toString();
                      print(selectedGenderText);
                    });
                  },
                  value: selectedGenderText,
                  items:
                  ['NA','F','M'].map<DropdownMenuItem<String?>>((String? i){
                    return DropdownMenuItem<String?>(
                      value: i,
                      child:Text({'F':'여성','M':'남성'}[i] ?? 'NA' ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        // this creates a notch in the center of the bottom bar
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: _backPage,
            ),
            const SizedBox(
              width: 20,
            ),

            IconButton(
              icon: const Icon(
                Icons.assessment,
                color: Colors.white,
              ),
              onPressed: _resultPage,
            ),
          ],
        ),
      ),
      // implement the floating button
      floatingActionButton: FloatingActionButton(
          onPressed: _submitInfo,
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget nameSection = Container(
    padding: EdgeInsets.all(32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NAME:',
        ),
        TextField(
          controller: myNameController,
        ),
      ],
    ),
  );

  Widget ageSection = Container(
    padding: EdgeInsets.all(32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AGE:',
        ),
        TextField(
            controller: myAgeController
        ),
      ],
    ),
  );

  Widget addressSection = Container(
    padding: EdgeInsets.all(32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ADDRESS:',
        ),
        TextField(
          controller: myAddressController,
        ),
      ],
    ),
  );

  //Widget genderSection =
}