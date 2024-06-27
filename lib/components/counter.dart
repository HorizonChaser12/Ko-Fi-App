import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final int initialValue;
  final Function(int) onCounterChanged;

  const CounterWidget({
    Key? key,
    required this.initialValue,
    required this.onCounterChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    widget.onCounterChanged(_counter);
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    widget.onCounterChanged(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _decrementCounter,
        ),
        Text('$_counter'),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _incrementCounter,
        ),
      ],
    );
  }
}
