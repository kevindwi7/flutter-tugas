import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tess/models/models.dart';
import 'package:tess/ui/pages/pages.dart';

class ProductCard extends StatelessWidget {
  final Products product;
  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EditProduct(product: product);
                  },
                  settings: RouteSettings(arguments: product),
                ));
          },
          title: Text(product.name, style: TextStyle(fontSize: 20)),
          subtitle: Text(NumberFormat.currency(
                  locale: 'id', symbol: 'Rp ', decimalDigits: 3)
              .format(double.tryParse(product.price))),
          leading: Container(
            width: 68,
            height: 68,
            child: CircleAvatar(
              backgroundColor: Colors.blue[100],
              backgroundImage: NetworkImage(product.image, scale: 40),
            ),
          ),
          //isThreeLine: true,
          trailing: Icon(Icons.remove_red_eye),
        ));
  }
}
