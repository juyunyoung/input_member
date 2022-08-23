import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'entity.dart';
import 'home.dart';
import 'input.dart';
import 'result.dart';

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
      MaterialPageRoute(builder: (context) => HomeView()),
    );
  }
  void _inputPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MemberInfoInput()),
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
                  widget.membTo.gender.toString() == 'F' ? 'Female':'Male' ,
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
          onPressed: _inputPage,
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


    );
  }


}