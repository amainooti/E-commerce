import 'package:ecommerce/components/my_drawer.dart';
import 'package:ecommerce/components/product_tile.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: Text("Shop Page"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 26.0),
            child: GestureDetector(
              onTap: ()=> Navigator.pushNamed(context, "/cart_page"),
                child: Icon(Icons.shopping_cart_outlined)
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
        //  Shop Title,
        //  shop subtitle
        Center(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text("Pick from a selected list of premium products",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.inversePrimary
          ),
          ),
        )),
        //  product list
          SizedBox(
            height: 550,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(15),
                itemCount: products.length,
                itemBuilder: (context, index){
                  //  get each individual item from the shop
                  final product = products[index];
                  //      return as a product tile uI
                  return MyProductTile(product: product);
                }),
          ),
        ],
      )
    );
  }
}
