import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/model/cart_model.dart';
import 'package:flutter_eat_it_app/state/cart_state.dart';

class CartImageWidget extends StatelessWidget {
  const CartImageWidget({
    Key? key,
    required this.cartStateController,
    required this.cartModel,
  }) : super(key: key);

  final CartStateController cartStateController;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: cartModel.image,
      fit: BoxFit.cover,
      errorWidget: (context, url, err) => Center(
        child: Icon(Icons.image),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
