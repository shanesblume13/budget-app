import 'package:budget/Controller/transaction_controller.dart';
import 'package:budget/Model/transaction.dart';
import 'package:budget/View/Transaction/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class TransactionDetailCard extends StatelessWidget {
  final Transaction transaction;

  TransactionDetailCard({
    Key key,
    this.transaction,
  }) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();
  final TransactionController _transactionController = Get.find();

  @override
  Widget build(BuildContext context) {
    String amountDollarString =
        '${transaction.amount?.abs()?.toStringAsFixed(2) ?? ''}';
    //Color amountColor = transaction.amount < 0 ? Colors.red : Colors.green;

    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'description',
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    initialValue: transaction.description,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 1),
                      FormBuilderValidators.max(context, 50),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                  FormBuilderTextField(
                    name: 'amount',
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                    initialValue: amountDollarString,
                    valueTransformer: (text) =>
                        num.tryParse(text).toStringAsFixed(2),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.numeric(context),
                    ]),
                    keyboardType: TextInputType.numberWithOptions(
                        signed: false, decimal: true),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        Transaction newTransaction = Transaction(
                          description: _formKey.currentState.value['description'],
                          amount: double.tryParse(_formKey.currentState.value['amount']),
                        );

                        _transactionController.addTransaction(newTransaction);
                      } else {
                        print("validation failed");
                      }

                      Get.back();
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState.reset();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
