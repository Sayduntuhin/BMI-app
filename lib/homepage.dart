import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Homepage();
  }
}

class _Homepage extends State<Homepage> {
  var weight = TextEditingController();
  var hight = TextEditingController();
  var inch = TextEditingController();
  var result = "";
  var error = "";
  var bgcolour = Colors.white60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.accessibility_rounded),
              Text(
                'BMI CHECK',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          backgroundColor: Colors.tealAccent.shade100,

        ),
        body: Container(
          color: bgcolour,
          child: Center(
            child: Container(
              width: 350,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: weight,
                    decoration: InputDecoration(
                      icon: Icon(Icons.line_weight),
                      label: Text('Enter your weight(KG)'),


                    ),


                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: hight,
                    decoration: InputDecoration(
                        icon: Icon(Icons.accessibility_rounded),
                        label: Text('Enter your hight(Feet)')),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: inch,
                    decoration: InputDecoration(
                        icon: Icon(Icons.accessibility_rounded),
                        label: Text('Enter your hight(Inch)')),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var wt = weight.text.toString();
                      var ht = hight.text.toString();
                      var inh = inch.text.toString();
                      if (wt != "" && ht != "" && inh != "")
                      {
                        var intwt =  int.parse(wt);
                        var intht =  int.parse(ht);
                        var intinh =  int.parse(inh);

                        var tinh = (intht*12) + intinh; //total inch
                        var tCm = tinh * 2.54; //total centimeter
                        var tMt = tCm/100; // total meter
                        var bmi = intwt / (tMt*tMt);
                        var msg  = "";
                        if ( bmi>25){
                          msg = " You are over Wighted";
                          bgcolour = Colors.orange.shade200;
                        }
                        else if(bmi<18){
                          msg = " You are Under Wighted";
                          bgcolour  = Colors.red.shade200;
                        }
                        else{
                          msg = " You are Healthy";
                          bgcolour  =  Colors.green.shade200;
                        }
                        setState(() {
                          result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                        });


                      }
                      else {
                        setState(() {
                          error = "Please Fill the all required!";
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.tealAccent.shade100,
                      onPrimary: Colors.black

                    ),
                    child: Text('Calculate'),

                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    error,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  ) ,
                  Text(result,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),

                  )
                ],
              ),
            ),
          ),
        ));
  }
}
