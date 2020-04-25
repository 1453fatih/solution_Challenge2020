
import 'package:flutter/services.dart';


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'CircleProgress.dart';

import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with TickerProviderStateMixin {
  bool isLoading = false;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final databaseReference = FirebaseDatabase.instance.reference();

  AnimationController progressController;
  Animation<double> tempAnimation;
  Animation<double> humidityAnimation;
 

  @override
  void initState() {
    super.initState();

    databaseReference
        .child('nem_sicaklik')
        .once()
        .then((DataSnapshot snapshot) {
      int temp = snapshot.value['Temperature']['Data'];
      int humidity = snapshot.value['Humidity']['Data'];

      isLoading = true;
      _DashboardInit(temp.toDouble(), humidity.toDouble());
      
    });
  }

  _DashboardInit(double temp, double humid) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000)); //5s

    tempAnimation =
        Tween<double>(begin: -50, end: temp).animate(progressController)
          ..addListener(() {
            setState(() {

               ;
            });
          });

    humidityAnimation =
        Tween<double>(begin: 0, end: humid).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    progressController.forward();
  }

  void launcAustralia() async {
    const url =
        "https://www.theverge.com/2020/1/3/21048891/australia-wildfires-koalas-climate-change-bushfires-deaths-animals-damage";
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw "colund not launch $url";
    }
  }


  void launchChernobly() async {
    const url =
        "https://www.nytimes.com/2020/04/11/world/europe/chernobyl-wildfire.html";
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw "colund not launch $url";
    }
  }




  void launchMassive() async {
    const url =
        "https://www.thejakartapost.com/news/2020/03/31/nineteen-killed-in-massive-china-forest-fire.html";
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw "colund not launch $url";
    }
  }




  void launcahMenitoba() async {
    const url =
        "https://globalnews.ca/tag/manitoba-wildfire/";
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw "colund not launch $url";
    }
  }




  void launcaChinc() async {
    const url =
        "https://en.wikipedia.org/wiki/Chinchaga_fire";
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw "colund not launch $url";
    }
  }




  void launcBolivia() async {
    const url =
        "https://www.npr.org/2019/09/18/761591604/bolivia-is-fighting-major-forest-fires-nearly-as-large-as-brazils";
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw "colund not launch $url";
    }
  }




  void launcgreaton() async {
    const url =
        "https://en.wikipedia.org/wiki/Great_Fire_of_1910";
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw "colund not launch $url";
    }
  }




  void laungreatons() async {
    const url =
        "https://foresthistory.org/wp-content/uploads/2016/12/2015_GreatFireof1919.pdf";
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw "colund not launch $url";
    }
  }











tempFahrenheit(double temp) {
  
   
 progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000)); //5s

    tempAnimation =
        Tween<double>(begin: -tempAnimation.value, end: tempAnimation.value+273).animate(progressController)
          ..addListener(() {
            setState(() {

               
            });
          });
          progressController.forward();

}


  String tempText = 'Temperature';
  String degreText = "°C";



_calling() async {
const url = 'tel:911';
if (await canLaunch(url)) {
  await launch(url);
} else {
  throw 'Could not launch $url';
}

}


changeText() {

    setState(() {
     tempText = 'Fahrenheit'; 
    });
    setState(() {
     degreText= '°F'; 
    });
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Follow Temperature - Humidity'),
        centerTitle: true,
        //automaticallyImplyLeading: true,
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("assets/login/fsmlogo.png"),
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow),
              title: Text('Bushfires in Australia'),
              leading: Icon(Icons.whatshot),
              onTap: () {
                launcAustralia();
                
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.push(context, route);
                Navigator.pop(context);
              },
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow),
              leading: Icon(Icons.whatshot),
              title: Text('Chernobyl Fire'),
              onTap: () {
                launchChernobly();
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow),
              leading: Icon(Icons.whatshot),
              title: Text('Massive Forest Fires'),
              onTap: () {
                launchMassive();
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow),
              leading: Icon(Icons.whatshot),
              title: Text('Manitoba Forest Fire'),
              onTap: () {
                launcahMenitoba();
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow),
              leading: Icon(Icons.whatshot),
              title: Text('Chinchaga Forest'),
              onTap: () {
                launcaChinc();
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow),
              leading: Icon(Icons.whatshot),
              title: Text('Bolivia Forest Fire'),
              onTap: () {
                launcBolivia();
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow),
              leading: Icon(Icons.whatshot),
              title: Text('The Great Fire of 1910'),
              onTap: () {
                launcgreaton();
                // Update the 
                //state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              trailing: Icon(Icons.play_arrow),
              leading: Icon(Icons.whatshot),
              title: Text('The Great Fire of 1919'),
              onTap: () {
                laungreatons();
                
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
          
              leading: Icon(Icons.exit_to_app),
              title: Text('Exıt'),
              onTap: () {
                // Update the state of the app
               SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CustomPaint(
                      foregroundPainter:
                          CircleProgress(tempAnimation.value, true),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Text('$tempText'),

                              Text(
                                '${tempAnimation.value.toInt()}',
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ('$degreText'),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomPaint(
                      foregroundPainter:
                          CircleProgress(humidityAnimation.value, false),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Humidity'),
                              Text(
                                '${humidityAnimation.value.toInt()}',
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.green,
                          highlightColor: Colors.red,
                          elevation: 10,
                          child: Text(
                            "Convert Fahrenheit",
                            style: TextStyle(color: Colors.white),
                          ),
                           onPressed:  () {
                            


                         
                            changeText();
                            tempFahrenheit(tempAnimation.value);

                         

                          }, 
                        ),
                        RaisedButton.icon(
                          elevation: 25,
                          onPressed: () {
                            
                            _calling();

                          },
                          label: Text("Call 911"),
                          textColor: Colors.black,
                          icon: Icon(Icons.call),
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                )
              : Text(
                  'Loading...',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
    );
  }
  
}
