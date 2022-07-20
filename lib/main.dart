import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// typedef MathOperation(int number1, int number2);

class _HomeState extends State<Home> {
  final num_1 = TextEditingController();
  final num_2 = TextEditingController();
  int? result, num1, num2;

  final _space = const SizedBox(height: 20.0);

  void doAddition() {
    setState(
      () {
        num1 = int.parse(num_1.text);
        num2 = int.parse(num_2.text);
        result = num1! + num2!;
      },
    );
  }

  void doSubtraction() {
    setState(
      () {
        num1 = int.parse(num_1.text);
        num2 = int.parse(num_2.text);
        result = num1! - num2!;
      },
    );
  }

  void doMultiplication() {
    setState(
      () {
        num1 = int.parse(num_1.text);
        num2 = int.parse(num_2.text);
        result = num1! * num2!;
      },
    );
  }

  void doDivision() {
    setState(
      () {
        num1 = int.parse(num_1.text);
        num2 = int.parse(num_2.text);
        result = num1! ~/ num2!;
      },
    );
  }

  void doClear(){

    setState(() {
      num_1.text = '0';
      num_2.text = '0';
    },);
  }

  Widget _showText(String text, Color color) => Text(
        text,
        style: TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      );

  Widget _showField(String text, TextEditingController controller) =>
      TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
        ),
      );

  Widget _showButton(String sign, Function() onTap) => ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          primary: Colors.deepPurple,
        ),
        child: _showText(sign, Colors.white),
      );

  Widget _groupTextField(
    String textTitle,
    String hintText,
    TextEditingController controller,
  ) =>
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _showText(
            textTitle,
            Colors.black87,
          ),
          const SizedBox(
            height: 5.0,
          ),
          _showField(hintText, controller)
        ],
      );

  Widget rowButtons() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                _showButton('+', () => doAddition()),
                const SizedBox(
                  height: 5.0,
                ),
                _showButton('*', () => doMultiplication()),
              ],
            ),
            Expanded(child: Container()),
            Column(
              children: <Widget>[
                _showButton('-', () => doSubtraction()),
                const SizedBox(
                  height: 5.0,
                ),
                _showButton('/', () => doDivision()),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 10.0,
            ),
            child: Column(
              children: [
                _showText('Calculator', Colors.black87),
                _space,
                _groupTextField('Num1', 'Enter your first number', num_1),
                _space,
                _groupTextField('Num2', 'Enter your second number', num_2),
                _space,
                _showText('Out:\t${result ?? ''}', Colors.black87),
                _space,
                _showButton('Clear', () =>doClear()),
                _space,
                rowButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
