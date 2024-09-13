import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RealTimeDataPage extends StatefulWidget {
  @override
  _RealTimeDataPageState createState() => _RealTimeDataPageState();
}

class _RealTimeDataPageState extends State<RealTimeDataPage> {
  late Future<Map<String, dynamic>> _priceData;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _priceData = fetchPriceData();
    });
  }

  Future<Map<String, dynamic>> fetchPriceData() async {
    final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load price data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Data'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _fetchData,
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _priceData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              );
            } else if (!snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No data',
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else {
              final price = snapshot.data?['bitcoin']['usd'];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Current Bitcoin Price:',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$${price}',
                      style: TextStyle(fontSize: 48, color: Colors.green),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _fetchData,
                      child: Text('Refresh Data'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
