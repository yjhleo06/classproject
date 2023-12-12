import 'package:mongo_dart/mongo_dart.dart';

const MONGO_CONN_URL = "mongodb+srv://yjhleo06:yjh112233.@cluster0.9imns9y.mongodb.net/"; //링크
const USER_COLLECTION = "TestDB"; //collection 이름



class BarcodeDatabase {
  static Future<void> insertBarcode(String barcodeValue, String studentId) async {
  final db = await Db.create(MONGO_CONN_URL);
  await db.open();
  final barcodeCollection = db.collection(USER_COLLECTION);

  final barcodeData = {
  'barcodeValue': barcodeValue,
  '학번': studentId,
  };

  await barcodeCollection.insert(barcodeData);

  await db.close();
  }

  static Future<String?> getBarcodeBystudentId(String studentId) async {
  final db = await Db.create(MONGO_CONN_URL);
  await db.open();
  final barcodeCollection = db.collection(USER_COLLECTION);

  final query = where.eq('학번',studentId);
  final barcodeData = await barcodeCollection.findOne(query);

  await db.close();

  if (barcodeData != null) {
  return barcodeData['barcodeValue'] as String?;
  } else {
  return null;
  }
  }
}
