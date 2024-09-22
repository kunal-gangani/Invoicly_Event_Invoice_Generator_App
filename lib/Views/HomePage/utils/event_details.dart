import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_generator/Globals/routes.dart';

Widget widgetDetails({
  required Map e,
  required BuildContext context,
}) {
  double rating = (e['ratings'] is num) ? e['ratings'].toDouble() : 0.0;

  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(
        context,
        Routes.detailPage,
        arguments: e,
      );
    },
    child: Container(
      height: 115.h,
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              e['thumbnail'],
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e['name'],
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${e['price']}',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      RatingBarIndicator(
                        rating: rating,
                        itemSize: 20.0,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
