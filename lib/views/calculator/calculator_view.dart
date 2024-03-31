import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  num x = 0;
  num y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  late final AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _lifecycleListener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onPause: _onPause,
      onInactive: _onInactive,
      onRestart: _onRestart,
      onStateChange: _onStateChanged,
      // onExitRequested: _onExitRequested
    );
  }

  void _onShow() => print("onShow Called");

  void _onHide() => print("onHide Called");

  void _onResume() => print("onResume Called");

  void _onDetach() => print("onDetach Called");

  void _onPause() => print("onPause Called");

  void _onInactive() => print("onInactive Called");

  void _onRestart() => print("onRestart Called");

  void _onStateChanged(AppLifecycleState state) =>
      print("onStateChange Called with State: $state");

  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    _lifecycleListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // Calculator Display
          CalculatorDisplay(
              key: Key("displayOne"),
              hint: "Enter first number",
              controller: displayOneController
          ),

          const SizedBox(height: 30),

          CalculatorDisplay(
              key: Key("displayTwo"),
              hint: "Enter second number",
              controller: displayTwoController
          ),

          const SizedBox(
            height: 30,
          ),

          Text(
              key: const Key("Result"),
              z.toString(),
              style:
                  const TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! +
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.add)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! -
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.minus)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! *
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.multiply)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! /
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.divide)),
            ],
          ),

          SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                // whenever we want to change the state
                // we use setState()
                x = 0;
                y = 0;
                z = 0;

                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            label: Text("Clear"),
          )
          // Expand
          // Calculator Buttons
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;

  const CalculatorDisplay(
      {super.key, this.hint = "Enter a number", required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(16.0)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(16.0)),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black)),
    );
  }
}
