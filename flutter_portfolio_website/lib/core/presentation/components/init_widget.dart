import 'package:flutter/material.dart';

class InitWidget extends StatefulWidget {
  const InitWidget({Key? key}) : super(key: key);

  @override
  State<InitWidget> createState() => _InitWidgetState();
}

class _InitWidgetState extends State<InitWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: const Center(child: Text("INIT", style: TextStyle(fontSize: 72, color: Colors.white))));
  }
}
