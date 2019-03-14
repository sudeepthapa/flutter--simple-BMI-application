import 'package:flutter/material.dart';

class BIMHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BIMHomeState();
  }
}

class BIMHomeState extends State<BIMHome> {

  String age="";
  String height="";
  String weight="";
  double bim = 0.0;
  String feedback = '';

  _ageChange(value){
    setState(() {
      age= value;
    });
  }
  _weightChange(value){
    setState(() {
      weight= value;
    });
  }
  _heightChange(value){
    setState(() {
      height= value;
    });
  }

  _calculateResult(){
     bim = double.parse((double.parse(weight)/(double.parse(height)*double.parse(age))).toStringAsFixed(2));
     if(bim>0 && bim <= 10){
       feedback = "Low Weight";
     }
     else if(bim>10 && bim <= 20){
       feedback = "Balanced Weight";
     }
     else if(bim>20 && bim <= 30){
       feedback = "OverWeight";
     }
     else if(bim<=0){
       feedback = "Invalid Entry";
     }
     else{
       feedback="Please Eat Less";
     }
     setState(() {
       bim = bim;
       feedback =feedback;
     });
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("BMI"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "images/bmilogo.png",
                  width: 100,
                  height: 100,
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.black12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      onChanged: _ageChange,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Age", icon: Icon(Icons.person)),
                    ),
                    TextField(
                      onChanged: _heightChange,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Height in feet",
                          icon: Icon(Icons.account_balance)),
                    ),
                    TextField(
                      onChanged: _weightChange,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Weight in lbs",
                          icon: Icon(Icons.line_weight)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom:10 ),
                      child: FlatButton(
                        color: Colors.pinkAccent,
                        onPressed: _calculateResult,
                        child: Text(
                          "Calculate",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text("Your BMI: $bim", style: TextStyle(fontSize: 25.7, color: Colors.lightBlue, fontStyle: FontStyle.italic,fontWeight: FontWeight.w700 ),),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Text( feedback , style: TextStyle(fontSize: 21.7, color: Colors.pink, fontStyle: FontStyle.italic,fontWeight: FontWeight.w700 ),)
            ],
          )
        ],
      ),
    );
  }
}
