import 'package:expense_app_wscube/data/models/datewise_expense_model.dart';
import 'package:expense_app_wscube/data/models/expense_model.dart';
import 'package:expense_app_wscube/data/models/filter_expense_model.dart';
import 'package:expense_app_wscube/data/models/monthwise_model.dart';
import 'package:expense_app_wscube/data/repository/local/database_helper.dart';
import 'package:expense_app_wscube/domain/routes/app_routes.dart';
import 'package:expense_app_wscube/domain/ui_helper/ui_helper.dart';
import 'package:expense_app_wscube/domain/utils/app_colors.dart';
import 'package:expense_app_wscube/domain/utils/app_constant.dart';
import 'package:expense_app_wscube/domain/utils/app_images.dart';
import 'package:expense_app_wscube/presentation/pages/bloc/expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedTransactionType = 'This Month';
  List<FilterExpenseModel> listFilterExpenseModel = [];
  List<ExpenseModel> listExpenses = [];
/*
  List<MonthWiseExpenseModel> listMonthWiseExpenseModel = [];
*/

  var dateFormat = DateFormat.yMMMMd();
  var monthFormat = DateFormat.LLLL();
  var yearFormat = DateFormat.y();

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchInitialExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EXPENIO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorsConstant.black_Color,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      fontSize: 28,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        color: ColorsConstant.secondaryblack_Color,
                        Icons.search_outlined,
                        size: 28,
                      ))
                ],
              ),
              const SizedBox(height: 11),
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage('assets/images/profile_img.png'),
                  ),
                  SizedBox(width: 11),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Morning',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        'atul patel',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: ColorsConstant.primary_Color,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton(
                      dropdownColor: ColorsConstant.primary_Color,
                      focusColor: Colors.white,
                      value: selectedTransactionType,
                      onChanged: (newValue) {
                        if(newValue == 'This Month'){
                          filterExpenseMonthWise(allExpenses: listExpenses);
                        }else if(newValue == 'Date Wise'){
                          filterExpenseDateWise(allExpenses: listExpenses);

                        }
                        setState(() {
                          selectedTransactionType = newValue!;
                        });
                      },
                      items: [
                        'This Month',
                        'This Year',
                        'This Week',
                        'Date Wise'
                      ].map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(
                            type,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 31),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.blueAccent.shade400),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(11),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Expense total',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                  fontSize: 17,
                                ),
                              ),
                              const Text(
                                '\$2,333',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45,
                                  color: Colors.white,
                                  letterSpacing: 0.7,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.red.shade400),
                                    child: const Align(
                                      child: Text(
                                        '+\$240',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  const Text(
                                    'than last month',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white70,
                                      letterSpacing: 0.7,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/home_logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 21),
              Align(
                alignment: Alignment.centerLeft,
                child: CTextWidget(
                  cText: 'Expense List',
                  cTextStyle: TextStyle(
                    color: ColorsConstant.secondaryblack_Color,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 11),
              Expanded(
                child: BlocBuilder<ExpenseBloc, ExpenseState>(
                  builder: (_, state) {
                    if (state is ExpenseLoadingState) {
                      return CircularProgressIndicator(
                          color: ColorsConstant.primary_Color);
                    }
                    if (state is ExpenseErrorState) {
                      return Center(
                        child: Text('Error: ${state.errorMsg}'),
                      );
                    }
                    if (state is ExpenseLoadedState) {
                     // filterExpenseDateWise(allExpenses: state.allExpense);
                      listExpenses = state.allExpense;
                      return ListView.builder(
                          itemCount: listFilterExpenseModel.length,
                          itemBuilder: (_, parentIndex) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        width: 2,
                                        color: ColorsConstant.mainText_Color),
                                    borderRadius: BorderRadius.circular(11)),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 21),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CTextWidget(
                                              cText: listFilterExpenseModel[
                                                      parentIndex]
                                                  .title,
                                              cTextStyle: TextStyle(
                                                color:
                                                    ColorsConstant.black_Color,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                              ),
                                            ),
                                            CTextWidget(
                                              cText:
                                                  '\u{20B9}${listFilterExpenseModel[parentIndex].totalAmt}',
                                              cTextStyle: TextStyle(
                                                color:
                                                    ColorsConstant.black_Color,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                        color: ColorsConstant.mainText_Color,
                                        thickness: 2,
                                        height: 10,
                                        endIndent: 15,
                                        indent: 15),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          listFilterExpenseModel[parentIndex]
                                              .allExpenses
                                              .length,
                                      itemBuilder: (_, index) {
                                        var filteredList = AppConstants
                                            .mCategories
                                            .where((element) =>
                                                element.catId ==
                                                listFilterExpenseModel[
                                                        parentIndex]
                                                    .allExpenses[index]
                                                    .eCatId)
                                            .toList();
                                        String imgPath = filteredList[0].catImg;
                                        print(filteredList);
                                        return ListTile(
                                          leading: Container(
                                            height: 80,
                                            width: 70,
                                            padding: const EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.blue.shade200),
                                            child: Center(
                                              child: Image.asset(imgPath),
                                            ),
                                          ),
                                          title: Text(
                                            listFilterExpenseModel[parentIndex]
                                                .allExpenses[index]
                                                .eTitle,
                                            style: TextStyle(
                                              color: ColorsConstant.black_Color,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                            ),
                                          ),
                                          subtitle: Text(
                                            listFilterExpenseModel[parentIndex]
                                                .allExpenses[index]
                                                .eDesc,
                                            style: TextStyle(
                                              color:
                                                  ColorsConstant.mainText_Color,
                                              fontSize: 15,
                                            ),
                                          ),
                                          trailing: Text(
                                            '\u{20B9}${listFilterExpenseModel[parentIndex].allExpenses[index].eAmount}',
                                            style: TextStyle(
                                              color:
                                                  ColorsConstant.primary_Color,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void filterExpenseDateWise({required List<ExpenseModel> allExpenses}) {
    /// find the unique dates
    listFilterExpenseModel.clear();
    List<String> uniqueDates = [];

    for (ExpenseModel eachExpense in allExpenses) {
      var createdAt = eachExpense.eTimeSpand;
      var mDateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt));
      var eachExpenseDate = dateFormat.format(mDateTime);
      print(eachExpenseDate);

      if (!uniqueDates.contains(eachExpenseDate)) {
        uniqueDates.add(eachExpenseDate);
      }
      print(uniqueDates);
    }

    for (String eachDate in uniqueDates) {
      num totalExpAmt = 0;
      List<ExpenseModel> eachDateExpenses = [];

      for (ExpenseModel eachExpense in allExpenses) {
        var createdAt = eachExpense.eTimeSpand;
        var mDateTime =
            DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt));
        var eachExpenseDate = dateFormat.format(mDateTime);

        if (eachExpenseDate == eachDate) {
          eachDateExpenses.add(eachExpense);

          if (eachExpense.eType == 'Debit') {
            totalExpAmt -= int.parse(eachExpense.eAmount);
          } else {
            totalExpAmt += int.parse(eachExpense.eAmount);
          }
        }
      }
      listFilterExpenseModel.add(FilterExpenseModel(
        title: eachDate,
        totalAmt: totalExpAmt.toString(),
        allExpenses: eachDateExpenses,
      ));
    }
    print(listFilterExpenseModel.length);
  }

  void filterExpenseMonthWise({required List<ExpenseModel> allExpenses}) {
    /// find the unique dates
    listFilterExpenseModel.clear();
    List<String> uniqueMonths = [];

    for (int i = 0; i < allExpenses.length; i++) {
      var createdAt = allExpenses[i].eTimeSpand;
      var mDateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt));

      var eachExpenseMonth = dateFormat.format(mDateTime);
      var eachExpenseYear = dateFormat.format(mDateTime);

      print('$eachExpenseMonth - $eachExpenseYear');
      var eachExpenseMonthYear = '$eachExpenseMonth - $eachExpenseYear';

      if (!uniqueMonths.contains(eachExpenseMonthYear)) {
        uniqueMonths.add(eachExpenseMonthYear);
      }
      print(uniqueMonths);
    }

    for (String eachDate in uniqueMonths) {
      num totalExpAmt = 0;
      List<ExpenseModel> eachMonthExpenses = [];

      for (ExpenseModel eachExpense in allExpenses) {
        var createdAt = eachExpense.eTimeSpand;
        var mDateTime =
            DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt));
        var eachExpenseMonth = dateFormat.format(mDateTime);
        var eachExpenseYear = dateFormat.format(mDateTime);

        print('$eachExpenseMonth - $eachExpenseYear');
        var eachExpenseMonthYear = '$eachExpenseMonth - $eachExpenseYear';

        if (eachExpenseMonthYear == eachDate) {
          eachMonthExpenses.add(eachExpense);

          if (eachExpense.eType == 'Debit') {
            totalExpAmt -= int.parse(eachExpense.eAmount);
          } else {
            totalExpAmt += int.parse(eachExpense.eAmount);
          }
        }
      }
      listFilterExpenseModel.add(FilterExpenseModel(
        title: eachDate,
        totalAmt: totalExpAmt.toString(),
        allExpenses: eachMonthExpenses,
      ));
    }
    print(listFilterExpenseModel.length);
  }
}
