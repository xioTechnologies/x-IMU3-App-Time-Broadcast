import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

void main() {
  RawDatagramSocket.bind(InternetAddress.anyIPv4, 9000).then((RawDatagramSocket udpSocket) {
    udpSocket.broadcastEnabled = true;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      final String note = '{"note":"${DateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(DateTime.now()).toString()}"}\n';
      const String blink = '{"blink":null}\n';
      udpSocket.send(utf8.encode(note + blink), InternetAddress("255.255.255.255"), 9000);
    });
  });
}
