/*
 * Copyright © 2020 - 2021 Ansh Gandhi
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
 * Original Source Code: <https://github.com/anshgandhi4/UltimateGoalScorer>
 * Original Website: <http://roboavatars.weebly.com/ultimategoalscorer.html>
 * Original Web App: <https://roboavatars.nibbleguru.com>
 * Original Android App: <https://play.google.com/store/apps/details?id=com.anshgandhi.ultimate_goal>
 *
 * EVERYTHING ABOVE THIS LINE MUST BE KEPT AS IS UNDER GNU GPL LICENSE RULES.
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ultimate_goal/num.dart';

int ascore = 0;
int tscore = 0;
int egscore = 0;
int pscore = 0;
int totalscore = 0;

Num _a1 = new Num();
Num _a2 = new Num();
Num _a3 = new Num();
Num _a4 = new Num();
Num _a5 = new Num();
Num _a6 = new Num();

Num _t1 = new Num();
Num _t2 = new Num();
Num _t3 = new Num();

Num _eg1 = new Num();
Num _eg2 = new Num();
Num _eg3 = new Num();
Num _eg4 = new Num();

Num _p1 = new Num();
Num _p2 = new Num();

Score score = new Score();
SectionTitle aTitle = new SectionTitle(title: 'Autonomous', update: getA);
SectionTitle tTitle = new SectionTitle(title: 'Teleop', update: getT);
SectionTitle egTitle = new SectionTitle(title: 'End Game', update: getEG);
SectionTitle pTitle = new SectionTitle(title: 'Penalties', update: getP);

Auto auto = new Auto();
Teleop teleop = new Teleop();
EndGame endgame = new EndGame();
Penalty penalty = new Penalty();
List modes = [Logo(), auto, teleop, endgame, penalty];
bool mobile = false;

void titleReset() {
    totalscore = getA() + getT() + getEG() + getP();
    score.rebuild();
    aTitle.rebuild();
    tTitle.rebuild();
    egTitle.rebuild();
    pTitle.rebuild();
}

int getA() {
    return ascore;
}

void setA(int newA) {
    ascore = newA;
    titleReset();
}

void calcA() {
    setA(15 * _a1.getInt() + 15 * _a2.getInt() + 3 * _a3.getInt() + 6 * _a4.getInt() + 12 * _a5.getInt() + 5 * _a6.getInt());
}

int getT() {
    return tscore;
}

void setT(int newT) {
    tscore = newT;
    titleReset();
}

void calcT() {
    setT(2 * _t1.getInt() + 4 * _t2.getInt() + 6 * _t3.getInt());
}

int getEG() {
    return egscore;
}

void setEG(int newEG) {
    egscore = newEG;
    titleReset();
}

void calcEG() {
    setEG(15 * _eg1.getInt() + 5 * _eg2.getInt() + 5 * _eg3.getInt() + 20 * _eg4.getInt());
}

int getP() {
    return pscore;
}

void setP(int newP) {
    pscore = newP;
    titleReset();
}

void calcP() {
    setP(-10 * _p1.getInt() + -30 * _p2.getInt());
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
            backgroundColor: Colors.black,
            appBar: AppBar(
                title: Text(
                    'Ultimate Goal Scorer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                    ),
                ),
                centerTitle: true,
                backgroundColor: Colors.grey.shade900,
                elevation: 0.0,
            ),
            body: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        SizedBox(height: 8.0),
                        score,
                        SizedBox(height: 8.0),
                        Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: modes.length,
                                itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                        child: modes[index],
                                        margin: EdgeInsets.fromLTRB(mobile ? 5.0 : 15.0, 0.0, mobile ? 5.0 : 15.0, 0.0),
                                    );
                                },
                                separatorBuilder: (BuildContext context, int index) => Card(
                                    color: Colors.grey.shade300,
                                    elevation: 0.0,
                                    margin: EdgeInsets.fromLTRB(mobile ? 30.0 : 30.0, 15.0, mobile ? 30.0 : 30.0, 15.0),
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
    _ScoreState scoreState = new _ScoreState();

    @override
    _ScoreState createState() {
        scoreState = new _ScoreState();
        return scoreState;
    }

    void rebuild() {
        scoreState.rebuild();
    }
}

class _ScoreState extends State<Score> {
    @override
    Widget build(BuildContext context) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Text(
                    'Total Score: $totalscore',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                    ),
                ),
                SizedBox(width: 10.0),
                IconButton(
                    icon: Icon(
                        Icons.refresh,
                        color: Colors.white,
                    ),
                    tooltip: 'Reset',
                    onPressed: () {
                        if (this.mounted) {
                            setState(() {
                                auto.reset();
                                teleop.reset();
                                endgame.reset();
                                penalty.reset();
                                calcA();
                                calcT();
                                calcEG();
                                calcP();
                            });
                        }
                    },
                ),
            ],
        );
    }

    void rebuild() {
        if (this.mounted) {
            setState(() {});
        }
    }
}

class SectionTitle extends StatefulWidget {
    SectionTitle({Key key, this.title, this.update}) : super(key: key);

    final String title;
    final Function update;

    _SectionTitleState sectionTitleState = new _SectionTitleState();

    @override
    _SectionTitleState createState() {
        sectionTitleState = new _SectionTitleState();
        return sectionTitleState;
    }

    void rebuild() {
        sectionTitleState.rebuild();
    }
}

class _SectionTitleState extends State<SectionTitle> {
    String title = '';
    Function update = () {};

    @override
    Widget build(BuildContext context) {
        title = widget.title;
        update = widget.update;

        return Text(
            '$title: ${update().toInt()}',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
            ),
        );
    }

    void rebuild() {
        if (this.mounted) {
            setState(() {});
        }
    }
}

class CustomSlider extends StatefulWidget {
    CustomSlider({Key key, this.scorevar, this.update, this.minvar, this.maxvar, this.parent}): super(key: key);

    final Num scorevar;
    final Function update;
    final double minvar;
    final double maxvar;
    final dynamic parent;

    _CustomSliderState customSliderState = new _CustomSliderState();

    @override
    _CustomSliderState createState() => customSliderState;

    void rebuild() {
        customSliderState.rebuild();
    }
}

class _CustomSliderState extends State<CustomSlider> {
    Num scorevar;
    Function update;
    double minvar;
    double maxvar;
    dynamic parent;

    @override
    Widget build(BuildContext context) {
        scorevar = widget.scorevar;
        update = widget.update;
        minvar = widget.minvar;
        maxvar = widget.maxvar;
        parent = widget.parent;

        return SliderTheme(
            data: SliderThemeData(
                activeTickMarkColor: Colors.grey.shade200,
                activeTrackColor: Colors.grey.shade700,
                inactiveTickMarkColor: Colors.grey.shade300,
                inactiveTrackColor: Colors.grey.shade500,
                thumbColor: Colors.grey.shade800,
            ),
            child: Container(
                width: 150.0,
                child: Slider.adaptive(
                    value: scorevar.get(),
                    onChanged: (double value) {
                        scorevar.set(value);
                        update();
                        if (this.mounted) {
                            setState(() {
                                scorevar.set(value);
                            });
                        }
                    },
                    min: minvar,
                    max: maxvar,
                    divisions: (maxvar - minvar).toInt(),
                    label: '${scorevar.getInt()}',
                ),
            ),
        );
    }

    void rebuild() {
        if (this.mounted) {
            setState(() {
                update();
            });
        }
    }
}

class CustomButtonInput extends StatefulWidget {
    CustomButtonInput({Key key, this.scorevar, this.update, this.maxlength, this.parent}) : super(key: key);

    final Num scorevar;
    final Function update;
    final int maxlength;
    final dynamic parent;

    _CustomButtonInputState customButtonInputState = new _CustomButtonInputState();

    @override
    _CustomButtonInputState createState() => customButtonInputState;

    void rebuild() {
        customButtonInputState.rebuild();
    }
}

class _CustomButtonInputState extends State<CustomButtonInput> {
    Num scorevar;
    Function update;
    int maxlength;
    dynamic parent;

    @override
    Widget build(BuildContext context) {
        scorevar = widget.scorevar;
        update = widget.update;
        maxlength = widget.maxlength;
        parent = widget.parent;

        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                RaisedButton(
                    child: Text('-1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: mobile ? 8.0 : 12.0,
                        )
                    ),
                    color: Colors.grey.shade800,
                    elevation: 8.0,
                    onPressed: () {
                        scorevar.setInt(scorevar.getInt() > 0 ? scorevar.getInt() - 1 : 0);
                        update();
                        if (this.mounted) {
                            setState(() {});
                        }
                    },
                    padding: EdgeInsets.all(20),
                    shape: CircleBorder(),
                ),
                Text(
                    '${scorevar.getInt()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: mobile ? 12.0 : 18.0,
                        fontWeight: FontWeight.bold,
                    ),
                ),
                RaisedButton(
                    child: Text('+1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: mobile ? 8.0 : 12.0,
                        )
                    ),
                    color: Colors.grey.shade800,
                    elevation: 8.0,
                    onPressed: () {
                        scorevar.setInt(scorevar.getInt() + 1);
                        update();
                        if (this.mounted) {
                            setState(() {});
                        }
                    },
                    padding: EdgeInsets.all(20),
                    shape: CircleBorder(),
                ),
                RaisedButton(
                    child: Text('+3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: mobile ? 8.0 : 12.0,
                        )
                    ),
                    color: Colors.grey.shade800,
                    elevation: 8.0,
                    onPressed: () {
                        scorevar.setInt(scorevar.getInt() + 3);
                        update();
                        if (this.mounted) {
                            setState(() {});
                        }
                    },
                    padding: EdgeInsets.all(20),
                    shape: CircleBorder(),
                ),
            ],
        );
    }

    void rebuild() {
        if (this.mounted) {
            setState(() {
                scorevar.setInt(0);
                update();
            });
        }
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
    _AutoState autoState = new _AutoState();

    @override
    _AutoState createState() {
        auto = this;
        autoState = new _AutoState();
        return autoState;
    }

    void reset() {
        _a1.setInt(0);
        _a2.setInt(0);
        _a3.setInt(0);
        _a4.setInt(0);
        _a5.setInt(0);
        _a6.setInt(0);
        autoState.rebuild();
    }

    void rebuild() {
        autoState.rebuild();
    }
}

class _AutoState extends State<Auto> {
    CustomSlider a1;
    CustomSlider a2;
    CustomButtonInput a3;
    CustomButtonInput a4;
    CustomButtonInput a5;
    CustomSlider a6;

    @override
    Widget build(BuildContext context) {
        a1 = new CustomSlider(scorevar: _a1, update: calcA, minvar: 0, maxvar: 2, parent: this);
        a2 = new CustomSlider(scorevar: _a2, update: calcA, minvar: 0, maxvar: 3, parent: this);
        a3 = new CustomButtonInput(scorevar: _a3, update: calcA, maxlength: 2, parent: this);
        a4 = new CustomButtonInput(scorevar: _a4, update: calcA, maxlength: 2, parent: this);
        a5 = new CustomButtonInput(scorevar: _a5, update: calcA, maxlength: 2, parent: this);
        a6 = new CustomSlider(scorevar: _a6, update: calcA, minvar: 0, maxvar: 2, parent: this);

        return Card(
            color: Colors.grey.shade900,
            elevation: 10.0,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[
                        aTitle,
                        SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a1,
                                Text(
                                    'Wobble Goals Delivered',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: mobile ? 12.0 : 18.0,
                                    ),
                                ),
                            ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a2,
                                Text(
                                    'Power Shot Targets Knocked',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: mobile ? 12.0 : 18.0,
                                    ),
                                ),
                            ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a3,
                                Text(
                                    'Low Goal',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: mobile ? 12.0 : 18.0,
                                  ),
                                ),
                            ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a4,
                                Text(
                                    'Mid Goal',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: mobile ? 12.0 : 18.0,
                                    ),
                                ),
                            ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a5,
                                Text(
                                    'High Goal',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: mobile ? 12.0 : 18.0,
                                    ),
                                ),
                            ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                a6,
                                Text(
                                    'Robots Parked',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: mobile ? 12.0 : 18.0,
                                    ),
                                ),
                            ],
                        ),
                    ],
                ),
            ),
        );
    }

    void rebuild() {
        if (this.mounted) {
            setState(() {});
        }
    }
}

class Teleop extends StatefulWidget {
    _TeleopState teleopState = new _TeleopState();

    @override
    _TeleopState createState() {
        teleop = this;
        teleopState = new _TeleopState();
        return teleopState;
    }

    void reset() {
        _t1.setInt(0);
        _t2.setInt(0);
        _t3.setInt(0);
        teleopState.rebuild();
    }

    void rebuild() {
        teleopState.rebuild();
    }
}

class _TeleopState extends State<Teleop> {
    CustomButtonInput t1;
    CustomButtonInput t2;
    CustomButtonInput t3;

    @override
    Widget build(BuildContext context) {
        t1 = new CustomButtonInput(scorevar: _t1, update: calcT, maxlength: 2, parent: this);
        t2 = new CustomButtonInput(scorevar: _t2, update: calcT, maxlength: 2, parent: this);
        t3 = new CustomButtonInput(scorevar: _t3, update: calcT, maxlength: 2, parent: this);

        return Card(
            color: Colors.grey.shade900,
            elevation: 10.0,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                      tTitle,
                      SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              t1,
                              Text(
                                  'Low Goal',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mobile ? 12.0 : 18.0,
                                  ),
                              ),
                          ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              t2,
                              Text(
                                  'Mid Goal',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mobile ? 12.0 : 18.0,
                                  ),
                              ),
                          ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              t3,
                              Text(
                                  'High Goal',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mobile ? 12.0 : 18.0,
                                  ),
                              ),
                          ],
                      ),
                    ],
                ),
            ),
        );
    }

    void rebuild() {
        if (this.mounted) {
            setState(() {});
        }
    }
}

class EndGame extends StatefulWidget {
    _EndGameState endGameState = new _EndGameState();

    @override
    _EndGameState createState() {
        endgame = this;
        endGameState = new _EndGameState();
        return endGameState;
    }

    void reset() {
        _eg1.setInt(0);
        _eg2.setInt(0);
        _eg3.setInt(0);
        _eg4.setInt(0);
        endGameState.rebuild();
    }

    void rebuild() {
        endGameState.rebuild();
    }
}

class _EndGameState extends State<EndGame> {
    CustomSlider eg1;
    CustomButtonInput eg2;
    CustomSlider eg3;
    CustomSlider eg4;

    @override
    Widget build(BuildContext context) {
        eg1 = CustomSlider(scorevar: _eg1, update: calcEG, minvar: 0, maxvar: 3, parent: this);
        eg2 = CustomButtonInput(scorevar: _eg2, update: calcEG, maxlength: 2, parent: this);
        eg3 = CustomSlider(scorevar: _eg3, update: calcEG, minvar: 0, maxvar: 2, parent: this);
        eg4 = CustomSlider(scorevar: _eg4, update: calcEG, minvar: 0, maxvar: 2, parent: this);

        return Card(
            color: Colors.grey.shade900,
            elevation: 10.0,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                      egTitle,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              eg1,
                              Text(
                                  'Power Shot Targets Knocked',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mobile ? 12.0 : 18.0,
                                  ),
                              ),
                          ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              eg2,
                              Text(
                                  'Total Rings on Wobble Goals',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mobile ? 12.0 : 18.0,
                                  ),
                              ),
                          ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              eg3,
                              Text(
                                  'Wobble Goals Returned',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mobile ? 12.0 : 18.0,
                                  ),
                              ),
                          ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                              eg4,
                              Text(
                                  'Wobble Goals in Drop Zone',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mobile ? 12.0 : 18.0,
                                  ),
                              ),
                          ],
                      ),
                    ],
                ),
            ),
        );
    }

    void rebuild() {
        if (this.mounted) {
            setState(() {});
        }
    }
}

class Penalty extends StatefulWidget {
    _PenaltyState penaltyState = new _PenaltyState();

    @override
    _PenaltyState createState() {
        penalty = this;
        penaltyState = new _PenaltyState();
        return penaltyState;
    }

    void reset() {
        _p1.setInt(0);
        _p2.setInt(0);
        penaltyState.rebuild();
    }

    void rebuild() {
        penaltyState.rebuild();
    }
}

class _PenaltyState extends State<Penalty> {
    CustomButtonInput p1;
    CustomButtonInput p2;

    @override
    Widget build(BuildContext context) {
        p1 = new CustomButtonInput(scorevar: _p1, update: calcP, maxlength: 2, parent: this);
        p2 = new CustomButtonInput(scorevar: _p2, update: calcP, maxlength: 2, parent: this);

        return Card(
            color: Colors.grey.shade900,
            elevation: 10.0,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[
                        pTitle,
                        SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                p1,
                                Text(
                                    'Minor',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: mobile ? 12.0 : 18.0,
                                    ),
                                ),
                            ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                p2,
                                Text(
                                    'Major',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: mobile ? 12.0 : 18.0,
                                    ),
                                ),
                            ],
                        ),
                    ],
                ),
            ),
        );
    }

    void rebuild() {
        if (this.mounted) {
            setState(() {});
        }
    }
}