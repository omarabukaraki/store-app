import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    String baseUrl = 'https://fakestoreapi.com';

    // http.Response response =
    //     await http.get(Uri.parse('$baseUrl/products/categories'));
    //  List<dynamic> data = jsonDecode(response.body);

    List<dynamic> data = await Api().get(url: '$baseUrl/products/categories');

    return data;
  }
}
