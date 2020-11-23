import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'passenger.dart';

class PassengerCard extends StatefulWidget {
  final Passenger passenger;
  final Function delete;
  PassengerCard({this.passenger, this.delete});

  @override
  _PassengerCardState createState() => _PassengerCardState();
}

class _PassengerCardState extends State<PassengerCard> {
  Color color = Colors.green;
  int m = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.passenger.type == "OFFLINE") {
      color = Colors.grey;
    }
    return InkWell(child:
        Row(children: [
          SizedBox(height: 60, width: MediaQuery.of(context).size.width * 0.4, child: Center(child: Text(widget.passenger.name, style: TextStyle(fontSize: 20, color: Color.fromRGBO(0, 0, 0, .75)),),)),
          SizedBox(height: 46, width: MediaQuery.of(context).size.width * 0.2, child: Column(children: [
            Text(widget.passenger.place, style: TextStyle(fontSize: 20, color: Color.fromRGBO(0, 0, 0, .75)),), Text(widget.passenger.istop, style: TextStyle(color: Color.fromRGBO(0, 0, 0, .75)),),], mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.center,),),
          SizedBox(height: 60, width: MediaQuery.of(context).size.width * 0.4, child: Center(child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 22), child: Text(widget.passenger.type, style: TextStyle(fontSize: 20, color: Colors.white),)),)),)
        ],
        ),
      onTap: () {
        showModalBottomSheet<dynamic>(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Wrap(
                children: <Widget>[Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0)
                    )
                  ),
                  padding: EdgeInsets.all(30),
                  child: Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('ИНФОРМАЦИЯ О ПАСАЖИРЕ', style: TextStyle(fontSize: 18)),
                      Divider(color: Colors.grey, indent: 14,),
//                    TextField(
//                      decoration: InputDecoration(
//                        fillColor: Colors.grey,
//                        border: InputBorder.none,
//                        hintText: "Name",
//                        hintStyle: TextStyle(color: Colors.grey, fontSize: 22),
//                      ),
////                      initialValue: widget.passenger.name,
//                    ),
                      Card(
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                              child: Text(widget.passenger.name, style: TextStyle(fontSize: 18),)),
                        ),
                      ),
                      Card(
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                              child: Text('7779559900', style: TextStyle(fontSize: 18),)),
                        ),
                      ),
                      Card(
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                              child: Text('Почта', style: TextStyle(fontSize: 18, color: Colors.green),),),
                        ),
                      ),
                      SizedBox(height: 6,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(width: 10,),
                          Text('Место', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(width: 0,),
                          Text('Цена', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(width: 0,),
                        ],
                      ),
                      SizedBox(height: 6,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Card(
                            child: SizedBox(
//                              width: double.infinity,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                                  child: Text('${widget.passenger.place} ${widget.passenger.istop}', style: TextStyle(fontSize: 22, color: Colors.grey),)),
                            ),
                          ),
                          Card(
                            child: SizedBox(
//                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                                child: Text('3000', style: TextStyle(fontSize: 22),),),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                            color: Color.fromRGBO(69, 161, 78, 1),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0)),
                            child: Text('ИЗМЕНИТЬ', style: TextStyle(fontSize: 18),),
                            onPressed: () {
                            },
                          ),
                          RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                            color: Color.fromRGBO(69, 161, 78, 1),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0)),
                            child: Text('ОТПРАВИТЬ ЧЕК', style: TextStyle(fontSize: 18),),
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 6,),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        color: Color.fromRGBO(69, 161, 78, 1),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0)),
                        child: Text('ОТМЕНИТЬ ПОКУПКУ БИЛЕТА', style: TextStyle(fontSize: 18),),
                        onPressed: () {
                          Navigator.pop(context);
                          Toast.show("Билет удален.", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.blue);
                          setState(() {
                            widget.delete();
                          });
                        },
                      ),
                  ],),
                ),]
              );
            });
        },);
  }
}