import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyProductTile extends StatefulWidget {
  final Product product;
  const MyProductTile({Key? key, required this.product}) : super(key: key);

  @override
  State<MyProductTile> createState() => _MyProductTileState();
}

class _MyProductTileState extends State<MyProductTile> {
  void addToCart(BuildContext context){
  //  Show a dialog box to show the user to confirm to add to cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Add this Item to your cart?"),
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
                  context.read<Shop>().addToCart(widget.product);
                },
                child: Text("Yes"),
            )
          ],
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    //check if the length is greater than 50 cut it off
    var descText = widget.product.description;
    bool conditionDesc = descText.length > 100;
    var renderedIfTrue = conditionDesc ? descText.substring(0, 100) : descText;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
        //  Product Image
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                child: Image.network(
                    widget.product.imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12)
                ),
                padding: EdgeInsets.all(25),
                width: double.infinity,

              ),
            ),
            const SizedBox(height: 25,),
            //  Product name
            Text(
              widget.product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10,),

            //  Product description
            Text(renderedIfTrue),
            //  Product  Price + add to cart button
            const SizedBox(height: 8,),
          ],
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( "\$ "+ widget.product.price.toStringAsFixed(2)),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: IconButton(onPressed: ()=> addToCart(context),
                    icon: Icon(Icons.add)
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
