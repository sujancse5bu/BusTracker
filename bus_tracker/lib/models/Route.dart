class Route {
  String destination;
  String sourceLat;
  String sourceLon;
  String destinationLat;
  String destinationLon;
  int readableId;

  Route(this.destination, this.sourceLat, this.sourceLon, this.destinationLat,
      this.destinationLon, this.readableId);

  static List<Route> getRoutes() => [
        Route("Notullabad", "22.659549187597737", "90.36147242726655",
            "22.7133890273175", "90.34955225581942", 1),
        Route("Notun Bazar", "22.659549187597737", "90.36147242726655",
            "22.709637239294317", "90.3624207517168", 2),
        Route("Barishal Club", "22.659549187597737", "90.36147242726655",
            "22.69754014489828", "90.36930638357676", 3),
      ];
}
