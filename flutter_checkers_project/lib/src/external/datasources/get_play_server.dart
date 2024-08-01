import 'package:http/http.dart' as http;

class GetNamesServer {
  final client = http.Client();

  // função que se comunica com o servidor
  Future<int> getStart(int player, String color1, String color2) async {
    try {
      final uri = Uri.parse('http://192.168.158.157:5000/game/start/$player/$color1/$color2');
      final request = await http.get(uri);
      return request.statusCode;
    } catch (e) {
      print("Problem connecting to the server ${e.toString()}");
    }
    return 500;
  }
  
}

