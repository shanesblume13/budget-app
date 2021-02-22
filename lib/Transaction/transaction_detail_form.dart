import 'package:budget/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cfs;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TransactionDetailForm extends StatefulWidget {
  final Transaction transaction;
  final BuildContext context;

  TransactionDetailForm({
    Key key,
    @required this.context,
    @required this.transaction,
  }) : super(key: key);

  @override
  _TransactionDetailFormState createState() => _TransactionDetailFormState();
}

class _TransactionDetailFormState extends State<TransactionDetailForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic _transaction = widget.transaction;

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: Center(
        child: FormBuilder(
          key: _fbKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: <Widget>[
              new FormBuilderTextField(
                name: 'category',
                decoration: InputDecoration(labelText: 'Category*'),
                initialValue: widget.transaction.category,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.minLength(context, 1),
                  FormBuilderValidators.maxLength(context, 50),
                ]),
              ),
              new FormBuilderTextField(
                name: 'description',
                decoration: InputDecoration(labelText: 'Description*'),
                initialValue: widget.transaction.description,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.minLength(context, 1),
                  FormBuilderValidators.maxLength(context, 50),
                ]),
              ),
              new FormBuilderTextField(
                name: 'account',
                decoration: InputDecoration(labelText: 'Account*'),
                initialValue: widget.transaction.account,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.minLength(context, 1),
                  FormBuilderValidators.maxLength(context, 50),
                ]),
              ),
              new FormBuilderTextField(
                name: 'amount',
                keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                decoration: InputDecoration(labelText: 'Amount*'),
                initialValue: widget.transaction.amount.toString(),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.numeric(context),
                ]),
              ),
              new FormBuilderDateTimePicker(
                name: 'date',
                inputType: InputType.date,
                decoration: InputDecoration(
                  labelText: 'Date Cleared',
                  helperText: 'Leave date empty if transaction is pending'
                ),
                initialDate: widget.transaction.date,
              ),
              FlatButton(
                child: Text('Update'),
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_fbKey.currentState.saveAndValidate()) {
      cfs.FirebaseFirestore.instance
          .collection('transactions')
          .doc(widget.transaction.reference.id)
          .update({
            'category': _fbKey.currentState.value['category'],
            'description': _fbKey.currentState.value['description'],
            'account': _fbKey.currentState.value['account'],
            'amount': double.tryParse(_fbKey.currentState.value['amount']) ?? widget.transaction.amount,
            'date': _fbKey.currentState.value['date'],
          })
          .then((_) => Navigator.pop(context))
          .catchError((error) => print(error));
    }
  }
}
