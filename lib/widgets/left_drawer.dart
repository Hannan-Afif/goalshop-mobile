import 'package:flutter/material.dart';
import 'package:goalshop/palette/goalshop_palette.dart';
import 'package:goalshop/screens/menu.dart';
import 'package:goalshop/screens/my_product_entry_list.dart';
import 'package:goalshop/screens/productlist_form.dart';
import 'package:goalshop/screens/product_entry_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: GoalshopPalette.slate800),
            child: Column(
              children: [
                // 2. UPDATED DRAWER TITLE HERE
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Goal',
                        style: TextStyle(color: Colors.cyan[400]), // Goal -> Cyan
                      ),
                      TextSpan(
                        text: 'shop',
                        style: const TextStyle(color: Colors.white), // shop -> White
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                const Text(
                  "Seluruh produk terkini di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white, 
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add Product'),
            // Bagian redirection ke ProductFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductFormPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Product List'),
            onTap: () {
              // Route to product list page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryListPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_checkout),
            title: const Text('My Product List'),
            onTap: () {
              // Route to product list page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyProductEntryListPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
