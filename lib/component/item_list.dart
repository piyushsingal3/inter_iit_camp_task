import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class Dat {
  final String name;
  final int id;
  final String email;
  

  const Dat({
    required this.name,
    required this.id,
    required this.email,
    
  });

  factory Dat.fromJson(Map<String, dynamic> json) {
    return Dat(
      name: json['name'] as String,
      id: json['id'] as int  ,
      email:json['email'] as String,
       );
  }
}

class _ItemListPageState extends State<ItemListPage> {
  List<Dat> items = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final response = await http.get(Uri.parse('https://fakerapi.it/api/v1/companies?_seed=12456'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['data']; // Adjust according to actual API response
      setState(() {
        items = results.map((json) => Dat.fromJson(json as Map<String, dynamic>)).toList();
      });
    } else {
      throw Exception('Failed to load items');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data fetched through Api')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name,style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),),
              subtitle:Text(items[index].email),
            

          );
        },
      ),
    );
  }
}


  