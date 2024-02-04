/// id : 3
/// product_id : 1
/// user_id : 4
/// quantity : 1
/// created_at : "2024-02-02"
/// modified_at : "2024-02-04"
/// deleted_at : null
/// total_price : 120.0

class CartItemsModel {
  CartItemsModel({
      num? id, 
      num? productId, 
      num? userId, 
      num? quantity, 
      String? createdAt, 
      String? modifiedAt, 
      dynamic deletedAt, 
      num? totalPrice,}){
    _id = id;
    _productId = productId;
    _userId = userId;
    _quantity = quantity;
    _createdAt = createdAt;
    _modifiedAt = modifiedAt;
    _deletedAt = deletedAt;
    _totalPrice = totalPrice;
}

  CartItemsModel.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _userId = json['user_id'];
    _quantity = json['quantity'];
    _createdAt = json['created_at'];
    _modifiedAt = json['modified_at'];
    _deletedAt = json['deleted_at'];
    _totalPrice = json['total_price'];
  }
  num? _id;
  num? _productId;
  num? _userId;
  num? _quantity;
  String? _createdAt;
  String? _modifiedAt;
  dynamic _deletedAt;
  num? _totalPrice;
CartItemsModel copyWith({  num? id,
  num? productId,
  num? userId,
  num? quantity,
  String? createdAt,
  String? modifiedAt,
  dynamic deletedAt,
  num? totalPrice,
}) => CartItemsModel(  id: id ?? _id,
  productId: productId ?? _productId,
  userId: userId ?? _userId,
  quantity: quantity ?? _quantity,
  createdAt: createdAt ?? _createdAt,
  modifiedAt: modifiedAt ?? _modifiedAt,
  deletedAt: deletedAt ?? _deletedAt,
  totalPrice: totalPrice ?? _totalPrice,
);
  num? get id => _id;
  num? get productId => _productId;
  num? get userId => _userId;
  num? get quantity => _quantity;
  String? get createdAt => _createdAt;
  String? get modifiedAt => _modifiedAt;
  dynamic get deletedAt => _deletedAt;
  num? get totalPrice => _totalPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['user_id'] = _userId;
    map['quantity'] = _quantity;
    map['created_at'] = _createdAt;
    map['modified_at'] = _modifiedAt;
    map['deleted_at'] = _deletedAt;
    map['total_price'] = _totalPrice;
    return map;
  }

}