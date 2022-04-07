import 'package:flutter/material.dart';

class StandartDropdown extends StatefulWidget {
  const StandartDropdown({Key? key}) : super(key: key);

  @override
  State<StandartDropdown> createState() => _StandartDropdownState();
}

class _StandartDropdownState extends State<StandartDropdown> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'One';
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: DropdownButton(
        value: dropdownValue,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down_outlined),
        elevation: 16,
        style: TextStyle(color: Colors.grey),
        underline: SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
