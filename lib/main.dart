import 'package:flutter/material.dart';

class MemberInfoTo{
  String name = "";
  String addr = "";
  String age = "";
  String gender = "";
  MemberInfoTo(this.name, this.addr, this.age, this.gender);
}

void main() {
  runApp(const MemberInfo());
}


class MemberInfo extends StatelessWidget {
  const MemberInfo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input member info',
      theme: ThemeData(

      ),
      home: const MemberInfoInput(),
    );
  }
}

class MemberInfoInput extends StatefulWidget {
  const MemberInfoInput({super.key});

  @override
  State<MemberInfoInput> createState() => _MemberInfoInputState();
}

class ShowMemberInfo extends StatefulWidget {
  MemberInfoTo membTo;
  ShowMemberInfo({super.key, required this.membTo});

  @override
  State<ShowMemberInfo> createState() => _ShowMemberInfoState(membTo:membTo);
}


class _MemberInfoInputState extends State<MemberInfoInput> {

  static  TextEditingController myNameController =  TextEditingController();
  static  TextEditingController myAgeController = TextEditingController();
  static  TextEditingController myAddressController = TextEditingController();
  static  TextEditingController myGenderController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myNameController.dispose();
    myAgeController.dispose();
    myAddressController.dispose();
    myGenderController.dispose();
    super.dispose();
  }

  void _submitInfo() {
    name = myNameController.text;
    age = myAgeController.text;
    address = myAddressController.text;
    gender = myGenderController.text;
    final membTo =  MemberInfoTo(name,address,age,gender);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShowMemberInfo(membTo:membTo)),
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
          genderSection,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitInfo,
        tooltip: 'input info',
        child: const Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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

  Widget genderSection = Container(
    padding: EdgeInsets.all(32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GENDER:',
        ),
        TextField(
          controller: myGenderController,
        ),
      ],
    ),
  );
}
class _ShowMemberInfoState extends State<ShowMemberInfo> {
  String name = "0";
  String age = "0";
  String address = "0";
  String gender = "0";

     MemberInfoTo membTo;
    _ShowMemberInfoState({ required this.membTo}) ;

    void _backPage() {
    //get data show input data
    //and beforePage move
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MemberInfoInput()),
      );
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Your input info'),
      ),
      body: ListView(
        children: [
          nameSection,
          ageSection,
          addressSection,
          genderSection,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _backPage,
        tooltip: 'back page',
        child: const Icon(Icons.arrow_back),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
    }

    Widget nameSection = Container(
      padding: EdgeInsets.all(32),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            'AGE:',
          ),
          Text(
            membTo.age ==null ? "": membTo.age,
          ),
        ],
      ),
    );

    Widget ageSection = Container(
      padding: EdgeInsets.all(32),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            'AGE:',
          ),
          Text(
            'input name',
          ),
        ],
      ),
    );

    Widget addressSection = Container(
      padding: EdgeInsets.all(32),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            'AGE:',
          ),
          Text(
            'input name',
          ),
        ],
      ),
    );

    Widget genderSection = Container(
      padding: EdgeInsets.all(32),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            'AGE:',
          ),
          Text(
            'input name',
          ),
        ],
      ),
    );
}