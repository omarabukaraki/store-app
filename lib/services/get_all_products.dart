import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProduct() async {
    String baseUrl = 'https://fakestoreapi.com';
    // http.Response response = await http.get(Uri.parse('$baseUrl/products'));
    //List<dynamic> data  = jsonDecode(response.body);
    List<dynamic> data = await Api().get(url: '$baseUrl/products');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }

    return productList;
  }
}
