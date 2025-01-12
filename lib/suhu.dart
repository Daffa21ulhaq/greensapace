import 'package:flutter/material.dart';

class KonversiSuhuScreen extends StatefulWidget {
  @override
  _KonversiSuhuScreenState createState() => _KonversiSuhuScreenState();
}

class _KonversiSuhuScreenState extends State<KonversiSuhuScreen> {
  final TextEditingController _inputController = TextEditingController();
  double _result = 0;
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';

  void _convert() {
    double input = double.tryParse(_inputController.text) ?? 0;
    setState(() {
      if (_fromUnit == _toUnit) {
        _result = input;
      } else if (_fromUnit == 'Celsius' && _toUnit == 'Fahrenheit') {
        _result = (input * 9 / 5) + 32;
      } else if (_fromUnit == 'Celsius' && _toUnit == 'Kelvin') {
        _result = input + 273.15;
      } else if (_fromUnit == 'Celsius' && _toUnit == 'Reamur') {
        _result = input * 4 / 5;
      } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Celsius') {
        _result = (input - 32) * 5 / 9;
      } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Kelvin') {
        _result = (input - 32) * 5 / 9 + 273.15;
      } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Reamur') {
        _result = (input - 32) * 4 / 9;
      } else if (_fromUnit == 'Kelvin' && _toUnit == 'Celsius') {
        _result = input - 273.15;
      } else if (_fromUnit == 'Kelvin' && _toUnit == 'Fahrenheit') {
        _result = (input - 273.15) * 9 / 5 + 32;
      } else if (_fromUnit == 'Kelvin' && _toUnit == 'Reamur') {
        _result = (input - 273.15) * 4 / 5;
      } else if (_fromUnit == 'Reamur' && _toUnit == 'Celsius') {
        _result = input * 5 / 4;
      } else if (_fromUnit == 'Reamur' && _toUnit == 'Fahrenheit') {
        _result = (input * 9 / 4) + 32;
      } else if (_fromUnit == 'Reamur' && _toUnit == 'Kelvin') {
        _result = (input * 5 / 4) + 273.15;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konversi Suhu'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _fromUnit,
              items: ['Celsius', 'Kelvin', 'Fahrenheit', 'Reamur']
                  .map((unit) => DropdownMenuItem(value: unit, child: Text(unit)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _fromUnit = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _toUnit,
              items: ['Celsius', 'Kelvin', 'Fahrenheit', 'Reamur']
                  .map((unit) => DropdownMenuItem(value: unit, child: Text(unit)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _toUnit = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(
                labelText: 'Masukkan suhu',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convert,
              child: const Text('Konversi'),
            ),
            const SizedBox(height: 16),
            Text(
              'Hasil: $_result $_toUnit',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
