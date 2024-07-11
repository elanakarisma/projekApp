import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminPage(),
    );
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _selectedIndex = 0;
  late Future<List<dynamic>> _donationListFuture;
  List<dynamic> _donations = [];

  @override
  void initState() {
    super.initState();
    _donationListFuture = _fetchDonationList();
  }

  Future<List<dynamic>> _fetchDonationList() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final url = Uri.parse('http://10.11.9.6:8080/api/donasi/admin');
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _donations = data;
        });
        return data;
      } else {
        print('Failed to load donation list - Status Code: ${response.statusCode}');
        throw Exception('Failed to load donation list');
      }
    } catch (e) {
      print('Error loading donation list: $e');
      throw Exception('Error loading donation list');
    }
  }

  Future<void> _deleteDonation(int donationId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final url = Uri.parse('http://10.11.9.6:8080/api/donasi/$donationId');
    try {
      final response = await http.delete(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Refresh list after deletion
        setState(() {
          _donationListFuture = _fetchDonationList();
        });
      } else {
        print('Failed to delete donation - Status Code: ${response.statusCode}');
        throw Exception('Failed to delete donation');
      }
    } catch (e) {
      print('Error deleting donation: $e');
      throw Exception('Error deleting donation');
    }
  }

  Future<void> _updateDonation(int donationId, String newName, String newPhone, String newAccount, int newAmount) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final url = Uri.parse('http://10.11.9.6:8080/api/donasi/$donationId');
    try {
      final response = await http.put(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'nm_donatur': newName,
          'no_telp': newPhone,
          'rek_donasi': newAccount,
          'jumlah_donasi': newAmount,
          // Other fields to update as needed
        }),
      );

      if (response.statusCode == 200) {
        // Refresh list after update
        setState(() {
          _donationListFuture = _fetchDonationList();
        });
      } else {
        print('Failed to update donation - Status Code: ${response.statusCode}');
        throw Exception('Failed to update donation');
      }
    } catch (e) {
      print('Error updating donation: $e');
      throw Exception('Error updating donation');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showUpdateDialog(dynamic donation) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _accountController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();

    _nameController.text = donation['nm_donatur'];
    _phoneController.text = donation['no_telp'];
    _accountController.text = donation['rek_donasi'];
    _amountController.text = donation['jumlah_donasi'].toString();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Donation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Donatur',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'No Telepon',
              ),
            ),
            TextField(
              controller: _accountController,
              decoration: const InputDecoration(
                labelText: 'Rekening Donasi',
              ),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Jumlah Donasi',
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              String newName = _nameController.text;
              String newPhone = _phoneController.text;
              String newAccount = _accountController.text;
              int newAmount = int.tryParse(_amountController.text) ?? 0;

              await _updateDonation(donation['id'], newName, newPhone, newAccount, newAmount);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showAddDialog() {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _accountController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Donation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Donatur',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'No Telepon',
              ),
            ),
            TextField(
              controller: _accountController,
              decoration: const InputDecoration(
                labelText: 'Rekening Donasi',
              ),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Jumlah Donasi',
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              String newName = _nameController.text;
              String newPhone = _phoneController.text;
              String newAccount = _accountController.text;
              int newAmount = int.tryParse(_amountController.text) ?? 0;

              await _addDonation(newName, newPhone, newAccount, newAmount);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Future<void> _addDonation(String newName, String newPhone, String newAccount, int newAmount) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final url = Uri.parse('http://10.11.9.6:8080/api/donasi');
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'nm_donatur': newName,
          'no_telp': newPhone,
          'rek_donasi': newAccount,
          'jumlah_donasi': newAmount,
          // Other fields as needed
        }),
      );

      if (response.statusCode == 200) {
        // Refresh list after adding donation
        setState(() {
          _donationListFuture = _fetchDonationList();
        });
      } else {
        print('Failed to add donation - Status Code: ${response.statusCode}');
        throw Exception('Failed to add donation');
      }
    } catch (e) {
      print('Error adding donation: $e');
      throw Exception('Error adding donation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _selectedIndex == 0 ? const Text('Admin Dashboard') : const Text('Profile'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Donasi'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profil'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Dashboard'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _selectedIndex == 0
          ? FutureBuilder<List<dynamic>>(
              future: _donationListFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No donation data available.'));
                } else {
                  List<dynamic> donations = snapshot.data!;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: const Text('Nama Donatur')),
                        DataColumn(label: const Text('No Telepon')),
                        DataColumn(label: const Text('Rekening Donasi')),
                        DataColumn(label: const Text('Jumlah Donasi')),
                        DataColumn(label: const Text('Nama Program')),
                        DataColumn(label: const Text('Aksi')),
                      ],
                      rows: donations
                          .map(
                            (donation) => DataRow(
                              cells: [
                                DataCell(Text(donation['nm_donatur'])),
                                DataCell(Text(donation['no_telp'])),
                                DataCell(Text(donation['rek_donasi'])),
                                DataCell(Text('${donation['jumlah_donasi']}')),
                                DataCell(Text(donation['nama_program'])),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          _showUpdateDialog(donation);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () async {
                                          await _deleteDonation(donation['id']);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  );
                }
              },
            )
          : const ProfilePage(),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: _showAddDialog,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page'),
    );
  }
}
