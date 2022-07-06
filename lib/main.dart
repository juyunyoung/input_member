import 'package:flutter/material.dart';



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
  const ShowMemberInfo({super.key});

  @override
  State<ShowMemberInfo> createState() => _ShowMemberInfoState();
}


class _MemberInfoInputState extends State<MemberInfoInput> {
  String name = "0";
  String age = "0";
  String address = "0";
  String gender = "0";


  void _submitInfo() {
    //input data save
    //and nextPage move
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShowMemberInfo()),
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
          softWrap: true,
        ),
        TextField(
          decoration: const InputDecoration(
            filled: true,
            labelText:'input your name',
          ),
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
          softWrap: true,
        ),
        TextField(
          decoration: const InputDecoration(
            filled: true,
            labelText:'input your age',
          ),
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
          softWrap: true,
        ),
        TextField(
          decoration: const InputDecoration(
            filled: true,
            labelText:'input your address',
          ),
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
          softWrap: true,
        ),
        TextField(
          decoration: const InputDecoration(
            filled: true,
            labelText:'input your gender',
          ),
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
            softWrap: true,
          ),
          Text(
            'input name',
            softWrap: true,
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
            softWrap: true,
          ),
          Text(
            'input name',
            softWrap: true,
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
            softWrap: true,
          ),
          Text(
            'input name',
            softWrap: true,
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
            softWrap: true,
          ),
          Text(
            'input name',
            softWrap: true,
          ),
        ],
      ),
    );
}