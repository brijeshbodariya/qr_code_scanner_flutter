import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        elevation: 0.1, // Check Platform if android
        backgroundColor: const Color(0xFFF6F8FA),
        title: const Center(
          child: Text(
            'QR SCAN',
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QrCodePage(),
              ));
        },
        child: const Text("Scan Code"),
      ),
    );
  }
}

class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  final GlobalKey qrCodeKey = GlobalKey();

  QRViewController? qrViewController;

  String _content = '';

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrCodeKey,
      onQRViewCreated: (controller) {
        qrViewController = controller;
        controller.scannedDataStream.listen((event) {
          print('Event code --> ${event.code}');
          _content = event.code!;
          print('Event format --> ${event.format}');
          print('Event rawBytes --> ${event.rawBytes}');
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(event.code!)));
        });
      },
    );
  }
}
