import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
// import 'package:http/http.dart' as http;

class CategoriesService {
  Future<List<ProductModel>> getAllCategory(
      {required String categoryName}) async {
    String baseUrl = 'https://fakestoreapi.com';
    // http.Response response =
    //     await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));
    // List<dynamic> data = jsonDecode(response.body);

    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: '$baseUrl/products/category/$categoryName');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }

    return productList;
  }
}
