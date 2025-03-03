import 'package:bividpharma/model/dtos/common/local_message.dart';
import 'package:bividpharma/objectbox.g.dart';

class LocalMessageService {
  static const int _maxItem = 100 * 4;
  static late Store _store;
  static Store get localStore => _store;

  static Future<Store> initService() async {
    _store = await openStore();
    return Future.value(_store);
  }

  static LocalMessage? _findCloudItem(int cloudId) {
    //
    final box = localStore.box<LocalMessage>();
    final query = box.query(LocalMessage_.cloudId.equals(cloudId)).build();
    final found = query.findFirst();
    return found;
  }

  static int _checkLastIndex() {
    try {
      final box = localStore.box<LocalMessage>();
      final count = box.count();

      if (count >= _maxItem) {
        box.remove(0);
      }
      return box.count();
    } on Exception catch (_) {
      return -1;
    }
  }

  static int addCloudMessage(
      String type, String title, String body, int cloudId) {
    try {
      _checkLastIndex();

      LocalMessage? newItem = _findCloudItem(cloudId);
      newItem ??= LocalMessage(
          docType: type, body: body, title: title, cloudId: cloudId);
      newItem.createDate = DateTime.now();
      final box = localStore.box<LocalMessage>();
      final id = box.put(newItem);
      return id;
    } on Exception catch (_) {
      return -1;
    }
  }

  static int addCloudMessageItem(LocalMessage msg) {
    try {
      _checkLastIndex();

      LocalMessage? newItem = _findCloudItem(msg.cloudId);
      newItem ??= LocalMessage(
          docType: msg.docType,
          body: msg.body,
          title: msg.title,
          imageUrl: msg.imageUrl,
          summaryText: msg.summaryText,
          cloudId: msg.cloudId);
      newItem.createDate = DateTime.now();
      final box = localStore.box<LocalMessage>();
      final id = box.put(newItem, mode: PutMode.insert);
      return id;
    } on Exception catch (_) {
      return -1;
    }
  }

  static int addMessageItem(LocalMessage msg) {
    try {
      _checkLastIndex();

      var newItem =
          LocalMessage(docType: msg.docType, title: msg.title, body: msg.body);
      newItem.id = msg.id;
      newItem.cloudId = msg.cloudId;
      newItem.refData = msg.refData;

      newItem.createDate = DateTime.now();

      final box = localStore.box<LocalMessage>();
      final id = box.put(newItem);
      return id;
    } on Exception catch (_) {
      return -1;
    }
  }

  static int addMessage(String type, String title, String body) {
    try {
      _checkLastIndex();

      var newItem = LocalMessage(docType: type, body: body, title: title);
      newItem.createDate = DateTime.now();

      final box = localStore.box<LocalMessage>();
      final id = box.put(newItem);
      return id;
    } on Exception catch (_) {
      return -1;
    }
  }

  static bool removdeMessage(int id) {
    try {
      final box = localStore.box<LocalMessage>();
      box.remove(id);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  static LocalMessage? readMessage(int id) {
    try {
      final box = localStore.box<LocalMessage>();
      var found = box.get(id);
      return found;
    } on Exception catch (_) {
      return null;
    }
  }

  static List<LocalMessage> readMessageList() {
    try {
      final box = localStore.box<LocalMessage>();
      final qBuilder = box.query();
      qBuilder.order(LocalMessage_.createDate, flags: Order.descending);
      final list = qBuilder.build().find();
      return list;
    } on Exception catch (_) {
      return <LocalMessage>[];
    }
  }

  static List<LocalMessage> readMessageDoctype(String docType) {
    try {
      final box = localStore.box<LocalMessage>();
      // final qBuilder = box.query();
      final qBuilder = box.query(LocalMessage_.docType.equals(docType));
      qBuilder.order(LocalMessage_.createDate, flags: Order.descending);
      final list = qBuilder.build().find();
      return list;
    } on Exception catch (_) {
      return <LocalMessage>[];
    }
  }

  static void clearMessageAll() {
    try {
      final box = localStore.box<LocalMessage>();
      box.removeAll();
    } on Exception catch (_) {
      //
    }
  }

  static int countMessages() {
    try {
      final box = localStore.box<LocalMessage>();
      var iCount = box.count();
      return iCount;
    } on Exception catch (_) {
      return 0;
    }
  }
}
