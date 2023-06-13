import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'Dart/DKGPT-programing/paint.dart';
import 'dart:math';

class ClickerGame extends StatefulWidget {
  @override
  _ClickerGameState createState() => _ClickerGameState();
}

class _ClickerGameState extends State<ClickerGame> {
  static const String _resourcesDirName = "assets/";

  int _currency = 0; //дохід
  int _currency1 = 0;
  int _currency2 = 0;
  int _currency3 = 0;
  int _currency4 = 0;
  int _currency5 = 0;
  int _currency6 = 0;
  int _currency7 = 0;
  int _money = 0; //банк
  int _upgradeLevel = 1;
  int _upgradeLevel1 = 0;
  int _upgradeLevel2 = 1; //Рівень доходу
  int _upgradeLevel3 = 1;
  int _upgradeLevel4 = 1;
  int _upgradeLevel5 = 1;
  int _upgradeLevel6 = 1;
  int _upgradeLeve7 = 1;
  int _boostLevel = 1; //Буст але зараз не працює
  int _incomePerSecond = 1; //Дохід в секунду
  bool _isPanelVisible = false;
  bool _Mapspanel = false;
  bool _Settings = false;
  bool _UP = true;
  bool _build = false;
  double _panelTopPosition = 0;
  bool _condition = false;
  bool _cooldown = false;
  bool _cooldown1 = false;
  bool _cooldown2 = false;
  bool _cooldown3 = false;
  bool _cooldown4 = false;
  bool _cooldown5 = false;
  bool _cooldown6 = false;
  bool _cooldown7 = false;
  int _cooldownTime = 2;
  int _cooldownTime1 = 2;
  int _cooldownTime2 = 2;
  int _cooldownTime3 = 2;
  int _cooldownTime4 = 2;
  int _cooldownTime5 = 2;
  int _cooldownTime6 = 2;
  int _cooldownTime7 = 2;
  int _minCooldownTime = 0;
  int _minCooldownTime1 = 0;
  int _minCooldownTime2 = 0;
  int _minCooldownTime3 = 0;
  int _minCooldownTime4 = 0;
  int _minCooldownTime5 = 0;
  int _minCooldownTime6 = 0;
  int _minCooldownTime7 = 0;
  int _cooldownReductionCost = 3;
  int _cooldownReductionCost1 = 3;
  int _cooldownReductionCost2 = 3;
  int _cooldownReductionCost3 = 3;
  int _cooldownReductionCost4 = 3;
  int _cooldownReductionCost5 = 3;
  int _cooldownReductionCost6 = 3;
  int _cooldownReductionCost7 = 3;
  int _cooldownReductionAmount = 2;
  int _cooldownReductionAmount1 = 2;
  int _cooldownReductionAmount2 = 2;
  int _cooldownReductionAmount3 = 2;
  int _cooldownReductionAmount4 = 2;
  int _cooldownReductionAmount5 = 2;
  int _cooldownReductionAmount6 = 2;
  int _cooldownReductionAmount7 = 2;
  double _cooldownReductionCostMultiplier = 1.5;
  double _cooldownReductionCostMultiplier1 = 1.5;
  double _cooldownReductionCostMultiplier2 = 1.5;
  double _cooldownReductionCostMultiplier3 = 1.5;
  double _cooldownReductionCostMultiplier4 = 1.5;
  double _cooldownReductionCostMultiplier5 = 1.5;
  double _cooldownReductionCostMultiplier6 = 1.5;
  double _cooldownReductionCostMultiplier7 = 1.5;
  int _cost1 = 1;

  void _mapsp() {
    setState(() {
      _Mapspanel = !_Mapspanel;
    });
  }

  void _incrementCurrency() {
    if (!_cooldown) {
      setState(() {
        _money = _currency + _currency1;
        _incomePerSecond = _upgradeLevel1 + _upgradeLevel;
        _upgradeLevel != _incomePerSecond;
        _currency += _upgradeLevel;
        _cooldown = true;
      });

      Future.delayed(Duration(seconds: _cooldownTime), () {
        setState(() {
          _cooldown = false;
        });
      });
    }
  }

