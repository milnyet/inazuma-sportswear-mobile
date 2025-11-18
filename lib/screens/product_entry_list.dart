import 'package:flutter/material.dart';
import 'package:inazuma_sportswear/models/product_entry.dart';
import 'package:inazuma_sportswear/widgets/left_drawer.dart';
import 'package:inazuma_sportswear/screens/product_detail.dart';
import 'package:inazuma_sportswear/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:inazuma_sportswear/screens/product_detail.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool showOnlyMine;
  final bool showFeatured;

  const ProductEntryListPage({super.key, this.showOnlyMine = false, this.showFeatured = false,});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  late bool showOnlyMyProducts;
  late bool showFeatured;

  String selectedFilter = "all";

  @override
  void initState() {
    super.initState();
    showOnlyMyProducts = widget.showOnlyMine;
    showFeatured = widget.showFeatured;

    if (showOnlyMyProducts) selectedFilter = "mine";
    if (showFeatured) selectedFilter = "featured";
  }
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000

    final response = await request.get('https://emilio-junino-inazumasportswear.pbp.cs.ui.ac.id/json/');

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
    String title = "All Products";
    if (selectedFilter == "mine") title = "My Products";
    if (selectedFilter == "featured") title = "Featured Products";
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text(title),
      ),
      drawer: const LeftDrawer(),
      body: Column(
          children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField<String>(
              value: selectedFilter,
              decoration: const InputDecoration(
                labelText: "Filter",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: "all",
                  child: Text("All Products"),
                ),
                DropdownMenuItem(
                  value: "mine",
                  child: Text("My Products"),
                ),
                DropdownMenuItem(
                  value: "featured",
                  child: Text("Featured Products"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedFilter = value!;

                  showOnlyMyProducts = selectedFilter == "mine";
                  showFeatured = selectedFilter == "featured";
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: FutureBuilder(
              future: fetchProduct(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return const Column(
                      children: [
                        Text(
                          'There are no product in football product yet.',
                          style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    List<ProductEntry> products = snapshot.data!;
                    if (showOnlyMyProducts) {
                      final userId = request.jsonData["user_id"];
                      products =
                          products.where((p) => p.userId == userId).toList();
                    }
                    if (showFeatured) {
                      products = products.where((p) => p.isFeatured == true).toList();
                    }
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (_, index) => ProductEntryCard(
                        product: products[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                product: products[index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}