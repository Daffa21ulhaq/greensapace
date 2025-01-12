import 'package:flutter/material.dart';

class KonversiBeratScreen extends StatefulWidget {
  @override
  _KonversiBeratScreenState createState() => _KonversiBeratScreenState();
}

class _KonversiBeratScreenState extends State<KonversiBeratScreen> {
  final TextEditingController _inputController = TextEditingController();
  double _result = 0;
  String _fromUnit = 'Kilogram';
  String _toUnit = 'Miligram';

  void _convert() {
    double input = double.tryParse(_inputController.text) ?? 0;
    setState(() {
      if (_fromUnit == 'Kilogram' && _toUnit == 'Miligram') {
        _result = input * 1e6;
      } else if (_fromUnit == 'Kilogram' && _toUnit == 'Gram') {
        _result = input * 1000;
      } else if (_fromUnit == 'Gram' && _toUnit == 'Kilogram') {
        _result = input / 1000;
      }
      // Tambahkan konversi lainnya di sini
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konversi Berat'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _fromUnit,
              items: ['Kilogram', 'Hektogram', 'Dekagram', 'Gram', 'Desigram', 'Centigram', 'Miligram']
                  .map((unit) => DropdownMenuItem(value: unit, child: Text(unit)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _fromUnit = value!;
                });
              },
            ),
            DropdownButton<String>(
              value: _toUnit,
              items: ['Kilogram', 'Hektogram', 'Dekagram', 'Gram', 'Desigram', 'Centigram', 'Miligram']
                  .map((unit) => DropdownMenuItem(value: unit, child: Text(unit)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _toUnit = value!;
                });
              },
            ),
            TextField(
              controller: _inputController,
              decoration: InputDecoration(labelText: 'Masukkan berat'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _convert,
              child: const Text('Konversi'),
            ),
            Text('Hasil: $_result'),
          ],
        ),
      ),
    );
  }
}
