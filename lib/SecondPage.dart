import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'passenger.dart';
import 'passenger_card.dart';

class SecondPage extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<SecondPage> {
  List<Passenger> passengers = [
    Passenger(name: 'Aigerim', place: '0 A', istop: 'верхний', type: 'OFFLINE'),
    Passenger(name: 'Mukhamedkhan', place: '0 B', istop: 'верхний', type: 'OFFLINE'),
    Passenger(name: 'ASSELYA', place: '1', istop: 'нижний', type: 'ONLINE'),
    Passenger(name: 'TAMERLAN', place: '1', istop: 'верхний', type: 'ONLINE'),
    Passenger(name: 'Shynar', place: '0 A', istop: 'нижний', type: 'ONLINE'),
    Passenger(name: 'BOTA', place: '0 В', istop: 'нижний', type: 'OFFLINE'),
    Passenger(name: 'Arlan', place: '2', istop: 'нижний', type: 'ONLINE'),
//    Passenger(name: 'Нет имени', place: '2', istop: 'верхний', type: 'OFFLINE'),
  ];
  List<int> f = List<int>.generate(16, (int index) => index + 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Пассажиры'),
        backgroundColor: Color.fromRGBO(69, 161, 78, 1),),
      body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Column(children: <Widget>[
          SizedBox(height: 16,),
          Row(children: [
            Text('Имя', style: TextStyle(
                fontSize: 22, color: Color.fromRGBO(0, 0, 0, .75)),),
            Text('Место', style: TextStyle(
                fontSize: 22, color: Color.fromRGBO(0, 0, 0, .75)),),
            Text('Тип', style: TextStyle(
                fontSize: 22, color: Color.fromRGBO(0, 0, 0, .75)),),
          ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
          SizedBox(height: 10,),
          Column(children: passengers.map((passenger) =>
              PassengerCard(
                  passenger: passenger,
                  delete: () {
                    setState(() {
                      passengers.remove(passenger);
                    });
                  }
              )).toList()),
          Padding(padding: EdgeInsets.only(top: 20),
              child: Center(child: Text('Cвободные места', style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(0, 0, 0, .75)),))),
          Column(children: f.map((i) => freePlaces(i)
          ).toList()),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('go back to Home Page'),
          ),
        ],),
      ],),
    );
  }

  Widget freePlaces(int i) {
    return Column(
        children: [Row(children: [
          SizedBox(height: 60,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.4,
              child: Center(child: Text('Нет имени', style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(0, 0, 0, .75)),),)),
          SizedBox(height: 46, width: MediaQuery
              .of(context)
              .size
              .width * 0.2, child: Column(children: [
            Text('$i', style: TextStyle(
                fontSize: 20, color: Color.fromRGBO(0, 0, 0, .75)),),
            Text(
              'нижний', style: TextStyle(color: Color.fromRGBO(0, 0, 0, .75)),),
          ],
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,),),
          SizedBox(height: 60, width: MediaQuery
              .of(context)
              .size
              .width * 0.4, child: Center(child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 22),
                child: Text('OFFLINE',
                  style: TextStyle(fontSize: 20, color: Colors.white),)),)),)
        ],),
          Row(children: [
            SizedBox(height: 60,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.4,
                child: Center(child: Text('Нет имени', style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(0, 0, 0, .75)),),)),
            SizedBox(height: 46, width: MediaQuery
                .of(context)
                .size
                .width * 0.2, child: Column(children: [
              Text('$i', style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(0, 0, 0, .75)),),
              Text(
                'верхний',
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, .75)),),
            ],
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,),),
            SizedBox(height: 60, width: MediaQuery
                .of(context)
                .size
                .width * 0.4, child: Center(child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 22),
                  child: Text('OFFLINE',
                    style: TextStyle(fontSize: 20, color: Colors.white),)),)),)
          ],),
        ]);
  }
}


