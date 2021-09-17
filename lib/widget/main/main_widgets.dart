import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantImageWidget extends StatelessWidget {
  const RestaurantImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          errorWidget: (context, url, err) => Center(
            child: Icon(Icons.image),
          ),
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class RestaurantInfoWidget extends StatelessWidget {
  const RestaurantInfoWidget({
    Key? key,
    required this.address,
    required this.name,
  }) : super(key: key);

  final String name, address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              name,
              style: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.w900),
            ),
            Text(
              address,
              style: GoogleFonts.jetBrainsMono(
                  fontWeight: FontWeight.w400, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
