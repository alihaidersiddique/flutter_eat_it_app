import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_eat_it_app/const/const.dart';
import 'package:flutter_eat_it_app/model/restaurant_model.dart';

Future<List<RestaurantModel>> getRestaurantList() async {
  var list = List<RestaurantModel>.empty(growable: true);

  var source =
      await FirebaseDatabase.instance.reference().child(RESTAURANT_REF).once();

  // firebase sa jo data aye ga wh map form mai ho ga to ussay map mai store krna ho ga

  Map<dynamic, dynamic> values = source.value;

  RestaurantModel? restaurantModel;

  // ub tamam data ko dart object mai convert kiya hai

  values.forEach((key, value) {
    restaurantModel = RestaurantModel.fromJson(jsonDecode(jsonEncode(value)));
    restaurantModel!.restaurantId = key;
    list.add(restaurantModel!);
  });

  return list;
}
