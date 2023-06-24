import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  File? _imageFile;
  String? _qrData;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        _imageFile = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void _generateQRCode() async {
    setState(() {
      _qrData = 'Generated QR code data';
    });
  }

  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('Сканировать QR',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                    'Для осуществления операции поднесите сканер к QR-коду или загрузите из галереи',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey)),
                SizedBox(height: 50),
                Center(
                    child: Container(
                  height: 343,
                  width: 343,
                  child: Expanded(
                    flex: 5,
                    child: QRView(
                      cameraFacing: CameraFacing.back,
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated ,
                      formatsAllowed: [BarcodeFormat.qrcode],
                      overlay: QrScannerOverlayShape(
                        borderRadius: 10,
                        borderColor: Colors.red,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: 300,
                      ),
                      overlayMargin: EdgeInsets.zero,
                    ),
                  ),
                )),
                if (_imageFile != null)
                  Image.file(
                    _imageFile!,
                    height: 200,
                  ),
                if (_qrData != null)
                  QrImageView.withQr(
                      qr: QrCode.fromData(
                          data: _qrData!,
                          errorCorrectLevel: QrErrorCorrectLevel.H),
                      size: 200,
                      gapless: false,
                      backgroundColor: Colors.white,
                      embeddedImageStyle:
                          QrEmbeddedImageStyle(size: Size(80, 80))),
                SizedBox(),
                const SizedBox(height: 80),
                ElevatedButton(
                  child: Text('Из галереии',
                      style: TextStyle(color: Colors.white)),
                  onPressed: pickImage,
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(height: 10),
                TextButton(
                  child: Text('Показать мой QR',
                      style: TextStyle(color: Colors.black)),
                  onPressed: _generateQRCode,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}