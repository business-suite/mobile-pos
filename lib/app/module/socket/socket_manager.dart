import 'dart:async';
import 'dart:convert';
import 'dart:math';


/*class SocketManager {
  static final SocketManager _instance = new SocketManager._internal();
  StreamController<String> streamController =  StreamController.broadcast(sync: true);

  factory SocketManager() {
    return _instance;
  }

  SocketManager._internal() {
    connect();
  }

  UserSharePref _userSharePref = getIt<UserSharePref>();
  WebsocketManager? socket; //initialize a websocket channel
  int reconnectionAttempts = 0;
  SocketState socketState = SocketState.CLOSED;

  WebsocketManager? _init() {
    var token = _userSharePref.getAppToken();
    if (token.isNotEmpty && socket == null) {
      socketState = SocketState.CLOSED;
      Random r = new Random();
      String key = base64.encode(List<int>.generate(8, (_) => r.nextInt(255)));
      print("Token Socket: ${token}");
      return WebsocketManager(
        SOCKET_SERVER_URL,
        {
        *//*  'Connection': 'Upgrade',
          'Sec-Websocket-Version': '13',
          'Sec-Websocket-Key': key,
          'Upgrade': 'websocket',*//*
          'X-APP-TOKEN': token,
        },
      );
    }
  }

  connect() async {
    try {
      if (socketState != SocketState.OPEN || socket == null) {
        socket = _init();
      }
      print("conecting...");
      socketState = SocketState.OPENING;
      socket?.connect();
      socketState = SocketState.OPEN;
      print("Socket has been opened successfully.");
    } catch (error) {
      print("Error! Socket connection fail, try to reconnect. " + e.toString());
      reconnect();
    }

*//*channel!.stream.listen(
      (streamData) {
        streamController.add(
            streamData); //pass a function to use the recieved JSON data and parse it
      },
      onDone: () {
        print("Conecting aborted");
        _reconnect();
      },
      onError: (error) {
        streamController.addError(error);
        print('Socket connection fail, try to reconnect. $error');
        _reconnect();
      },
    );*//*
  }

  resetSocket() {
    if (socket != null) {
      socket?.close();
      socket = null;
    }
  }

  reconnect() async {
    if (socketState != SocketState.CONNECT_ERROR) return;
    socketState = SocketState.RECONNECT_ATTEMPT;
    //reset
    resetSocket();
    //calculate delay time
    var collision = min(reconnectionAttempts, NUMBER_RETRY_CONNECT_SOCKET);
    var delayTime = ((pow(2, collision) - 1) / 2).round() * 1000;
    //start new connect
    if (reconnectionAttempts >= NUMBER_RETRY_CONNECT_SOCKET) {
      print('Socket has been start new connect.');
      reconnectionAttempts = -1;
      delayTime = DELAY_CONNECT_SOCKET;
    }
    Future.delayed(Duration(milliseconds: delayTime), () {
      socketState = SocketState.RECONNECTING;
      reconnectionAttempts++;
      connect();
    });
  }

  disconnect() async {
    resetSocket();
    socketState = SocketState.CLOSED;
    print("Socket has been disconnected");
  }

  void send(String event, dynamic data) async {
    if (socket != null && socketState == SocketState.OPEN) {
      final map = Map<String, dynamic>();
      map.putIfAbsent(KEY_ACTION_SOCKET, () => event);
      map.putIfAbsent(KEY_DATA_SOCKET, () => data ?? "");
      print("Send:  ${json.encode(map)}");
      socket?.send(json.encode(map).toString());
    }
  }

  void _onReceiveChatMessage(dynamic message) {
    print("Receive message from Websocket: " + message);
    ReceiveSocketHandle(data: message).handleData();
  }
}*/
