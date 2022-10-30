import 'package:auto_size_text/auto_size_text.dart';
import 'package:day_manager/constFiles/colors.dart';
import 'package:day_manager/constFiles/strings.dart';
import 'package:day_manager/controller/transactionController.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class HomeReportContainer extends StatelessWidget {
  const HomeReportContainer({
    Key? key,
    required this.transactionController,
  }) : super(key: key);

  final TransactionController transactionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
          color: whiteColor.withOpacity(0.85),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Monthly salary",
              style: TextStyle(
                  color: blackColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SAR", style: TextStyle(color: textINRColor)),
              Expanded(
                child: AutoSizeText(
                    transactionController.total.toStringAsFixed(1),
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                    textAlign: TextAlign.center),

              ),
              // IconButton(
              //   icon: Icon(Icons.edit_note),
              //   color: Colors.black38,
              //   onPressed: () {
              //     showDialog(
              //         context: context,
              //         builder: (BuildContext context) {
              //           return Dialog(
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(
              //                     20.0)), //this right here
              //             child: Container(
              //               height: 200,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(12.0),
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     TextField(
              //                       decoration: InputDecoration(
              //                           border: InputBorder.none,
              //                           hintText: 'write your monthly salary?'),
              //                     ),
              //                     TextButton(
              //
              //                       style: ElevatedButton.styleFrom(
              //                         primary: Colors.teal,
              //                         onPrimary: Colors.white,
              //                         shadowColor: Colors.teal,
              //                         elevation: 7,
              //                         textStyle: const TextStyle(fontSize: 15),
              //                         shape: RoundedRectangleBorder(
              //                             borderRadius: BorderRadius.circular(10.0)),
              //                         minimumSize: Size(110, 10),
              //                       ),
              //                       child: const Text('Done !'),
              //
              //                       onPressed: () {
              //                         Navigator.of(context).pop();
              //                       },
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           );
              //         });
              //   },
              // ),
            ],
          ),
          IncomeExpense(transactionController: transactionController),
        ]
            .map((e) => Padding(padding: EdgeInsets.only(top: 15.0), child: e))
            .toList(),
      ),
    );
  }
}

class IncomeExpense extends StatelessWidget {
  const IncomeExpense({
    Key? key,
    required this.transactionController,
  }) : super(key: key);

  final TransactionController transactionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(
              width: 1,
              color: greyColor,
              style: BorderStyle.solid,
              strokeAlign: StrokeAlign.outside),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_downward, color: incomeGreen),
                    Text(income, style: TextStyle(color: blackColor)),
                  ],
                ),
                Center(
                  child: AutoSizeText(
                    transactionController.totalIncome.toStringAsFixed(1),
                    style: TextStyle(color: blueColor, fontSize: 20),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            color: greyColor,
            width: 2,
            height: 50.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_upward, color: expenseRed),
                    Text(expense, style: TextStyle(color: blackColor)),
                  ],
                ),
                Center(
                  child: AutoSizeText(
                    transactionController.totalExpense.toStringAsFixed(1),
                    style: TextStyle(color: blueColor, fontSize: 20),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
