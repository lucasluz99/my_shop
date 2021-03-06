import 'package:flutter/material.dart';
import 'package:my_shop/components/app_drawer.dart';
import 'package:my_shop/components/product_edit_item.dart';
import 'package:my_shop/providers/products.dart';
import 'package:provider/provider.dart';

import '../routes.dart';

class ProductsPage extends StatelessWidget {
  GlobalKey _scaffold = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      key: _scaffold,
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('Produtos'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.PRODUCTS_FORM);
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: RefreshIndicator(
          
            onRefresh: () => products.loadProducts() ,
                  child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(itemCount: products.getLenght,itemBuilder: (_, i) {
              return Column(
                children: [
                  ProductEditItem(product:products.products[i],scaffoldkey: _scaffold),
                  Divider(),
                ],
              );
            }),
          ),
        ));
  }
}
