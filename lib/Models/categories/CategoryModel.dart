/// id : 1
/// category_name : "Souvenirs"
/// category_description : "Souvenirs like old paintings, jewelry"

class CategoryModel {
  CategoryModel({
      num? id, 
      String? categoryName, 
      String? categoryDescription,}){
    _id = id;
    _categoryName = categoryName;
    _categoryDescription = categoryDescription;
}

  CategoryModel.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['category_name'];
    _categoryDescription = json['category_description'];
  }
  num? _id;
  String? _categoryName;
  String? _categoryDescription;
CategoryModel copyWith({  num? id,
  String? categoryName,
  String? categoryDescription,
}) => CategoryModel(  id: id ?? _id,
  categoryName: categoryName ?? _categoryName,
  categoryDescription: categoryDescription ?? _categoryDescription,
);
  num? get id => _id;
  String? get categoryName => _categoryName;
  String? get categoryDescription => _categoryDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_name'] = _categoryName;
    map['category_description'] = _categoryDescription;
    return map;
  }

}