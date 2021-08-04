import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      title: 'Add App',
      home: Sum(),
    )
);

class Sum extends StatefulWidget {
  const Sum({Key? key}) : super(key: key);

  @override
  _SumState createState() => _SumState();
}

class _SumState extends State<Sum> {
  final formKey = GlobalKey<FormState>();
  late int num1, num2;
  String total = '';

  setNum1(val) => setState(() => num1 = val);
  setNum2(val) => setState(() => num2 = val);

  validate(value, setter) {
    if (value == null || value.isEmpty) return 'Invalid Input';

    final n = int.tryParse(value);

    if (n == null) return 'Must be an integer!';

    setter(n);

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.add),
            ),
            Text('Add App'),
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Flexible(
                            child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: TextFormField(
                            validator: (value) => validate(value, setNum1),
                            decoration: InputDecoration(
                              labelText: 'Valor 1',
                            ),
                          ),
                        )),
                        Flexible(
                          child: TextFormField(
                            validator: (value) => validate(value, setNum2),
                            decoration: InputDecoration(labelText: 'Valor 2'),
                          ),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() => total = '${num1 + num2}');
                    }
                  }, child: Text('Sum!')),
                  Padding(padding: EdgeInsets.only(top: 50), child: Text(total),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
