// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:store_app/component/custom_button.dart';
import 'package:store_app/component/custom_text_field.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'Update Product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? title, desc, price, image;
  bool isLodding = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return BlurryModalProgressHUD(
      inAsyncCall: isLodding,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Update Product',
              style: TextStyle(color: Color(0xff274460)),
            )),
        body: SingleChildScrollView(
          child: Column(children: [
            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              icon: Icons.production_quantity_limits,
              hintText: 'Product Name',
            ),
            CustomTextField(
              onChanged: (value) {
                desc = value;
              },
              icon: Icons.description_outlined,
              hintText: 'description',
            ),
            CustomTextField(
              onChanged: (value) {
                price = value;
              },
              icon: Icons.monetization_on_outlined,
              hintText: 'Price',
            ),
            CustomTextField(
              onChanged: (value) {
                image = value;
              },
              icon: Icons.image_outlined,
              hintText: 'image',
            ),
            CustomButton(
              text: 'Update Product',
              onTap: () async {
                isLodding = true;
                setState(() {});
                try {
                  await updateProductMethod(product);
                  print(product.title);
                } catch (e) {
                  print(e.toString());
                }
                isLodding = false;
                setState(() {});
              },
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> updateProductMethod(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: title == null ? product.title : title!,
        price: price ?? product.price.toString(),
        desc: desc ?? product.description,
        image: image ?? product.image,
        category: product.category);
  }
}
