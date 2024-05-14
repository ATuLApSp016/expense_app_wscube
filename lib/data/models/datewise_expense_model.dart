import 'package:expense_app_wscube/data/models/expense_model.dart';

class DateWiseExpenseModel {
  String date;
  String totalAmt;
  List<ExpenseModel> eachDateAllExpense;
  DateWiseExpenseModel({required this.date, required this.totalAmt, required this.eachDateAllExpense,});
}