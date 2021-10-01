import 'denuncia.dart';

class Denuncias {
  List<Denuncia> denuncias = [];

  Denuncias({this.denuncias});
  Denuncias.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final denuncia = Denuncia.fromJson(item);
      denuncias.add(denuncia);
    }
  }
}
