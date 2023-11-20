import 'dart:convert';

import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

const String binnanceUrl = 'wss://stream.binance.com:9443/ws/btcusdt@trade';

class SocketController extends GetxController {
  var btcPrice = '0'.obs;
  final channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/btcusdt@trade');
  var data = ''.obs;
  startConnection() {
    channel.stream.listen((event) {
      Map getData = json.decode(event);
      String btc = getData['p'];
      btcPrice.value = btc;
    });
  }

  @override
  void onInit() {
    startConnection();
    data = btcPrice;
    super.onInit();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
