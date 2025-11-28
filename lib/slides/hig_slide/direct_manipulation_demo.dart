import 'package:flutter/cupertino.dart';

class DirectManipulationDemo extends StatefulWidget {
  const DirectManipulationDemo({super.key});

  @override
  State<DirectManipulationDemo> createState() => _DirectManipulationDemoState();
}

class _DirectManipulationDemoState extends State<DirectManipulationDemo> {
  double _value = 0.5;
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoSlider(
          value: _value,
          onChanged: (value) => setState(() => _value = value),
        ),
        const SizedBox(height: 16),
        CupertinoSwitch(
          value: _switchValue,
          onChanged: (value) => setState(() => _switchValue = value),
        ),
      ],
    );
  }
}
