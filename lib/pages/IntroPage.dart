import 'package:ecommerce/components/my_botton.dart';
import 'package:flutter/material.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text('Intro Page', style: TextStyle(
            color: Colors.black
          ),),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //  logo
            Icon(
                Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25,),
          //  title

            const Text("Minimal Shop", style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 10,),
            //subtitle
            Text("Premium Quality Products", style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
            ),),
            const SizedBox(height: 10,),
            //  button
            MyButton(child: Icon(Icons.arrow_forward), onTap: (){
              Navigator.pushNamed(context, "/shop_page");
            })
          ],
        ),
      ),
    );
  }
}
