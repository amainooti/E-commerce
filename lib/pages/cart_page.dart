import 'package:ecommerce/components/my_botton.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  void removeItemFromCart(BuildContext context, Product product){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("remove Item from your cart?"),
          actions: [
            MaterialButton(
              // when the cancel is clicked pop the box
              onPressed: ()=> Navigator.pop(context),
              child: Text("Cancel"),
            ),
            MaterialButton(
              //pop the box
              onPressed:() {
                Navigator.pop(context);
                context.read<Shop>().removeFromCart(product);
              },
              child: Text("Yes"),
            )
          ],
        )
    );
  }

  void payButtonPressed(BuildContext context, List<Product> cart){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: cart.isEmpty
              ? Text("Sorry you have nothing in your cart")
              : Text("User wants to pay connect this to your backend."),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
        //  cart list
          Expanded(

              child: cart.isEmpty ? Center(child: Text("Your Cart is empty"))
                  : ListView.builder(
                itemCount: cart.length,
                  itemBuilder: (context, index){
                  final item = cart[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: ()=> removeItemFromCart(context, item),
                  ),
                );
              }
              )
          ),

        //  pay button
          MyButton(child: Text("Pay Now"), onTap: ()=> payButtonPressed(context, cart))
        ],
      ),
    );
  }
}
