import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Helper/result.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _result = TextEditingController();

  int _value = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1.text = _controller2.text = "0";
  }

  void calculate(BuildContext context) {
    Provider.of<Result>(context, listen: false)
        .calculate(_controller1.text, _controller2.text, _value);
  }

  @override
  Widget build(BuildContext context) {
    _result.text = Provider.of<Result>(context).getResult;
    return Scaffold(
      appBar: AppBar(toolbarHeight: 100, title:const Text("Calculator",style:TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w700,
            letterSpacing: 4) ,),
        centerTitle: true,
        backgroundColor: Colors.black38,
        elevation: 7,
      ),
      backgroundColor: Colors.white12,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100,
                    child: TextField(
                      onChanged: (value) {
                        calculate(context);
                      },
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.4),
                      decoration: const InputDecoration(
                        fillColor: Colors.black38,
                        filled: true,
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      controller: _controller1,
                    )),
                DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    dropdownColor: Colors.white12,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.4),
                    items: const [
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text("+"),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text("-"),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text("*"),
                      ),
                      DropdownMenuItem<int>(
                        value: 4,
                        child: Text("/"),
                      )
                    ],
                    onChanged: (value) {
                      _value = value ?? 1;
                      calculate(context);
                    },
                    value: _value,
                  ),
                ),
                SizedBox(
                    width: 100,
                    child: TextField(
                      onChanged: (value) {
                        calculate(context);
                      },
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.4),
                      decoration: const InputDecoration(
                        fillColor: Colors.black38,
                        filled: true,
                        border: InputBorder.none,
                      ),
                      textDirection: TextDirection.rtl,
                      keyboardType: TextInputType.number,
                      controller: _controller2,
                    )),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                readOnly: true,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.4),
                decoration: const InputDecoration(
                  fillColor: Colors.black38,
                  filled: true,
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                controller: _result,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
