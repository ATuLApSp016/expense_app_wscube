import 'package:expense_app_wscube/data/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  ///create a singleton
  AppDatabase._();

  ///accessing the app DB class object
  static final AppDatabase dbhelper = AppDatabase._();

  ///
  /// create a user database table............

  ///creating global static table UserName and UserFields
  static const String USER_TABLE = 'user';
  static const String USER_ID = 'uid';
  static const String USER_NAME = 'uName';
  static const String USER_EMAIL = 'uEmail';
  static const String USER_NUMBER = "uNumber";
  static const String USER_PASSWORD = 'uPassword';

  ///creating global static table ExpenseName and ExpenseFields
  static const String EXPENIO_TABLE = 'expenio';
  static const String EXPENIO_ID = 'eId';
  static const String EXPENIO_TITLE = 'eTitle';
  static const String EXPENIO_DESC = 'eDesc';
  static const String EXPENIO_TIMESPAND = "eTimeSpend";
  static const String EXPENIO_AMOUNT = 'eAmount';
  static const String EXPENIO_BALANCE = 'eBalance';
  static const String EXPENIO_TYPE = 'eType';
  static const String EXPENIO_CATID = 'catId';
  static const String EXPENIO_UID = 'uid';
  static const String EXPENIO_FORIEGNKEY = "foriegnkey";

  ///creating global static table CategoryName and CategoryFields
  static const String CATEGORY_TABLE = 'category';
  static const String CATEGORY_ID = 'catId';
  static const String CATEGORY_IMG = 'catImg';
  static const String CATEGORY_NAME = 'catName';

  Database? myDB;

  Future<Database> getDB() async {
    if (myDB != null) {
      return myDB!;
    } else {
      myDB = await initDB();
      return myDB!;
    }
  }

  Future<Database> initDB() async {
    var rootPath = await getApplicationDocumentsDirectory();
    var actualPath = join(rootPath.path, 'expenseBD.db');

    return await openDatabase(actualPath, version: 1,
        onCreate: (expenseDb, version) {
      expenseDb.execute(
          "create table $USER_TABLE ( $USER_ID integer primary key autoincrement, $USER_NAME text, $USER_EMAIL text, $USER_NUMBER text, $USER_PASSWORD text,)");
      expenseDb.execute(
          "create table $EXPENIO_TABLE ( $EXPENIO_ID integer primary key autoincrement, $EXPENIO_TITLE text, $EXPENIO_DESC text, $EXPENIO_TIMESPAND text, $EXPENIO_AMOUNT text, $EXPENIO_BALANCE text, $EXPENIO_TYPE text, $EXPENIO_CATID integer, $EXPENIO_UID integer, $EXPENIO_FORIEGNKEY integer,)");
      expenseDb.execute(
          "create table $CATEGORY_TABLE ( $CATEGORY_ID integer primary key autoincrement, $CATEGORY_IMG text, $CATEGORY_NAME text,)");
    });
  }

  /// insert data
  void addUser({required UserModel newUser}) async {
    var db = await getDB();
    db.insert(USER_TABLE, newUser.toMap());
  }

  /// fetch data
  Future<List<UserModel>> fetchAllNotes() async {
    var userdb = await getDB();
    var userdata = await userdb.query(USER_TABLE);

    List<UserModel> userData = [];

    for (Map<String, dynamic> eachMap in userdata) {
      var eachModel = UserModel.fromMap(eachMap);
      userData.add(eachModel);
    }
    return userData;
  }

}

/*


///
/// create a expenio database table............

Database? expenioDatabase;

Future<Database> getExpenioDB() async {
  if (expenioDatabase != null) {
    return expenioDatabase!;
  } else {
    expenioDatabase = await initDB();
    return expenioDatabase!;
  }
}

Future<Database> initExpenioDB() async {
  var expenioRootPath = await getApplicationDocumentsDirectory();
  var expenioActualPath = join(expenioRootPath.path, 'expenioDB.db');

  return await openDatabase(expenioActualPath, version: 1,
      onCreate: (expeniodb, version) {
        expeniodb.execute(
            "create table $EXPENIO_TABLE ( eId integer primary key autoincrement, eTitle text, eDesc text, eTimeSpend text, eAmount text, eBalance text, eType text, catId integer, uid integer, foriegnkey integer,)");
      });
}

///
/// create a catgory database table............

Database? categoryDatabase;

Future<Database> getCategoryDB() async {
  if (categoryDatabase != null) {
    return categoryDatabase!;
  } else {
    categoryDatabase = await initCategoryDB();
    return categoryDatabase!;
  }
}

Future<Database> initCategoryDB() async {
  var categoryRootPath = await getApplicationDocumentsDirectory();
  var categoryActualPath = join(categoryRootPath.path, 'categoryDB.db');

  return await openDatabase(categoryActualPath, version: 1,
      onCreate: (categorydb, version) {
        categorydb.execute(
            "create table $CATEGORY_TABLE ( $CATEGORY_ID integer primary key autoincrement, $CATEGORY_IMG text, $CATEGORY_NAME text,)");
      });
}*/
