import '/models/response_comics.dart';
import 'package:http/http.dart' as http;

Future<List<Comic>> apiComics() async {
  String baseUrl = 'gateway.marvel.com';
  String endPoint = 'v1/public/comics';

  String ts = '1000';
  String apiKey = 'd04ca49b6895ba2222ce4a95ea05dcd5';
  String hash = '899a8bb6f3090b5ba5f06fd75c2cf28b';

  var url = Uri.http(baseUrl, endPoint, {
    'apikey': apiKey,
    'ts': ts,
    'hash': hash,
    "limit": "100",
  });

  final response = await http.get(url);

  if(response.statusCode == 200) {
    final responseComics = responseComicsFromMap(response.body);
    final results = responseComics.data.results;
    return results;
  } else {
    throw Exception('Error al obtener la lista de comics');
  }
}
