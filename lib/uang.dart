import 'package:flutter/material.dart';

class KonversiMataUangScreen extends StatefulWidget {
  @override
  _KonversiMataUangScreenState createState() => _KonversiMataUangScreenState();
}

class _KonversiMataUangScreenState extends State<KonversiMataUangScreen> {
  final TextEditingController _inputController = TextEditingController();
  double _result = 0;
  String _fromCurrency = 'IDR';
  String _toCurrency = 'USD';

  void _convert() {
    double input = double.tryParse(_inputController.text) ?? 0;
    setState(() {
      if (_fromCurrency == 'IDR' && _toCurrency == 'USD') {
        _result = input / 15000; // Kurs IDR ke USD
      } else if (_fromCurrency == 'USD' && _toCurrency == 'IDR') {
        _result = input * 15000; // Kurs USD ke IDR
      } else if (_fromCurrency == 'IDR' && _toCurrency == 'EUR') {
        _result = input / 17000; // Kurs IDR ke EUR
      } else if (_fromCurrency == 'EUR' && _toCurrency == 'IDR') {
        _result = input * 17000; // Kurs EUR ke IDR
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konversi Mata Uang'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _fromCurrency,
              items: ['IDR', 'USD', 'EUR']
                  .map((currency) => DropdownMenuItem(value: currency, child: Text(currency)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _fromCurrency = value!;
                });
              },
            ),
            DropdownButton<String>(
              value: _toCurrency,
              items: ['IDR', 'USD', 'EUR']
                  .map((currency) => DropdownMenuItem(value: currency, child: Text(currency)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _toCurrency = value!;
                });
              },
            ),
            TextField(
              controller: _inputController,
              decoration: InputDecoration(labelText: 'Masukkan jumlah uang'),
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
