import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class  MemberInfoTo{
  String name = "" ;
  String addr = "" ;
  String age = "";
  String gender = "";

}

 class InfoTo{
   static final allUser = <MemberInfoTo>[] ;

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
    final MemberInfoTo memberto =  new MemberInfoTo();
    memberto.name = myNameController.text;
    memberto.age = myAgeController.text;
    memberto.addr = myAddressController.text;
    memberto.gender = myGenderController.text;
    InfoTo.allUser.add(memberto);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShowMemberInfo(membTo:memberto)),
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
        child: const Icon(Icons.add),
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

class ShowMemberInfo extends StatefulWidget {
  final MemberInfoTo membTo;
  ShowMemberInfo({super.key, required this.membTo});

  @override
  State<ShowMemberInfo> createState() => _ShowMemberInfoState();
}


class _ShowMemberInfoState extends State<ShowMemberInfo> {

    void _backPage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MemberInfoInput()),
      );
    }
    void _viewPage(){
      Navigator.push(
        context,
        MaterialPageRoute(builder:(context)=> ResultView()),
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
          Container(
            padding: EdgeInsets.all(32),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  'Name:',
                ),
                Text(
                  widget.membTo.name,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(32),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  'AGE:',
                ),
                Text(
                  widget.membTo.age,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(32),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  'Address:',
                ),
                Text(
                  widget.membTo.addr,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(32),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  'Gender:',
                ),
                Text(
                  widget.membTo.gender,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _viewPage,
        tooltip: 'input info',
        child: const Icon(Icons.add_chart),
      ), // This trailing comma makes auto-formatting nicer for build methods.


    );
    }


}

class ResultView extends StatefulWidget {
  const ResultView({super.key});
  @override
  State<ResultView> createState() => _ResultViewState();
}
class _ResultViewState extends State<ResultView> {
  void _inputPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MemberInfoInput()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:  const Text('Member Info'),
      ),
      body:ListView(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  'Average age:',
                ),
                Text(
                  'ffff',
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(32),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  'Male / Female',
                ),
                Text(
                  'ssssss',
                ),
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
              onPressed: _homePage,
            ),
            IconButton(
              icon: const Icon(
                Icons.people,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      // implement the floating button
      floatingActionButton: FloatingActionButton(
          onPressed: _inputPage,
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );

  }
}