import 'package:flutter/material.dart';
import 'package:sharepoint/edittask.dart';

class Tilestyle extends StatelessWidget {
  final String task;

  Tilestyle({required this.task});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: width * 0.95,
          height: height * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: width * 0.95,
                  height: height * 0.1,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFE6E6E6)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: width * 0.78,
                top: height * 0.025,
                child: Container(
                  width: width * 0.125,
                  height: height * 0.05,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: width * 0.125,
                          height: height * 0.05,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFF071C55)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.03,
                        top: height * 0.015,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Edittask(task: task)),
                            );
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              color: Color(0xFF071C55),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: width * 0.05,
                top: height * 0.03,
                child: Container(
                  width: width * 0.08,
                  height: width * 0.08,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.50, color: Color(0xFF071C55)),
                      borderRadius: BorderRadius.circular(51),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: width * 0.18,
                top: height * 0.05,
                child: Text(
                  task,
                  style: TextStyle(
                    color: Color(0xFF071C55),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
