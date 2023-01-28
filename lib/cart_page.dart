import 'package:flutter/material.dart';
import 'package:grocery2/Pages/paynow.dart';
import 'package:grocery2/Pages/signout.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle:true,
        title: const Text("My Cart",
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
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(
                children:[
                  const Align(
                    alignment: AlignmentDirectional.topEnd,
                  ),
                ElevatedButton(onPressed:()=>Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignOut();
                  },
                ),
              ),
                child: const Icon(Icons.person,
                  semanticLabel:'SignOut',),
              ),
                const Text("SignOut"),
              ],
              ),

              // list view of cart
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: const EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            leading: Image.asset(
                              value.cartItems[index][2],
                              height: 36,
                            ),
                            title: Text(
                              value.cartItems[index][0],
                              style: const TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(
                              '\$' + value.cartItems[index][1],
                              style: const TextStyle(fontSize: 12),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemFromCart(index),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // total amount + pay now

              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(color: Colors.green[200]),
                          ),

                          const SizedBox(height: 8),
                          // total price
                          Text(
                            '\$${value.calculateTotal()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // pay now
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade200),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ElevatedButton(onPressed: ()=> Navigator.push(context,
                                           MaterialPageRoute(
                                           builder: (context) {
                                            return const PayNow();},),
                                            ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text('Pay Now',
                                style: TextStyle(color: Colors.white),
                            ),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}