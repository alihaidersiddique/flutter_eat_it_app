import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_eat_it_app/const/const.dart';
import 'package:flutter_eat_it_app/model/popular_item_model.dart';

Future<List<PopularItemModel>> getMostPopularByRestaurantId(
    String restaurantId) async {
  var list = List<PopularItemModel>.empty(growable: true);

  var source = await FirebaseDatabase.instance
      .reference()
      .child(RESTAURANT_REF)
      .child(restaurantId)
      .child(MOST_POPULAR_REF)
      .once();

  // firebase sa jo data aye ga wh map form mai ho ga to ussay map mai store krna ho ga

  Map<dynamic, dynamic> values = source.value;

  // ub tamam data ko dart object mai convert kiya hai

  values.forEach((key, value) {
    list.add(PopularItemModel.fromJson(jsonDecode(jsonEncode(value))));
  });

  return list;
}
