import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'entity.dart';
import 'home.dart';
import 'input.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});
  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  bool isCardView = true;
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

  List<ChartData>? chartData;
  TooltipBehavior? _tooltipBehavior;
  int maxAge = 0;
  int miniAge = 0;
  int everAge = 0;
  int femaleCount = 0;
  int maleCount = 0;
  @override
  void initState(){
    _tooltipBehavior = TooltipBehavior(enable:true, header:'', canShowMarker:false);


    for (MemberInfoTo meminfo in InfoTo.allUser){

      if(maxAge==0 || maxAge < int.parse(meminfo.age)){
        maxAge = int.parse(meminfo.age);
      }
      if(miniAge==0 || miniAge > int.parse(meminfo.age)){
        miniAge = int.parse(meminfo.age);
      }
      everAge = everAge + int.parse(meminfo.age);

      if(meminfo.gender == 'F'){
        femaleCount++;
      }else if(meminfo.gender == 'M'){
        maleCount++;
      }

      everAge= (everAge / InfoTo.allUser.length).round();
    }
    chartData = <ChartData>[ChartData('Gender',femaleCount,maleCount)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:  const Text('Member assessment'),
      ),
      body:ListView(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text('Average age:' + everAge.toString()),
                Text('Max age:' + maxAge.toString()),
                Text('Mini age:' + miniAge.toString()),
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
                SfCartesianChart(
                  plotAreaBorderWidth: 1,
                  title: ChartTitle(text: isCardView ? '' : 'Sales comparison of fruits'),
                  legend: Legend(isVisible: !isCardView),
                  primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                  rangePadding: ChartRangePadding.none,
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(size: 0)),
                  series: _getStackedBarSeries(),
                  tooltipBehavior: _tooltipBehavior,
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

  List<ChartSeries<ChartData, String>> _getStackedBarSeries() {
    return <ChartSeries<ChartData, String>>[
      StackedBar100Series<ChartData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.female,
          name: 'female'),
      StackedBar100Series<ChartData, String>(
          dataSource: chartData!,
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.male,
          name: 'male')
    ];
  }



}