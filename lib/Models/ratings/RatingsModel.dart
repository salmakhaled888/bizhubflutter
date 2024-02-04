/// id : 1
/// rating : 5
/// created_at : "2024-02-01T12:50:00Z"
/// product_id : 1
/// user_id : 1

class RatingsModel {
  RatingsModel({
      num? id, 
      num? rating, 
      String? createdAt, 
      num? productId, 
      num? userId,}){
    _id = id;
    _rating = rating;
    _createdAt = createdAt;
    _productId = productId;
    _userId = userId;
}

  RatingsModel.fromJson(dynamic json) {
    _id = json['id'];
    _rating = json['rating'];
    _createdAt = json['created_at'];
    _productId = json['product_id'];
    _userId = json['user_id'];
  }
  num? _id;
  num? _rating;
  String? _createdAt;
  num? _productId;
  num? _userId;
RatingsModel copyWith({  num? id,
  num? rating,
  String? createdAt,
  num? productId,
  num? userId,
}) => RatingsModel(  id: id ?? _id,
  rating: rating ?? _rating,
  createdAt: createdAt ?? _createdAt,
  productId: productId ?? _productId,
  userId: userId ?? _userId,
);
  num? get id => _id;
  num? get rating => _rating;
  String? get createdAt => _createdAt;
  num? get productId => _productId;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['rating'] = _rating;
    map['created_at'] = _createdAt;
    map['product_id'] = _productId;
    map['user_id'] = _userId;
    return map;
  }

}