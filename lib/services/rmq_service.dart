import 'package:dart_amqp/dart_amqp.dart';

class RmqService{
  late Client client;


  bool checkCredential = false;
  void checkCredentialRmq(String user, String pass, String vHost) async{
    ConnectionSettings settings = ConnectionSettings(
        host: 'rmq2.pptik.id',
        authProvider: PlainAuthenticator(user, pass),
        virtualHost: vHost
    );
    client = Client(settings: settings);
    client.channel().then((Channel channel) {
      return channel.queue("Sensor", durable: true);
    }).then((Queue queue){
      client.close();
    });
  }

  void publish(String message, String host, String user, String pass, String vHost, String queues) {
      ConnectionSettings settings = ConnectionSettings(
          host: host,
          authProvider: PlainAuthenticator(user, pass),
          virtualHost: vHost
      );
      client = Client(settings: settings);
      client.channel().then((Channel channel) async {
        return channel.queue(queues, durable: true);
      }).then((Queue queue){
        queue.publish(message);
        client.close();
      });

  }

  void subscribe(Function sensor, String host, String user, String pass, String vHost){
    ConnectionSettings settings = ConnectionSettings(
        host: host,
        authProvider: PlainAuthenticator(user, pass),
        virtualHost: vHost
    );
    client = Client(settings: settings);
    //print("Subscribe Data RMQ Success");
    print('baca user RMQ $user');
    client.connect().then((value) {
      print('[Subscribe Data] $settings');
      //actuator();
      sensor();
    });
  }

  void dataDevice(String queueRmq, Function value){
    client
        .channel()
        .then((Channel channel) => channel.queue(queueRmq, durable: true))
        .then((Queue queue) => queue.consume())
        .then((Consumer consumer) => consumer.listen((AmqpMessage message){
      value(message.payloadAsString);
    }));
  }
}