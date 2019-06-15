import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _barcode = '...';
  Future _scanCode() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        _barcode = barcode;
      });
    } on PlatformException catch(e) {
      print('Platform Exception: ${e.code}');
    } on FormatException catch(e) {
      print('Format Exception: {$e.code}');
    } catch (e) {
      print('Unknow Exception: ${e.code}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text('Scan'),
        onPressed: _scanCode,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Text(_barcode, style: TextStyle(fontSize: 64, color: Colors.lightGreen),),
      ),
    );
  }
}
