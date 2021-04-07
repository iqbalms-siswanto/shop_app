import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

import '../../../app_theme.dart';
import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
        child: Container(
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: AppTheme.grey.withOpacity(0.2),
                    offset: Offset(1.1, 1.1),
                    blurRadius: 10.0),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(kDefaultPaddin),
                      // For  demo we use fixed height  and width
                      // Now we dont need them
                      // height: 180,
                      // width: 160,
                      decoration: BoxDecoration(
                        color: product.color,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Hero(
                        tag: "${product.id}",
                        child: Image.asset(product.image),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPaddin / 4),
                    child: Text(
                      // products is out demo list
                      product.title,
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
