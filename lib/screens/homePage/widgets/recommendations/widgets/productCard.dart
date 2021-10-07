import 'package:flutter/material.dart';
import 'package:greentick_shivani/models/productData.dart';
import 'package:greentick_shivani/utils/colors.dart';
import 'package:greentick_shivani/utils/fontStyles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.productData,
    Key? key,
  }) : super(key: key);

  final ProductModel productData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("You have pressed ${productData.title}")),
            );
          },
          child: ProductImage(productData: productData),
        ),
        SizedBox(height: 15),
        Text(
          productData.title,
          style: kTitleText,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            LikeCount(count: productData.likeCount, isLike: true),
            SizedBox(width: 10),
            LikeCount(count: productData.dislikeCount, isLike: false),
            SizedBox(width: 10),
            Ratings(rating: productData.rating)
          ],
        )
      ],
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.productData,
  }) : super(key: key);

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Image.network(
        productData.image,
        height: 160,
        width: 240,
        fit: BoxFit.cover,
        errorBuilder: (_, child, loading) => SizedBox(
          height: 160,
          width: 240,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
              ),
              Text(
                "Could not load url",
              )
            ],
          ),
        ),
        loadingBuilder: (_, child, progress) => progress == null
            ? child
            : SizedBox(
                height: 160,
                width: 240,
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      value: progress.cumulativeBytesLoaded /
                          progress.expectedTotalBytes!,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class LikeCount extends StatelessWidget {
  const LikeCount({
    required this.count,
    required this.isLike,
    Key? key,
  }) : super(key: key);

  final int count;
  final bool isLike;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isLike ? Icons.thumb_up : Icons.thumb_down,
          color: isLike ? kGreenColor : kRedColor,
          size: 15,
        ),
        SizedBox(width: 3),
        Text(
          count.toString(),
          style: kInfoText,
        )
      ],
    );
  }
}

class Ratings extends StatelessWidget {
  const Ratings({
    this.rating,
    Key? key,
  }) : super(key: key);

  final double? rating;

  @override
  Widget build(BuildContext context) {
    Color _color = rating != null ? kGreenColor : Colors.grey;
    Icon _icon = Icon(rating != null ? Icons.star : Icons.star_outline,
        color: _color, size: 15);
    Icon _iconhalf = Icon(rating != null ? Icons.star : Icons.star_outline,
        color: _color, size: 15);
    return Row(
      children: [
        _icon,
        _icon,
        _icon,
        _icon,
        _iconhalf,
        SizedBox(width: 4),
        Text(
          rating != null ? rating.toString() : "NA",
          style: kInfoText,
        ),
      ],
    );
  }
}
