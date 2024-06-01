import 'package:flutter/material.dart';
import 'package:sharepoint/database_helper.dart';
import 'addtask.dart';
import 'package:sqflite/sqflite.dart';
import 'components/tilestyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(key: UniqueKey(), title: 'ShortPoint'),
    );
  }
}

final dbHelper = DatabaseHelper();

Future<List<String>> _fetchTasks() async {
  return await dbHelper.fetchTasks();
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Column(
      children: [
        Container(
          width: width,
          height: height * 0.972,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFF3F3F3)),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: width,
                  height: height * 0.13,
                  decoration: BoxDecoration(
                    color: Color(0xFF3556AB),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: width * 0.08,
                top: height * 0.02,
                child: Container(
                  width: width * 0.8,
                  height: height * 0.07,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: width * 0.12,
                          height: width * 0.12,
                          child: ClipOval(
                            child: Image.asset(
                              "images/me.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.17,
                        top: height * 0.005,
                        child: Container(
                          width: width * 0.68,
                          height: height * 0.07,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'Hello, Evanggelos',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.039,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    decoration: TextDecoration.none,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 3.0),
                                        blurRadius: 3.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: height * 0.055,
                                child: Text(
                                  'baggelis100@gmail.com',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.06,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w100,
                                    height: 0.04,
                                    decoration: TextDecoration.none,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(0.0, 3.0),
                                        blurRadius: 3.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: height * 0.13,
                child: Container(
                  width: width,
                  height: height * 0.128,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: width,
                          height: height * 0.128,
                          decoration: BoxDecoration(
                            color: Color(0xFFCCE53D),
                            border: Border.all(width: 2, color: Color(0xFF9EB031)), // all around border
                          ),
                          child: Container(
                            // inner container
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 2, color: Color(0xFFEBF5B1)), // top border
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.78,
                        child: Container(
                          width: width * 0.16,
                          height: height * 0.085,
                          decoration: BoxDecoration(color: Color(0xFF071C55)),
                        ),
                      ),
                      Positioned(
                        left: width * 0.835,
                        top: height * 0.046,
                        child: SizedBox(
                          width: width * 0.05,
                          child: Text(
                            '\$1',
                            style: TextStyle(
                              color: Color(0xFFF2C94C),
                              fontSize: width * 0.044,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 0.06,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.06,
                        top: height * 0.04,
                        child: Container(
                          width: width * 0.66,
                          height: height * 0.07,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                child: Container(
                                  width: width * 0.148,
                                  height: height * 0.05,
                                  child: Image.asset(
                                    'images/trophies.png',
                                  ),
                                ),
                              ),
                              Positioned(
                                left: width * 0.19,
                                top: height * 0.013,
                                child: SizedBox(
                                  width: width * 0.34,
                                  child: Text(
                                    'Go Pro (No Ads)',
                                    style: TextStyle(
                                      color: Color(0xFF071C55),
                                      fontSize: width * 0.044,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                      height: 0.06,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: width * 0.19,
                                top: height * 0.025,
                                child: SizedBox(
                                  width: width * 0.46,
                                  height: height * 0.03,
                                  child: Text(
                                    'No fuss, no ads, for only \$1 a \nmonth',
                                    style: TextStyle(
                                      color: Color(0xFF0C2971),
                                      fontSize: width * 0.029,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                top: height * 0.26,
                bottom: height * 0.0,
                child: FutureBuilder<List<String>>(
                  future: _fetchTasks(),
                  builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData && snapshot.data != null) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Tilestyle(task: snapshot.data![index]);
                        },
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
              Positioned(
                left: width * 0.81,
                bottom: height * 0.01,
                child: Container(
                  width: width * 0.16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddTaskPage()),
                      );
                    },
                    child: Image.asset('images/button.png', fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
