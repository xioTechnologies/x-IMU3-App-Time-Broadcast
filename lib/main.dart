import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

void main() {
  RawDatagramSocket.bind(InternetAddress.anyIPv4, 9000).then((RawDatagramSocket udpSocket) {
    udpSocket.broadcastEnabled = true;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      udpSocket.send(utf8.encode('{"colour":"${(timer.tick % 2 == 0) ? "#00FF00" : "#0000FF"}"}\n'), InternetAddress("255.255.255.255"), 9000);
      udpSocket.send(utf8.encode('{"note":"${DateFormat("yyyy-MM-dd HH:mm:ss.SSSS").format(DateTime.now()).toString()}"}\n'), InternetAddress("255.255.255.255"), 9000);
    });
  });
}
