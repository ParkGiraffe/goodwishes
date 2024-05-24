import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.callback});
  final Function callback;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.zero,
        ),
      ),
      onPressed: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );
        if (selectedDate != null) {
          setState(() {
            date = selectedDate;
          });
          widget.callback(date);
        }
      },
      child: Text(
        "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    );
  }
}
