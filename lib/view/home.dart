import 'package:flutter/material.dart';
import 'input.dart';
import 'result.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
        title: const Text('Member Info'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              onPressed: () {},
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
