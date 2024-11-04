import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/domain/order/entities/product_orderer.dart';
import 'package:ecommerce/presentation/settings/widgets/product_orderer_card.dart';
import 'package:flutter/material.dart';

class OrderItemsPage extends StatelessWidget {
  final List<ProductOrdererEntity> products;
  const OrderItemsPage({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(
          title: Text(
            'Order Items',
          ),
        ),
        body: _products());
  }

  Widget _products() {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return OrderItemCard(
            productOrdererEntity: products[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: products.length);
  }
}
