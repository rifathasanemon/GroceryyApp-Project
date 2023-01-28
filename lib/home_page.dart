import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';
import 'cart_page.dart';
import 'grocery_item_tile.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: const Text("Welcome to Fresh Grocer",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green[600],
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CartPage();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag,
          semanticLabel:'Bag',),
      ) ,

      body: SafeArea(

        child: Column(
          children:  [
            const SizedBox(height: 6),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Lets order fresh items for you",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),


            const SizedBox(height: 4),


            const Divider(
              thickness: 4,
            ),


            const SizedBox(height: 4),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Fresh Items",
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),


            Expanded(
              child: Consumer<CartModel>(builder: (context,value,child){
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,
                    childAspectRatio: 1/1.3,
                  ),
                  itemBuilder: (context,index){
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  },
                );
              },),
            )

          ],
        ),
      ),
    );
  }
}