  void _reduceCooldown() {
    if (_money >= _cooldownReductionCost) {
      setState(() {
        _money -= _cooldownReductionCost;
        _currency -= _cooldownReductionCost;
        _cooldownTime =
            max(_cooldownTime - _cooldownReductionAmount, _minCooldownTime);
        _cooldownReductionCost *= _cooldownReductionCostMultiplier as int;
      }); // працює але криво!!!!
    }
  }

  void _incrementUpgrade() {
    //Формула прокачки
    setState(() {
      if (_money >= 10 * _upgradeLevel) {
        _money -= 10 * _upgradeLevel;
        _currency -= 10 * _upgradeLevel;
        _incomePerSecond = _upgradeLevel + _upgradeLevel1;
        _upgradeLevel++;
        _changeImage('${_resourcesDirName}ButtAg.png');
      } else {
        _changeImage('${_resourcesDirName}ButtDisA.png');
      }
    });
  }

  void _changeImage(String image) {
    setState(() {
      _currentImage = Image.asset(
        image,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      );
    });
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        _currentImage = Image.asset(
          '${_resourcesDirName}ButtJ.png',
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        );
      });
    });
  }

  void _incrementCurrency1() {
    if (!_cooldown1) {
      setState(() {
        _money = _currency1 + _currency;
        _currency1 += _upgradeLevel1;
        _cooldown1 = true;
      });

      Future.delayed(Duration(seconds: _cooldownTime1), () {
        setState(() {
          _cooldown1 = false;
        });
      });
    }
  }

  void _reduceCooldown1() {
    if (_money >= _cooldownReductionCost1) {
      setState(() {
        _money -= _cooldownReductionCost1;
        _currency1 -= _cooldownReductionCost1;
        _cooldownTime1 =
            max(_cooldownTime1 - _cooldownReductionAmount1, _minCooldownTime1);
        _cooldownReductionCost1 *= _cooldownReductionCostMultiplier1 as int;
      }); // працює але криво!!!!
    }
  }

  void _incrementUpgrade1() {
    //Формула прокачки
    setState(() {
      if (_money >= 10 * _cost1) {
        _money -= 10 * _cost1;
        _currency1 -= 10 * _cost1;
        _incomePerSecond = _upgradeLevel1 + _upgradeLevel;
        _upgradeLevel1 != _incomePerSecond;
        _upgradeLevel1++;
        _cost1++;
        _changeImage('${_resourcesDirName}ButtAg.png');
      } else {
        _changeImage('${_resourcesDirName}ButtDisA.png');
      }
    });
  }

  void _incrementBoost() {
    setState(() {
      if (_money >= 100 * _boostLevel) {
        _money -= 100 * _boostLevel;
        _currency -= 100 * _boostLevel;
        _boostLevel++;
      }
    });
  }

  late Timer _timer; // таймер який оновлюється й показує дохід в секунду
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    _currentImage = Image.asset(
      '${_resourcesDirName}ButtJ.png',
      width: 40,
      height: 40,
      fit: BoxFit.cover,
    );
  }

  late Widget _currentImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(children: [
      Container(
        child: Image.asset(
          '${_resourcesDirName}Phoneund.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),

      Positioned(
        //знаходження Буста
        left: 10,
        top: 150,
        child: SizedBox(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: InkWell(
                child: Image.asset('${_resourcesDirName}Boost.gif',
                    width: 80, height: 80, fit: BoxFit.cover),
                onTap: () {
                  //кнопка Буста
                }),
          ),
        ),
      ),
      Positioned(
        //Знаходження Кліку
        left: 150,
        top: 550,
        child: SizedBox(
          //Розміри Кліку
          height: 30,
          width: 30,
          child: ElevatedButton(
            //Кнопка Кліку
            onPressed: _incrementCurrency,
            child: Text('Click'),
          ),
        ),
      ),
      Positioned(
        //Знаходження Кліку
        left: 180,
        top: 550,
        child: SizedBox(
          //Розміри Кліку
          height: 30,
          width: 30,
          child: ElevatedButton(
            //Кнопка Кліку
            onPressed: _incrementCurrency1,
            child: Text('Click'),
          ),
        ),
      ),
      Positioned(
          //Знаходження Балансу
          top: 70,
          left: 235,
          child: RichText(
              text: TextSpan(
            children: [
              WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0),
                    child: SizedBox(
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset('${_resourcesDirName}Coin.png',
                              width: 20, height: 20),
                        ))),
              ),
              TextSpan(
                text: '$_money',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ],
          ))),
      /*child: Text(
                  'Money: $_money',
                  style: TextStyle(fontSize: 25),
                ), //Вивід к-сті балансу в грі та розмір тексту
              ),*/
      Positioned(
          top: 70,
          left: 15,
          child: RichText(
              text: TextSpan(
            children: [
              WidgetSpan(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0),
                    child: SizedBox(
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset('${_resourcesDirName}Coin.png',
                              width: 20, height: 20),
                        ))),
              ),
              TextSpan(
                text: '$_incomePerSecond/s',
                style: TextStyle(fontSize: 40),
              ),
            ],
          ))),

      ///Users/dmitrokonanenko/Documents/GitHub/desktop-tutorial/clicker/assets/png-transparent-coin-coin-money-dollar.png
      Positioned(
          //Розміщення панелі прокачки
          left: 55,
          bottom: 100,
          top: !_isPanelVisible ? 750 : 600000,
          child: SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              child: Text("SHOP"), //Текст кнопки панелі покращень
              onPressed: () {
                setState(() {
                  _isPanelVisible = !_isPanelVisible;
                });
              },
            ),
          )),
      Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: _isPanelVisible ? 300 : 1000,
            bottom: _isPanelVisible ? null : -100,
            left: 30,
            child: Container(
              height: 540,
              width: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 2, 1, 101).withOpacity(0.7),
              ),
              child: Stack(
                children: [
                  Positioned(
                      //Розміщення кнопки Закриття панелі прокачки
                      top: -4,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                          child: Container(
                              child: InkWell(
                                  child: Image.asset(
                                      '${_resourcesDirName}PanelClos.png',
                                      width: 5,
                                      height: 22,
                                      fit: BoxFit.cover),
                                  onTap: (() {
                                    setState(() {
                                      _isPanelVisible = !_isPanelVisible;
                                    });
                                  }))))),
                  SizedBox(height: 10),
                  Positioned(
                      //кнопка яка включає видимість кнопок прокачки
                      top: 18,
                      child: InkWell(
                        child: Image.asset(
                          '${_resourcesDirName}Up.png',
                          height: 30,
                          width: 180,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          setState(() {
                            _UP = !_UP;
                            _build = false;
                          });
                        },
                      )),
                  Positioned(
                    //кнопка яка включає видимість кнопок будівлі
                    top: 18.5,
                    right: 0,
                    child: InkWell(
                      child: Image.asset(
                        '${_resourcesDirName}Build.png',
                        height: 30,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        setState(() {
                          _build = !_build;
                          _UP = false;
                        });
                      },
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    left: _UP ? 35 : -300,
                    right: _UP ? null : -100,
                    child: Stack(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 80, left: 45),
                            child: SizedBox(
                                width: 80,
                                height: 70,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: InkWell(
                                      child: Image.asset(
                                        '${_resourcesDirName}ButUP.png',
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      onTap: () {},
                                    )))),
                        Container(
                            margin: EdgeInsets.only(left: 165, top: 82),
                            child: SizedBox(
                              width: 80,
                              height: 70,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: InkWell(
                                    child: Image.asset(
                                      '${_resourcesDirName}UPtime.png',
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                    onTap: () {},
                                  )),
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 225, top: 175),
                            child: SizedBox(
                              width: 70,
                              height: 60,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: InkWell(
                                      child: Image.asset(
                                        '${_resourcesDirName}ButtAg.png',
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      onTap: _reduceCooldown)),
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 225, top: 245),
                            child: SizedBox(
                                width: 70,
                                height: 60,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: InkWell(
                                        child: Image.asset(
                                          '${_resourcesDirName}ButtAg.png',
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        onTap: _reduceCooldown1)))),
                        Container(
                            margin: EdgeInsets.only(left: 225, top: 315),
                            child: SizedBox(
                                width: 70,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: InkWell(
                                      child: _currentImage,
                                      onTap: (() {
                                        _changeImage;
                                      })),
                                ))),
                        Container(
                            margin: EdgeInsets.only(left: 225, top: 385),
                            child: SizedBox(
                                width: 70,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: InkWell(
                                      child: _currentImage,
                                      onTap: (() {
                                        _changeImage;
                                      })),
                                ))),
                        Container(
                            margin: EdgeInsets.only(left: 225, top: 455),
                            child: SizedBox(
                                width: 70,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: InkWell(
                                      child: _currentImage,
                                      onTap: (() {
                                        _changeImage;
                                      })),
                                ))),
                        Container(
                            margin: EdgeInsets.only(top: 175),
                            child: SizedBox(
                                width: 70,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: InkWell(
                                      child: _currentImage,
                                      onTap: (() {
                                        _incrementUpgrade();
                                        _changeImage;
                                      })),
                                ))),
                        Container(
                            margin: EdgeInsets.only(top: 245),
                            child: SizedBox(
                              width: 70,
                              height: 60,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: InkWell(
                                    child: _currentImage,
                                    onTap: _incrementUpgrade1,
                                  )),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 315),
                            child: SizedBox(
                                width: 70,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: InkWell(
                                      child: _currentImage,
                                      onTap: (() {
                                        _changeImage;
                                      })),
                                ))),
                        Container(
                            margin: EdgeInsets.only(top: 385),
                            child: SizedBox(
                                width: 70,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: InkWell(
                                      child: _currentImage,
                                      onTap: (() {
                                        _changeImage;
                                      })),
                                ))),
                        Container(
                            margin: EdgeInsets.only(top: 455),
                            child: SizedBox(
                                width: 70,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: InkWell(
                                      child: _currentImage,
                                      onTap: (() {
                                        _changeImage;
                                      })),
                                ))),
                        Container(
                          child: CustomPaint(
                            painter: LinePainter(
                              color: Color.fromARGB(255, 120, 244, 54),
                              startPoint: Offset(195, 152),
                              endPoint: Offset(195, 500),
                            ),
                          ),
                        ),
                        Container(
                          child: CustomPaint(
                            painter: LinePainter(
                              color: Color.fromARGB(255, 120, 244, 54),
                              startPoint: Offset(95, 151),
                              endPoint: Offset(95, 500),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    right: _build ? 150 : -200,
                    child: Stack(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 50, top: 150),
                            child: ElevatedButton(
                              child: Text("5"),
                              onPressed: () {},
                            )),
                        Container(
                            margin: EdgeInsets.only(right: 50, top: 100),
                            child: ElevatedButton(
                              child: Text("6"),
                              onPressed: () {},
                            )),
                        Container(
                            margin: EdgeInsets.only(right: 50, top: 200),
                            child: ElevatedButton(
                              child: Text("0"),
                              onPressed: () {},
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      /* if (_isPanelVisible)
        Container(
          //колір заднього фону

          color: Color.fromARGB(255, 140, 194, 239),

          child: Stack(
            children: [
              Positioned(
                  top: 200,
                  left: 100,
                  child: SizedBox(
                      width: 215,
                      height: 60,
                      child: Container(
                        //кнопка 1
                        color: Color.fromARGB(255, 21, 252, 0),
                        child: TextButton(
                          child: Text(
                              'First Place                                 Your level : $_upgradeLevel',
                              style: TextStyle(fontSize: 20)), //текст кнопки 1

                          onPressed: _incrementUpgrade,
                        ),
                      ))),
              Positioned(
                  //кнопка 2
                  top: 260,
                  left: 100,
                  child: SizedBox(
                      width: 215,
                      height: 60,
                      child: Container(
                          color: Color.fromARGB(255, 2, 207, 23),
                          child: TextButton(
                            child: Text(
                              "Не працююча кнопка 2",
                              style: TextStyle(fontSize: 20),
                            ), //текст кнопки 2
                            onPressed: () {},
                          )))),
              Positioned(
                  //кнопка 3
                  top: 320,
                  left: 100,
                  child: SizedBox(
                      width: 215,
                      height: 60,
                      child: Container(
                          color: Color.fromARGB(255, 21, 252, 0),
                          child: TextButton(
                            child: Text("Не працююча кнопка 3",
                                style:
                                    TextStyle(fontSize: 20)), //текст кнопки 3
                            onPressed: () {},
                          )))),
              Positioned(
                //Розміщення кнопки Закриття панелі прокачки
                top: 150,
                right: 50,
                child: SizedBox(
                    //розмір закриття панелі Прокачки
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(
                          color: Color.fromARGB(255, 197, 28, 2),
                          child: TextButton(
                            child: Text(
                              "X",
                              style: TextStyle(fontSize: 30),
                            ), //Розмір шрифту панелі Закриття
                            onPressed: () {
                              setState(() {
                                _isPanelVisible = !_isPanelVisible;
                              });
                            },
                          ),
                        ))),
              )
            ],
          ),
        ),*/
      Positioned(
          //кнопка мапи
          left: 10,
          top: 220,
          child: SizedBox(
              width: 60,
              height: 60,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: InkWell(
                      child: Image.asset('${_resourcesDirName}test.gif'),
                      onTap: () {
                        setState(() {
                          _Mapspanel = !_Mapspanel;
                          _isPanelVisible = false;
                        });
                      })))),
      if (_Mapspanel)
        Container(
          color: Color.fromARGB(255, 4, 136, 243),
          child: Stack(
            children: [
              Positioned(
                  top: 100,
                  right: 0,
                  child: ElevatedButton(
                    child: Text("Button 1"),
                    onPressed: () {},
                  )),
              Positioned(
                  bottom: 100,
                  left: 0,
                  child: ElevatedButton(
                    child: Text("Button 2"),
                    onPressed: () {},
                  )),
              Positioned(
                  //Розміщення кнопки Закриття панелі прокачки
                  top: 80,
                  right: 15,
                  child: SizedBox(
                      //розмір закриття панелі Прокачки
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Container(
                              color: Color.fromARGB(255, 197, 28, 2),
                              child: ElevatedButton(
                                  child: Text(
                                    "X",
                                    style: TextStyle(fontSize: 30),
                                  ), //Розмір шрифту панелі Закриття
                                  onPressed: (() {
                                    setState(() {
                                      _Mapspanel = !_Mapspanel;
                                    });
                                  })))))),
            ],
          ),
        ),
      Positioned(
          right: 10,
          top: 150,
          child: SizedBox(
              width: 60,
              height: 60,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: InkWell(
                      child: Image.asset('${_resourcesDirName}Settings.png'),
                      onTap: () {
                        setState(() {
                          _Settings = !_Settings;
                          _isPanelVisible = false;
                          _Mapspanel = false;
                        });
                      })))),
      if (_Settings)
        Container(
            color: Color.fromARGB(255, 4, 136, 243),
            child: Stack(
              children: [
                Positioned(
                    bottom: 100,
                    right: 0,
                    child: ElevatedButton(
                      child: Text("xuj 1"),
                      onPressed: () {},
                    )),
                Positioned(
                    bottom: 100,
                    left: 0,
                    child: ElevatedButton(
                      child: Text("Button 2"),
                      onPressed: () {},
                    )),
                Positioned(
                    //Розміщення кнопки Закриття панелі прокачки
                    top: 150,
                    right: 50,
                    child: SizedBox(
                        //розмір закриття панелі Прокачки
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Container(
                                color: Color.fromARGB(255, 197, 28, 2),
                                child: ElevatedButton(
                                    child: Text(
                                      "X",
                                      style: TextStyle(fontSize: 30),
                                    ), //Розмір шрифту панелі Закриття
                                    onPressed: (() {
                                      setState(() {
                                        _Settings = !_Settings;
                                      });
                                    })))))),
              ],
            ))
    ])));
  }
}
