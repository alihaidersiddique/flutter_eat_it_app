class PopularItemModel {
  String foodId = '', name = '', menuId = '', image = '';

  PopularItemModel({
    required this.foodId,
    required this.name,
    required this.menuId,
    required this.image,
  });

  PopularItemModel.fromJson(Map<String, dynamic> map) {
    foodId = map['food_id'];
    name = map['name'];
    menuId = map['menu_id'];
    image = map['image'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['food_id'] = this.foodId;
    data['name'] = this.name;
    data['menu_id'] = this.menuId;
    data['image'] = this.image;
    return data;
  }
}
