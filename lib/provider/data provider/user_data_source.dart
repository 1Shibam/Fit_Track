import 'package:be_fit/model/user_data_model.dart';
import 'package:sqflite/sqflite.dart';

class UserDataSource {
  final Database database;
  UserDataSource(this.database);

  //getUserData

  Future<UserDataModel> getData() async {
    final maps = await database.query('fitTrack');
    return maps.map((data)=> UserDataModel.fromMap(data)).first;
  }

  //update data
  Future<int> updateData(UserDataModel user) async {
  return await database.update(
    'fitTrack',
    user.toMap(),
    where: null, // No WHERE condition since there's only one row
  );
}

}
