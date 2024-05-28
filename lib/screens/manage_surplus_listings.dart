import 'package:flutter/material.dart';

class ManageSurplusListings extends StatefulWidget {
  @override
  _ManageSurplusListingsState createState() => _ManageSurplusListingsState();
}

class _ManageSurplusListingsState extends State<ManageSurplusListings> {
  List<Map<String, dynamic>> surplusFoodItems = [
    {"id": 1, "type": "Bread", "quantity": 10},
    {"id": 2, "type": "Rice", "quantity": 20},
    {"id": 3, "type": "Fruits", "quantity": 30},
  ];

  void _editListing(int id) {
    print('Edit listing with id: $id');
  }

  void _deleteListing(int id) {
    setState(() {
      surplusFoodItems.removeWhere((item) => item["id"] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Surplus Listings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: surplusFoodItems.length,
          itemBuilder: (context, index) {
            final item = surplusFoodItems[index];
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(
                  '${item["type"]}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Quantity: ${item["quantity"]}',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _editListing(item["id"]),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteListing(item["id"]),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
