class  MemberInfoTo{
  String name = "" ;
  String addr = "" ;
  String age = "";
  String gender = "";
}

class InfoTo{
  static final allUser = <MemberInfoTo>[] ;
}

class ChartData{
  ChartData(this.x, this.female, this.male);
  final String x;
  final int female;
  final int male;

}