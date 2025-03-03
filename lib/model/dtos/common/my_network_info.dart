class MyNetworkInfo {
  MyNetworkInfo(
      {this.wifiName = '',
      this.wifiBSSID = '',
      this.wifiIP = '',
      this.wifiBroadcast = '',
      this.wifiGateway = '',
      this.wifiIPv6 = '',
      this.wifiSubmask = ''});
  late String wifiName;
  late String wifiBSSID;
  late String wifiIP;
  late String wifiIPv6;
  late String wifiSubmask;
  late String wifiBroadcast;
  late String wifiGateway;
}
