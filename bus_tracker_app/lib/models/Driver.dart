class Driver {
  String name;
  int busId;
  int readableId;

  Driver(this.name, this.busId, this.readableId);

  static List<Driver> getDrivers() => [
        Driver("Driver 1", 1, 1),
        Driver("Driver 2", 2, 2),
      ];
}
