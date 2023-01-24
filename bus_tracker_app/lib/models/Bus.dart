class Bus {
  String title;
  String lat;
  String lon;
  int readableId;

  Bus(this.title, this.lat, this.lon, this.readableId);

  static List<Bus> getBusses() => [
        Bus("Payra", "22.697711453882913", "90.35350561733077", 1),
        Bus("BRTC 1", "22.69094684825694", "90.35521872898606", 2),
      ];
}
