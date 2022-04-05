import 'package:calc_flutter/calc_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcCubit extends Cubit<CalcStates> {
  CalcCubit() : super(CalcInitialState());

  static CalcCubit get(context) => BlocProvider.of(context);

  TextEditingController txtController = TextEditingController();

  double? fNum;
  double? sNum;
  double? res;

  String? operationVar;

  List btnValues = [7, 8, 9, 4, 5, 6, 1, 2, 3, '.', 0,];

  void btnPressedMethod(btnValue) {
    txtController.text += btnValue.toString();
    emit(CalcBtnPressedState());
  }

  void clearBtnPressed() {
    txtController.clear();
    emit(CalcClearState());
  }

  void operationMethod({required String operation}) {
    // if (txtController.text.isNotEmpty) {
    //     txtController.text.replaceAll(' ', '');
    //   if(operation == '+'){
    //     fNum = double.parse(txtController.text.trim());
    //     operationVar = '+';
    //     txtController.clear();
    //     emit(CalcAddingState());
    //   }else if(operation == '-'){
    //     fNum = double.parse(txtController.text.trim());
    //     operationVar = '-';
    //     txtController.clear();
    //     emit(CalcSubtractState());
    //   }else if(operation == 'x'){
    //     fNum = double.parse(txtController.text.trim());
    //     operationVar = 'x';
    //     txtController.clear();
    //     emit(CalcMultiplyState());
    //   }else{
    //     fNum = double.parse(txtController.text.trim());
    //     operationVar = '÷';
    //     txtController.clear();
    //     emit(CalcDivideState());
    //   }
    //
    // }

    switch (operation) {
      case '+':
        {
          if (txtController.text.isNotEmpty) {
            String num = txtController.text.replaceAll(' ', '');
            operationVar = '+';
            fNum = double.parse(num);
            fNum = fNum!.round().toDouble();
            txtController.clear();
            emit(CalcAddingState());
          }
          break;
        }
      case '-':
        {
          if (txtController.text.isNotEmpty) {
            String num = txtController.text.replaceAll(' ', '');
            operationVar = '-';
            fNum = double.parse(num);
            fNum = fNum!.round().toDouble();
            txtController.clear();
            emit(CalcSubtractState());
          }
          break;
        }
      case 'x':
        {
          if (txtController.text.isNotEmpty) {
            String num = txtController.text.replaceAll(' ', '');
            operationVar = 'x';
            fNum = double.parse(num);
            fNum = fNum!.round().toDouble();
            txtController.clear();
            emit(CalcMultiplyState());
          }
          break;
        }
      case '÷':
        {
          if (txtController.text.isNotEmpty) {
            String num = txtController.text.replaceAll(' ', '');
            operationVar = '÷';
            fNum = double.parse(num);
            fNum = fNum!.round().toDouble();
            txtController.clear();
            emit(CalcDivideState());
          }
          break;
        }
    }
  }

  void operationEquality() {
    if (fNum != null && sNum == null) {
      if (txtController.text.isNotEmpty) {
        String num = txtController.text;
        sNum = double.parse(num);
        sNum = sNum!.round().toDouble();
        txtController.clear();
        if (operationVar == '+') res = fNum! + sNum!;
        if (operationVar == '-') res = fNum! - sNum!;
        if (operationVar == 'x') res = fNum! * sNum!;
        if (operationVar == '÷') res = fNum! / sNum!;
      }
    }
    emit(CalcEqualityState());
    txtController.text = res!.toStringAsFixed(0);
    fNum = null;
    sNum = null;
    res = null;
    emit(CalcVariableClearState());
  }
}
