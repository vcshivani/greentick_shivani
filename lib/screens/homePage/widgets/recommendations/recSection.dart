import 'package:flutter/material.dart';
import 'package:greentick_shivani/models/productData.dart';
import 'package:greentick_shivani/screens/homePage/widgets/recommendations/sampleData.dart';
import 'package:greentick_shivani/screens/homePage/widgets/recommendations/widgets/productCard.dart';
import 'package:greentick_shivani/screens/homePage/widgets/recommendations/widgets/titlebar.dart';
import 'package:greentick_shivani/utils/colors.dart';

class RecommendationsWidget extends StatelessWidget {
  const RecommendationsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: kDividerColor,
          thickness: 1,
        ),
        Titlebar(),
        StreamBuilder<List<ProductModel>>(
            stream: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      padding: EdgeInsets.all(10),
                      child: ProductCard(
                        productData: snapshot.data![index],
                      ),
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 10),
                    Text("Loading..."),
                  ],
                ),
              );
            }),
        Divider(
          color: kDividerColor,
          thickness: 3,
        ),
      ],
    );
  }

  Stream<List<ProductModel>> getData() async* {
    yield await Future.delayed(
      Duration(seconds: 1),
      () => sampleData.map((e) => ProductModel.fromData(e)).toList(),
    );
  }
}
