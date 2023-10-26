import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController scontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map info = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.lightBlue[400],
        body: SafeArea(
          child: Column(
            children: [
              Container(
                //Container for search bar
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        if ((scontroller.text).replaceAll(" ", "") == "") {
                          print("Blank search");
                        } else {
                          Navigator.pushReplacementNamed(context, '/loading',
                              arguments: {"searchText": scontroller.text});
                        }
                      },
                      icon: Icon(Icons.search),
                    ),
                    Expanded(
                        child: TextField(
                      controller: scontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter City Name"),
                    ))
                  ],
                ),
              ),
              Container(
                height: 90,
                width: 340,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue,
                        Colors.blue.shade900,
                      ]),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    Image.network(
                        'https://openweathermap.org/img/wn/${info['i']}@2x.png'),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 90,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Container(alignment: Alignment.topLeft,width: 190,height: 40,
                            child: Text(
                              info['d'],
                              style: TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),

                          Container(
                            alignment: Alignment.bottomRight,
                            height: 20,width: 150,
                            child: Text(
                              info['c'],
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 290,
                  width: 340,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue,
                          Colors.blue.shade900,
                        ]),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        'assets/tm.png',
                        height: 60.0,
                        width: 60.0,
                        color: Colors.orangeAccent,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${info['t']} C',
                            style: TextStyle(fontSize: 80, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 165,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue,
                            Colors.blue.shade900,
                          ]),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/humidity.png',
                          height: 40.0,
                          width: 30.0,
                          color: Colors.orange[500],
                        ),
                        Text('    ${info['h']}',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 165,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue,
                            Colors.blue.shade900,
                          ]),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/wind.png',
                          height: 40.0,
                          width: 30.0,
                          color: Colors.orange[500],
                        ),
                        Text('${info['w']} km/h',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 55,
              ),
              Text('powered by SMP')
            ],
          ),
        ));
  }
}
