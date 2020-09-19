/*
 * Copyright © 2020 Ansh Gandhi
 *
 * This file is part of Ultimate Goal Scorer.
 *
 * Ultimate Goal Scorer is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Ultimate Goal Scorer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Ultimate Goal Scorer.  If not, see <https://www.gnu.org/licenses/>.
 *
 * Original Author: Ansh Gandhi
 * Original Source Code: <https://github.com/anshgandhi4/UltimateGoalScorer/>
 * Original Webpage: <http://roboavatars.weebly.com/ultimategoalscorer.html/>
 * Original Web App: <https://roboavatars.nibbleguru.com/>
 * Original App: <https://play.google.com/store/apps/details?id=com.anshgandhi.ultimate_goal/>
 *
 * EVERYTHING ABOVE THIS LINE MUST BE KEPT AS IS UNDER GNU GPL LICENSE RULES.
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

int ascore = 0;
int tscore = 0;
int egscore = 0;
int score = 0;

Score totalScore = new Score();
List modes = [Logo(), Auto(), Teleop(), EndGame()];

int getA() {
  return ascore;
}

void setA(int newA) {
  ascore = newA;
  score = getA() + getT() + getEG();
  totalScore.rebuild();
}

int getT() {
  return tscore;
}

void setT(int newT) {
  tscore = newT;
  score = getA() + getT() + getEG();
  totalScore.rebuild();
}

int getEG() {
  return egscore;
}

void setEG(int newEG) {
  egscore = newEG;
  score = getA() + getT() + getEG();
  totalScore.rebuild();
}

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text(
            'Ultimate Goal Scorer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 8.0),
            totalScore,
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: modes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: modes[index],
                    margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => Card(
                  color: Colors.grey[350],
                  elevation: 0.0,
                  margin: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                  child: SizedBox(height: 5.0),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Brought to You By:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            Text(
              'FTC Team 7303 RoboAvatars',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}

class Score extends StatefulWidget {
  _ScoreState scorestate = new _ScoreState();

  @override
  _ScoreState createState() => scorestate;

  void rebuild() {
    scorestate.rebuild();
  }
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Total Score: $score',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void rebuild() {
    setState(() {});
  }
}

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/UltimateGoalLogo.png',
      height: 125,
      width: 125,
    );
  }
}

class Auto extends StatefulWidget {
  @override
  _AutoState createState() => _AutoState();
}

class _AutoState extends State<Auto> {
  double _a1 = 0;
  double _a2 = 0;
  int _a3 = 0;
  int _a4 = 0;
  int _a5 = 0;
  double _a6 = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade800,
      elevation: 10.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'Autonomous: ${getA()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SliderTheme(
                  data: SliderThemeData(
                    activeTickMarkColor: Colors.grey.shade200,
                    activeTrackColor: Colors.grey.shade700,
                    inactiveTickMarkColor: Colors.grey.shade300,
                    inactiveTrackColor: Colors.grey.shade500,
                    thumbColor: Colors.grey.shade900,
                  ),
                  child: Container(
                    width: 150.0,
                    child: Slider.adaptive(
                      value: _a1,
                      onChanged: (double value) {
                        _a1 = value;
                        calcA();
                        setState(() {});
                      },
                      min: 0,
                      max: 2,
                      divisions: 2,
                      label: '${_a1.toInt()}',
                    ),
                  ),
                ),
                Text(
                  'Wobble Goals Delivered',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SliderTheme(
                  data: SliderThemeData(
                    activeTickMarkColor: Colors.grey.shade200,
                    activeTrackColor: Colors.grey.shade700,
                    inactiveTickMarkColor: Colors.grey.shade300,
                    inactiveTrackColor: Colors.grey.shade500,
                    thumbColor: Colors.grey.shade900,
                  ),
                  child: Container(
                    width: 150.0,
                    child: Slider.adaptive(
                      value: _a2,
                      onChanged: (double value) {
                        _a2 = value;
                        calcA();
                        setState(() {});
                      },
                      min: 0,
                      max: 3,
                      divisions: 3,
                      label: '${_a2.toInt()}',
                    ),
                  ),
                ),
                Text(
                  'Power Shot Targets Knocked',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 60.0,
                  child: TextField(
                    autocorrect: false,
                    autofocus: false,
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(2.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder (
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      counterText: '',
                    ),
                    expands: false,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    maxLengthEnforced: true,
                    onChanged: (String value) {
                      if (value == '' || value == null) {
                        _a3 = 0;
                      } else {
                        _a3 = int.parse(value);
                      }
                      calcA();
                      setState(() {});
                    },
                    onSubmitted: (String value) {
                      if (value == '' || value == null) {
                        _a3 = 0;
                      } else {
                        _a3 = int.parse(value);
                      }
                      calcA();
                      setState(() {});
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  'Low Goal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 60.0,
                  child: TextField(
                    autocorrect: false,
                    autofocus: false,
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(2.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder (
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      counterText: '',
                    ),
                    expands: false,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    maxLengthEnforced: true,
                    onChanged: (String value) {
                      if (value == '' || value == null) {
                        _a4 = 0;
                      } else {
                        _a4 = int.parse(value);
                      }
                      calcA();
                      setState(() {});
                    },
                    onSubmitted: (String value) {
                      if (value == '' || value == null) {
                        _a4 = 0;
                      } else {
                        _a4 = int.parse(value);
                      }
                      calcA();
                      setState(() {});
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  'Mid Goal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 60.0,
                  child: TextField(
                    autocorrect: false,
                    autofocus: false,
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(2.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder (
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      counterText: '',
                    ),
                    expands: false,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    maxLengthEnforced: true,
                    onChanged: (String value) {
                      if (value == '' || value == null) {
                        _a5 = 0;
                      } else {
                        _a5 = int.parse(value);
                      }
                      calcA();
                      setState(() {});
                    },
                    onSubmitted: (String value) {
                      if (value == '' || value == null) {
                        _a5 = 0;
                      } else {
                        _a5 = int.parse(value);
                      }
                      calcA();
                      setState(() {});
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  'High Goal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SliderTheme(
                  data: SliderThemeData(
                    activeTickMarkColor: Colors.grey.shade200,
                    activeTrackColor: Colors.grey.shade700,
                    inactiveTickMarkColor: Colors.grey.shade300,
                    inactiveTrackColor: Colors.grey.shade500,
                    thumbColor: Colors.grey.shade900,
                  ),
                  child: Container(
                    width: 150.0,
                    child: Slider.adaptive(
                      value: _a6,
                      onChanged: (double value) {
                        _a6 = value;
                        calcA();
                        setState(() {});
                      },
                      min: 0,
                      max: 2,
                      divisions: 2,
                      label: '${_a6.toInt()}',
                    ),
                  ),
                ),
                Text(
                  'Robots Parked',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void calcA() {
    setA(15 * _a1.toInt() + 15 * _a2.toInt() + 3 * _a3 + 6 * _a4 + 12 * _a5.toInt() + 5 * _a6.toInt());
  }
}

class Teleop extends StatefulWidget {
  @override
  _TeleopState createState() => _TeleopState();
}

class _TeleopState extends State<Teleop> {
  int _t1 = 0;
  int _t2 = 0;
  int _t3 = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade800,
      elevation: 10.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'Teleop: ${getT()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 60.0,
                  child: TextField(
                    autocorrect: false,
                    autofocus: false,
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(2.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder (
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      counterText: '',
                    ),
                    expands: false,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    maxLengthEnforced: true,
                    onChanged: (String value) {
                      if (value == '' || value == null) {
                        _t1 = 0;
                      } else {
                        _t1 = int.parse(value);
                      }
                      calcT();
                      setState(() {});
                    },
                    onSubmitted: (String value) {
                      if (value == '' || value == null) {
                        _t1 = 0;
                      } else {
                        _t1 = int.parse(value);
                      }
                      calcT();
                      setState(() {});
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  'Low Goal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 60.0,
                  child: TextField(
                    autocorrect: false,
                    autofocus: false,
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(2.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder (
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      counterText: '',
                    ),
                    expands: false,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    maxLengthEnforced: true,
                    onChanged: (String value) {
                      if (value == '' || value == null) {
                        _t2 = 0;
                      } else {
                        _t2 = int.parse(value);
                      }
                      calcT();
                      setState(() {});
                    },
                    onSubmitted: (String value) {
                      if (value == '' || value == null) {
                        _t2 = 0;
                      } else {
                        _t2 = int.parse(value);
                      }
                      calcT();
                      setState(() {});
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  'Mid Goal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 60.0,
                  child: TextField(
                    autocorrect: false,
                    autofocus: false,
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(2.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder (
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      counterText: '',
                    ),
                    expands: false,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    maxLengthEnforced: true,
                    onChanged: (String value) {
                      if (value == '' || value == null) {
                        _t3 = 0;
                      } else {
                        _t3 = int.parse(value);
                      }
                      calcT();
                      setState(() {});
                    },
                    onSubmitted: (String value) {
                      if (value == '' || value == null) {
                        _t3 = 0;
                      } else {
                        _t3 = int.parse(value);
                      }
                      calcT();
                      setState(() {});
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  'High Goal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void calcT() {
    setT(2 * _t1 + 4 * _t2 + 6 * _t3);
  }
}

class EndGame extends StatefulWidget {
  @override
  _EndGameState createState() => _EndGameState();
}

class _EndGameState extends State<EndGame> {
  double _eg1 = 0;
  int _eg2 = 0;
  double _eg3 = 0;
  double _eg4 = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade800,
      elevation: 10.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'End Game: ${getEG()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SliderTheme(
                  data: SliderThemeData(
                    activeTickMarkColor: Colors.grey.shade200,
                    activeTrackColor: Colors.grey.shade700,
                    inactiveTickMarkColor: Colors.grey.shade300,
                    inactiveTrackColor: Colors.grey.shade500,
                    thumbColor: Colors.grey.shade900,
                  ),
                  child: Container(
                    width: 150.0,
                    child: Slider.adaptive(
                      value: _eg1,
                      onChanged: (double value) {
                        _eg1 = value;
                        calcEG();
                        setState(() {});
                      },
                      min: 0,
                      max: 3,
                      divisions: 3,
                      label: '${_eg1.toInt()}',
                    ),
                  ),
                ),
                Text(
                  'Power Shot Targets Knocked',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 60.0,
                  child: TextField(
                    autocorrect: false,
                    autofocus: false,
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(2.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder (
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      counterText: '',
                    ),
                    expands: false,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    maxLengthEnforced: true,
                    onChanged: (String value) {
                      if (value == '' || value == null) {
                        _eg2 = 0;
                      } else {
                        _eg2 = int.parse(value);
                      }
                      calcEG();
                      setState(() {});
                    },
                    onSubmitted: (String value) {
                      if (value == '' || value == null) {
                        _eg2 = 0;
                      } else {
                        _eg2 = int.parse(value);
                      }
                      calcEG();
                      setState(() {});
                    },
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  'Total Rings on Wobble Goals',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SliderTheme(
                  data: SliderThemeData(
                    activeTickMarkColor: Colors.grey.shade200,
                    activeTrackColor: Colors.grey.shade700,
                    inactiveTickMarkColor: Colors.grey.shade300,
                    inactiveTrackColor: Colors.grey.shade500,
                    thumbColor: Colors.grey.shade900,
                  ),
                  child: Container(
                    width: 150.0,
                    child: Slider.adaptive(
                      value: _eg3,
                      onChanged: (double value) {
                        _eg3 = value;
                        calcEG();
                        setState(() {});
                      },
                      min: 0,
                      max: 2,
                      divisions: 2,
                      label: '${_eg3.toInt()}',
                    ),
                  ),
                ),
                Text(
                  'Wobble Goals Returned',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SliderTheme(
                  data: SliderThemeData(
                    activeTickMarkColor: Colors.grey.shade200,
                    activeTrackColor: Colors.grey.shade700,
                    inactiveTickMarkColor: Colors.grey.shade300,
                    inactiveTrackColor: Colors.grey.shade500,
                    thumbColor: Colors.grey.shade900,
                  ),
                  child: Container(
                    width: 150.0,
                    child: Slider.adaptive(
                      value: _eg4,
                      onChanged: (double value) {
                        _eg4 = value;
                        calcEG();
                        setState(() {});
                      },
                      min: 0,
                      max: 2,
                      divisions: 2,
                      label: '${_eg4.toInt()}',
                    ),
                  ),
                ),
                Text(
                  'Wobble Goals in Drop Zone',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void calcEG() {
    setEG(15 * _eg1.toInt() + 5 * _eg2 + 5 * _eg3.toInt() + 20 * _eg4.toInt());
  }
}