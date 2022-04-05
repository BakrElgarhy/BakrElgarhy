// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, must_be_immutable, sized_box_for_whitespace

import 'package:calc_flutter/calc_cubit/cubit.dart';
import 'package:calc_flutter/calc_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcScreen extends StatelessWidget {
  CalcScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalcCubit(),
      child: BlocConsumer<CalcCubit, CalcStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CalcCubit _cubit = CalcCubit.get(context);
          return Scaffold(
            appBar: AppBar(backgroundColor: Colors.black),
            body: Column(
              children: [
                Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                  child: TextFormField(
                    cursorWidth: 2,
                    controller: _cubit.txtController,
                    cursorColor: Colors.deepOrange,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                    cursorHeight: 90,
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xff1D1919),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 120,
                              mainAxisSpacing: 18,
                            ),
                            itemCount: _cubit.btnValues.length,
                            itemBuilder: (context, index) => defaultBtn(
                              onPressed: () {
                                _cubit.btnPressedMethod(
                                    _cubit.btnValues[index]);
                              },
                              childTxt: _cubit.btnValues[index].toString(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 90,
                        padding: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Color(0xff252525),
                        ),
                        child: ListView(
                          itemExtent: 74,
                          children: [
                            defaultBtn(
                                onPressed: () {
                                  _cubit.clearBtnPressed();
                                },
                                childTxt: 'حذف',
                                color: Colors.deepOrange,
                                fontSize: 25),
                            defaultBtn(
                                childTxt: '÷',
                                onPressed: () {
                                  _cubit.operationMethod(operation:'÷' );
                                },
                                color: Colors.deepOrange,
                                fontSize: 25),
                            defaultBtn(
                                childTxt: 'x',
                                onPressed: () {
                                  _cubit.operationMethod(operation:'x' );
                                },
                                color: Colors.deepOrange,
                                fontSize: 25),
                            defaultBtn(
                                childTxt: '_',
                                onPressed: () {
                                  _cubit.operationMethod(operation:'-' );
                                },
                                color: Colors.deepOrange,
                                fontSize: 25),
                            defaultBtn(
                                childTxt: '+',
                                onPressed: () {
                                  _cubit.operationMethod(operation:'+' );
                                },
                                color: Colors.deepOrange,
                                fontSize: 25),
                            defaultBtn(
                                childTxt: '=',
                                onPressed: () {
                                _cubit.operationEquality();
                                },
                                color: Colors.deepOrange,
                                fontSize: 25),
                          ],
                        ),
                      ),
                      Container(
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget defaultBtn(
          {required Function() onPressed,
          required String childTxt,
          Color color = Colors.white,
          double fontSize = 35}) =>
      TextButton(
        onPressed: onPressed,
        child: Text(
          childTxt,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
          ),
        ),
      );
}
/* Row(
                            children: [
                              Column(
                                children: [
                                  defaultBtn(onPressed: () {}, childTxt: '7'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultBtn(onPressed: () {}, childTxt: '4'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultBtn(onPressed: () {}, childTxt: '1'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultBtn(onPressed: () {}, childTxt: ','),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  defaultBtn(onPressed: () {}, childTxt: '8'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultBtn(onPressed: () {}, childTxt: '5'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultBtn(onPressed: () {}, childTxt: '2'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultBtn(onPressed: () {}, childTxt: '0'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  defaultBtn(onPressed: () {}, childTxt: '9'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultBtn(onPressed: () {}, childTxt: '6'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultBtn(onPressed: () {}, childTxt: '3'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  defaultBtn(onPressed: () {}, childTxt: '='),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                          )*/
