import 'package:flutter/material.dart';
import 'package:goalshop/models/product_entry.dart';
import 'package:goalshop/widgets/left_drawer.dart';
import 'package:goalshop/screens/product_detail.dart';
import 'package:goalshop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyProductEntryListPage extends StatefulWidget {
  const MyProductEntryListPage({super.key});

  @override
  State<MyProductEntryListPage> createState() => _MyProductEntryListPageState();
}

class _MyProductEntryListPageState extends State<MyProductEntryListPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000

    final response = await request.get('http://localhost:8000/my-json/');

    // Decode response to json format
    var data = response;

    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: const Text('Product Entry List')),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data!.isEmpty) {
              return const Column(
                children: [
                  Text(
                    'There are no product in goalshop yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder:
                    (_, index) => ProductEntryCard(
                      product: snapshot.data![index],
                      onTap: () {
                        // Navigate to product detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    ProductDetailPage(product: snapshot.data![index]),
                          ),
                        );
                      },
                    ),
              );
            }
          }
        },
      ),
    );
  }
}
