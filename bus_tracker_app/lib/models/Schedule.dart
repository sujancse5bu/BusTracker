class Route {
  String startTime;
  int routeId;
  int busId;
  String direction;
  int readableId;

  Route(this.startTime, this.routeId, this.busId, this.direction,
      this.readableId);

  static List<Route> getRoutes() => [
        Route("9:00 AM", 1, 1, "from", 1),
        Route("9:00 AM", 2, 2, "from", 2),
        Route("10:00 AM", 1, 1, "from", 3),
        Route("10:00 AM", 2, 2, "from", 4),
        Route("11:00 AM", 1, 1, "from", 5),
        Route("11:00 AM", 2, 2, "from", 6),
        Route("12:00 PM", 1, 1, "from", 7),
        Route("12:00 PM", 2, 2, "from", 8),
        Route("01:00 PM", 1, 1, "from", 9),
        Route("01:00 PM", 2, 2, "from", 10),
      ];
}
