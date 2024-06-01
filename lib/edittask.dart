import 'package:flutter/material.dart';
import 'package:sharepoint/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Edittask extends StatefulWidget {
  final String task;

  Edittask({required this.task});

  @override
  _Edittask createState() => _Edittask();
}

class _Edittask extends State<Edittask> {
  late final TextEditingController _controller;
  Database? _database;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.task);
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    Sqflite.devSetDebugModeOn(true);
    _database = await openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tasks(task TEXT PRIMARY KEY)",
        );
      },
      version: 1,
    );
  }

  final dbHelper = DatabaseHelper();

  Future<bool> _insertTask(String task) async {
    return await dbHelper.insertTask(task);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.06),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF3556AB),
              boxShadow: [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text('Add New Task', style: TextStyle(color: Colors.white, fontSize: height * 0.025)),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: height * 0.035, left: width * 0.045),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Task Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: height * 0.02,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1,
                    letterSpacing: 0.01 * width,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.013, right: width * 0.045, left: width * 0.045),
              child: Container(
                decoration: ShapeDecoration(
                  color: Color(0xFFFCFCFC),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.005 * width, color: Color(0xFFCACACA)),
                    borderRadius: BorderRadius.circular(0.01 * height),
                  ),
                ),
                child: TextField(
                  controller: _controller,
                  style: TextStyle(
                    color: Color(0xFF0C2971),
                    fontSize: height * 0.025,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.02),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(0.02 * height),
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.065,
                    decoration: ShapeDecoration(
                      color: Color(0xFF3556AB),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.005 * width,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFF0C2971),
                        ),
                        borderRadius: BorderRadius.circular(0.01 * height),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0xFFA8B4DE),
                          blurRadius: 30,
                          offset: Offset(0, 10),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () async {
                        if (_controller.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Task name cannot be empty')),
                          );
                        } else {
                          bool success = await _insertTask(_controller.text);
                          if (success) {
                            _controller.clear();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Task already exists')),
                            );
                          }
                        }
                      },
                      child: Text(
                        'Done',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.022,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
