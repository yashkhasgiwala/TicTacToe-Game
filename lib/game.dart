import 'dart:io';

import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

const Color c = Colors.teal;

class gamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

int count = 0;
var val = [
  [10, 20, 30],
  [40, 50, 60],
  [70, 80, 90]
];
Icon i1, i2, i3, i4, i5, i6, i7, i8, i9;
bool abc = true, xyz = true, pqr = false;

bool yash(var a, var b) {
  if (true) {
    if (xyz) {
      val[a][b] = 1;
      xyz = false;
    } else {
      val[a][b] = 2;
      xyz = true;
    }
  }
  for (int i = 0; i <= 2; i++)
    if (val[i][0] == val[i][1] && val[i][1] == val[i][2]) pqr = true;
  for (int i = 0; i <= 2; i++)
    if (val[0][i] == val[1][i] && val[1][i] == val[2][i]) pqr = true;
  if ((val[0][0] == val[1][1] && val[0][0] == val[2][2]) ||
      (val[0][2] == val[1][1] && val[2][0] == val[1][1])) pqr = true;
}

Icon update(Icon icon) {
  count++;
  if (abc) {
    icon = kCross;
    abc = false;
  } else {
    icon = kCircle;
    abc = true;
  }
  return icon;
}

void reset() {
  count = 0;
  xyz = abc = true;
  pqr = false;
  val = [
    [10, 20, 30],
    [40, 50, 60],
    [70, 80, 90]
  ];
  //i1 = i2 = i3 = i4 = i5 = i6 = i7 = i8 = i9 = null;
}

class _GamePageState extends State<gamePage> {
  void check() {
    setState(() {
      if (count == 9 || pqr) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return PlatformAlertDialog(
              title: Text('Game Over!'),
              actions: <Widget>[
                PlatformDialogAction(
                  child: Text('Play Again'),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      i1 = i2 = i3 = i4 = i5 = i6 = i7 = i8 = i9 = null;
                    });
                  },
                ),
                PlatformDialogAction(
                  child: Text('Exit'),
                  onPressed: () => exit(0),
                ),
              ],
            );
          },
        );
        reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: GridView.count(
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          crossAxisCount: 3,
          children: <Widget>[
            Cell(
              b: 3,
              r: 3,
              cB: c,
              cR: c,
              fxn: () {
                setState(() {
                  i1 = update(i1);
                  yash(0, 0);
                  check();
                  //i1 = kCross;
                });
              },
              i: i1,
            ),
            Cell(
              b: 3,
              r: 3,
              l: 3,
              cB: c,
              cR: c,
              cL: c,
              fxn: () {
                setState(() {
                  i2 = update(i2);
                  yash(0, 1);
                  check();
                  //i2 = kCircle;
                });
              },
              i: i2,
            ),
            Cell(
              b: 3,
              l: 3,
              cB: c,
              cL: c,
              fxn: () {
                setState(() {
                  i3 = update(i3);
                  yash(0, 2);
                  check();
                  //i1 = kCross;
                });
              },
              i: i3,
            ),
            Cell(
              t: 3,
              b: 3,
              r: 3,
              cT: c,
              cB: c,
              cR: c,
              fxn: () {
                setState(() {
                  i4 = update(i4);
                  yash(1, 0);
                  check();
                  //i1 = kCross;
                });
              },
              i: i4,
            ),
            Cell(
              t: 3,
              b: 3,
              r: 3,
              l: 3,
              cT: c,
              cB: c,
              cR: c,
              cL: c,
              fxn: () {
                setState(() {
                  i5 = update(i5);
                  yash(1, 1);
                  check();
                  //i1 = kCross;
                });
              },
              i: i5,
            ),
            Cell(
              t: 3,
              b: 3,
              l: 3,
              cT: c,
              cB: c,
              cL: c,
              fxn: () {
                setState(() {
                  i6 = update(i6);
                  yash(1, 2);
                  check();
                  //i1 = kCross;
                });
              },
              i: i6,
            ),
            Cell(
              t: 3,
              r: 3,
              cT: c,
              cR: c,
              fxn: () {
                setState(() {
                  i7 = update(i7);
                  yash(2, 0);
                  check();
                  //i1 = kCross;
                });
              },
              i: i7,
            ),
            Cell(
              t: 3,
              r: 3,
              l: 3,
              cT: c,
              cR: c,
              cL: c,
              fxn: () {
                setState(() {
                  i8 = update(i8);
                  yash(2, 1);
                  check();
                  //i1 = kCross;
                });
              },
              i: i8,
            ),
            Cell(
              t: 3,
              l: 3,
              cT: c,
              cL: c,
              fxn: () {
                setState(() {
                  i9 = update(i9);
                  yash(2, 2);
                  check();
                  //i1 = kCross;
                });
              },
              i: i9,
            ),
          ],
        ),
      ),
    );
  }
}

class Cell extends StatelessWidget {
  Cell(
      {this.t,
      this.b,
      this.r,
      this.l,
      this.cT,
      this.cB,
      this.cL,
      this.cR,
      this.fxn,
      this.i});
  double t, b, r, l;
  Icon i;
  Function fxn;
  Color cT, cB, cR, cL;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fxn,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: cT != null ? cT : Colors.black,
                width: t != null ? t : 0),
            bottom: BorderSide(
                color: cB != null ? cB : Colors.black,
                width: b != null ? b : 0),
            right: BorderSide(
                color: cR != null ? cR : Colors.black,
                width: r != null ? r : 0),
            left: BorderSide(
                color: cL != null ? cL : Colors.black,
                width: l != null ? l : 0),
          ),
        ),
        child: i,
      ),
    );
  }
}
