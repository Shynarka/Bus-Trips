import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      )
  );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }
  Text m = Text('Отправление', style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Color.fromRGBO(0, 0, 0, .7)),);

  @override
  Widget build(BuildContext context) {
    Column tom = Column(children: [
      busTrip(
          'assets/images/three.jpg',
          'YUTONG',
          'KZ 888',
          'KN 02',
          30,
          'Нур-Султан',
          'Атырау',
          '06.02.2020 Thu',
          '18:39',
          '07.02.2020 Fri',
          '06:10'),
    ],);

    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 243, 243, 1),
        appBar: AppBar(
          title: Text('Расписание'),
          backgroundColor: Color.fromRGBO(69, 161, 78, 1),
          brightness: Brightness.light,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Color.fromRGBO(244, 243, 243, 1),),
            onPressed: () {},
          ),
        ),
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30))
                ),
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(' Сегодня', style: TextStyle(
                        color: Color.fromRGBO(61, 118, 66, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Column(children: [
                      busTrip(
                          'assets/images/one.jpg',
                          'YUTONG',
                          'KZ 888',
                          'KN 02',
                          32,
                          'Асыката',
                          'Алматы',
                          '06.02.2020 Thu',
                          '18:39',
                          '07.02.2020 Fri',
                          '06:10'),
                      busTrip(
                          'assets/images/two.jpg',
                          'End2End Test',
                          'KZ 888',
                          'KN 02',
                          52,
                          'Город Х',
                          'Сарыагаш',
                          '06.02.2020 Thu',
                          '18:39',
                          '07.02.2020 Fri',
                          '06:10'),
                    ],),
                    Text(' Завтра', style: TextStyle(
                        color: Color.fromRGBO(61, 118, 66, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    tom,
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
            color: Color.fromRGBO(69, 161, 78, 1),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0)),
            child: Text('ДОБАВИТЬ РЕЙС', style: TextStyle(fontSize: 16),),
            onPressed: () {},
          ),
        )
    );
  }
  
  Widget busTrip(img, bus, busCode, busWord, places, from, to, startDate,
      startTime, destDate, destTime) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),),
          ],
        ),
        padding: EdgeInsets.all(15.0,),
        child: Column(
          children: <Widget>[
            Container(
              height: 270,
              width: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 180.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(fit: BoxFit.cover,
                                image: AssetImage(img)),
                            borderRadius: BorderRadius.all(Radius.circular(
                                20.0)),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(bus, style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(busCode, style: TextStyle(fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, .7)),),
                                Text(busWord, style: TextStyle(fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, .7)),),
                              ],
                            ),
                            SizedBox(width: 30,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('$places мест',
                                  style: TextStyle(fontSize: 16),),
                              ],
                            )
                          ],)
                      ]),
                  SizedBox(width: 20,),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            Text('$from -', style: TextStyle(fontSize: 22,),),
                            Text(to, style: TextStyle(fontSize: 22,),),
                          ],
                        ),
                        SizedBox(width: 4,),
                        Text('Отправление', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, .7)),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Дата - $startDate', style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(0, 0, 0, .7)),),
                            SizedBox(height: 4,),
                            Text('Время - $startTime', style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(0, 0, 0, .7)),),
                          ],
                        ),
                        Text('Прибытие', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, .8)),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Дата - $destDate', style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(0, 0, 0, .7)),),
                            SizedBox(height: 4,),
                            Text('Время - $destTime', style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(0, 0, 0, .7)),),
                          ],
                        ),
                        SizedBox(height: 30,),
                      ]),
                ],
              ),
              padding: EdgeInsets.all(5),
            ),
            SizedBox(height: 5,),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 100),
              color: Colors.white,
              splashColor: Colors.green,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color.fromRGBO(69, 161, 78, 0.8)),
                borderRadius: new BorderRadius.circular(5),),
              child: Text('Удалить рейс', style: TextStyle(fontSize: 17),),
              onPressed: () {
                m = Text('dfk');
                setState(() {});
              },
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
      },
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Пассажиры'), backgroundColor: Color.fromRGBO(69, 161, 78, 1),),
      body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Column(children: [
          SizedBox(height: 16,),
          Row(children: [
            Text('Имя', style: TextStyle(fontSize: 22, color: Color.fromRGBO(0, 0, 0, .75)),),
            Text('Место', style: TextStyle(fontSize: 22, color: Color.fromRGBO(0, 0, 0, .75)),),
            Text('Тип', style: TextStyle(fontSize: 22, color: Color.fromRGBO(0, 0, 0, .75)),),
          ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
          SizedBox(height: 10,),
          Passenger('Aigerim','0 A',true,'OFFLINE'),
          Passenger('Arlan','0 B',true,'OFFLINE'),
          Passenger('ASSELYA','1','нижний','ONLINE'),
          Passenger('Temirlan','1',true,'ONLINE'),
          Passenger('Temirlan','3',true,'OFFLINE'),
          Padding(padding: EdgeInsets.only(top: 20), child: Center(child: Text('Cвободные места', style: TextStyle(fontSize: 20, color: Color.fromRGBO(0, 0, 0, .75)),))),
          Passenger('Нет имени','0 A','нижний','ONLINE'),
          Passenger('Нет имени','0 В','нижний','ONLINE'),
          Passenger('Нет имени','2','нижний','ONLINE'),
          Passenger('Нет имени','2',true,'ONLINE'),
          Passenger('Нет имени','3','нижний','ONLINE'),
          Passenger('Нет имени','4','нижний','ONLINE'),
          Passenger('Нет имени','4',true,'ONLINE'),
          Passenger('Нет имени','5','нижний','ONLINE'),
          Passenger('Нет имени','5',true,'ONLINE'),
          Passenger('Нет имени','6','нижний','ONLINE'),
          Passenger('Нет имени','6',true,'ONLINE'),
          Passenger('Нет имени','7','нижний','ONLINE'),
          Passenger('Нет имени','7',true,'ONLINE'),
          Passenger('Нет имени','8','нижний','ONLINE'),
          Passenger('Нет имени','8',true,'ONLINE'),
          Passenger('Нет имени','9','нижний','ONLINE'),
          Passenger('Нет имени','9',true,'ONLINE'),
          Passenger('Нет имени','10','нижний','ONLINE'),
          Passenger('Нет имени','10',true,'ONLINE'),
          RaisedButton(
            onPressed: () { Navigator.pop(context); },
            child: Text('go back to Home Page'),
          ),
        ],),
      ],),
    );
  }

  Widget Passenger(name, place, istop, type) {
    String p="верхний";
    if (istop == false) {
      p="нижний";
    }
    Color color = Colors.green;
    if (type == "OFFLINE") {
      color = Colors.grey;
    }
    return
      Row(children: [
        SizedBox(height: 60, width: MediaQuery.of(context).size.width * 0.4, child: Center(child: Text(name, style: TextStyle(fontSize: 20, color: Color.fromRGBO(0, 0, 0, .75)),),)),
        SizedBox(height: 46, width: MediaQuery.of(context).size.width * 0.2, child: Column(children: [
          Text(place, style: TextStyle(fontSize: 20, color: Color.fromRGBO(0, 0, 0, .75)),), Text(p, style: TextStyle(color: Color.fromRGBO(0, 0, 0, .75)),),], mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.center,),),
        SizedBox(height: 60, width: MediaQuery.of(context).size.width * 0.4, child: Center(child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 22), child: Text(type, style: TextStyle(fontSize: 20, color: Colors.white),)),)),)
      ],
      );
  }
}

//class Trip {
//  String img;
//  String bus;
//  String busCode;
//  String busWord;
//  int places;
//  String from;
//  String to;
//  String startDate;
//  String startTime;
//  String destDate;
//  String destTime;
//
//  Trip(this.img,this.bus,this.busCode,this.busWord,this.places,this.from,this.to,this.startDate,this.startTime,this.destDate,this.destTime);
//}