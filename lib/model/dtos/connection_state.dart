class MyConnectionState {
  HubState _state = HubState.disconnected;

  HubState get state => _state;
  set state(value) => _state = value;
}

enum HubState { connecting, connected, disconnected }
