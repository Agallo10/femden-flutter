import 'package:femden/widgets/boton_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget();
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime date;

  String getText() {
    if (date == null) {
      return 'Fecha de nacimiento';
    } else {
      return DateFormat('MM/dd/yyyy').format(date);
      // return '${date.month}/${date.day}/${date.year}';

    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: '',
        text: getText(),
        onClicked: () => pickDate(context),
        color: Colors.white,
        colorTexto: Colors.black.withOpacity(0.5),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 80),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }
}
