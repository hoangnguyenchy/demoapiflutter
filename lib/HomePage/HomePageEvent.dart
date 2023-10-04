abstract class HomePageEvent {
  final String endpoint;

  HomePageEvent(this.endpoint);
}

class FetchDataEvent extends HomePageEvent {
  FetchDataEvent(String endpoint) : super(endpoint);
}