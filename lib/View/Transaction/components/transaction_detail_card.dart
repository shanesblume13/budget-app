import 'package:budget/Controller/transaction_controller.dart';
import 'package:budget/Model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// TODO Break widgets at bottom into their own files.
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
            TransactionFormBuilder(
                formKey: _formKey,
                transaction: transaction,
                amountDollarString: amountDollarString),
            TransactionButtonRow(
                formKey: _formKey,
                transactionController: _transactionController)
          ],
        ),
      ),
    );
  }
}

class TransactionFormBuilder extends StatelessWidget {
  const TransactionFormBuilder({
    Key key,
    @required GlobalKey<FormBuilderState> formKey,
    @required this.transaction,
    @required this.amountDollarString,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _formKey;
  final Transaction transaction;
  final String amountDollarString;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          TransactionFormDescriptionText(transaction: transaction),
          TransactionFormAmountText(amountDollarString: amountDollarString),
          TransactionFormClearedDatePicker(transaction: transaction),
        ],
      ),
    );
  }
}

class TransactionFormClearedDatePicker extends StatelessWidget {
  const TransactionFormClearedDatePicker({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: 'clearedDate',
      // onChanged: _onChanged,
      inputType: InputType.date,
      decoration: InputDecoration(
        labelText: 'Date Cleared',
      ),
      initialValue: transaction.clearedDate,
      initialDate: transaction.clearedDate,
      // initialValue: DateTime.now(),
      // enabled: true,
    );
  }
}

class TransactionFormAmountText extends StatelessWidget {
  const TransactionFormAmountText({
    Key key,
    @required this.amountDollarString,
  }) : super(key: key);

  final String amountDollarString;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'amount',
      decoration: InputDecoration(
        labelText: 'Amount',
      ),
      initialValue: amountDollarString,
      valueTransformer: (text) => num.tryParse(text).toStringAsFixed(2),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.numeric(context),
      ]),
      keyboardType:
          TextInputType.numberWithOptions(signed: false, decimal: true),
    );
  }
}

class TransactionFormDescriptionText extends StatelessWidget {
  const TransactionFormDescriptionText({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
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
    );
  }
}

class TransactionButtonRow extends StatelessWidget {
  const TransactionButtonRow({
    Key key,
    @required GlobalKey<FormBuilderState> formKey,
    @required TransactionController transactionController,
  })  : _formKey = formKey,
        _transactionController = transactionController,
        super(key: key);

  final GlobalKey<FormBuilderState> _formKey;
  final TransactionController _transactionController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TransactionSubmitButton(
              formKey: _formKey, transactionController: _transactionController),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TransactionResetButton(formKey: _formKey),
        ),
      ],
    );
  }
}

class TransactionResetButton extends StatelessWidget {
  const TransactionResetButton({
    Key key,
    @required GlobalKey<FormBuilderState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _formKey;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).accentColor,
      child: Text(
        "Reset",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        _formKey.currentState.reset();
      },
    );
  }
}

class TransactionSubmitButton extends StatelessWidget {
  const TransactionSubmitButton({
    Key key,
    @required GlobalKey<FormBuilderState> formKey,
    @required TransactionController transactionController,
  })  : _formKey = formKey,
        _transactionController = transactionController,
        super(key: key);

  final GlobalKey<FormBuilderState> _formKey;
  final TransactionController _transactionController;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).accentColor,
      child: Text(
        "Submit",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        validateAndSaveTransaction();
        Get.back();
      },
    );
  }

  void validateAndSaveTransaction() {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      Transaction newTransaction = Transaction(
        description: _formKey.currentState.value['description'],
        amount: double.tryParse(_formKey.currentState.value['amount']),
        clearedDate: _formKey.currentState.value['clearedDate'],
      );

      _transactionController.addTransaction(newTransaction);
    }
  }
}
