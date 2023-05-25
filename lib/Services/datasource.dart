import 'basenetwork.dart';
import 'model.dart';

final BaseNetwork _baseNetwork = BaseNetwork();

class ApiDataSource {
  List<UserData> result = [];
  Future<List<UserData>> getData({String? query }) async {
    final jsonResponse = await _baseNetwork.get('');

    final List<dynamic> data = jsonResponse;

    result = data.map((json) => UserData.fromJson(json)).toList();
    if(query!=null){
      result = result.where((element) => element.name!.toLowerCase().contains(query.toLowerCase())).toList();
    }
    return result;

  }
}