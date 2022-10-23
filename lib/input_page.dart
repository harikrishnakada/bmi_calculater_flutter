import 'package:bmo_calculater_flutter/model/bmiModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_container.dart';
import 'card_content.dart';
import 'contants/global_constants.dart';
import 'enum/globalEnums.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInActiveCardColorHex;
  Color femaleCardColor = kInActiveCardColorHex;
  Map args = Map();
  BMI_Model bmi = BMI_Model();

  updateGenderColor(Gender gender) {
    if (gender == Gender.Male) {
      maleCardColor = kActiveCardColorHex;
      femaleCardColor = kInActiveCardColorHex;
    } else if (gender == Gender.Female) {
      femaleCardColor = kActiveCardColorHex;
      maleCardColor = kInActiveCardColorHex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardContainer(
                    cardColor: maleCardColor,
                    onTapped: () {
                      setState(() {
                        bmi.gender = Gender.Male;
                        updateGenderColor(Gender.Male);
                      });
                    },
                    cardChild: CardContent(
                        label: 'MALE', iconData: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    cardColor: femaleCardColor,
                    onTapped: () {
                      setState(() {
                        bmi.gender = Gender.Female;
                        updateGenderColor(Gender.Female);
                      });
                    },
                    cardChild: CardContent(
                        label: 'FEMALE', iconData: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardContainer(
                    onTapped: () {},
                    cardColor: kActiveCardColorHex,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              bmi.height.toString(),
                              style: kNumberTextStyle,
                            ),
                            const Text(
                              'cm',
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey.shade700,
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 30.0),
                              thumbColor: kPrimaryColorHex,
                              overlayColor: kPrimaryColorOverlayHex),
                          child: Slider(
                              value: bmi.height.toDouble(),
                              min: 120,
                              max: 220,
                              onChanged: (double newValue) {
                                setState(() {
                                  bmi.height = newValue.round();
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CardContainer(
                  onTapped: () {},
                  cardColor: kActiveCardColorHex,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            bmi.weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          const Text(
                            'kg',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            onPressed: () {
                              print('m');
                              setState(() {
                                bmi.weight--;
                              });
                            },
                            child: FontAwesomeIcons.minus,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundedIconButton(
                            onPressed: () {
                              setState(() {
                                bmi.weight++;
                              });
                            },
                            child: FontAwesomeIcons.plus,
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: CardContainer(
                    onTapped: () {},
                    cardColor: kActiveCardColorHex,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          bmi.age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              onPressed: () {
                                setState(() {
                                  bmi.age--;
                                });
                              },
                              child: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundedIconButton(
                              onPressed: () {
                                setState(() {
                                  bmi.age++;
                                });
                              },
                              child: FontAwesomeIcons.plus,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              args['result'] = bmi.calculateBMI();
              args['status'] = bmi.GetStatus(args['result']);
              Navigator.pushNamed(context, '/results', arguments: args);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              color: kPrimaryColorHex,
              width: double.infinity,
              height: kBottomContainerHeight,
              child: const Center(
                child: Text('CALCULATE', style: TextStyle(fontSize: 25)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({required this.child, required this.onPressed});

  final IconData child;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      enableFeedback: true,
      child: Icon(
        child,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
