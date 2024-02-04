/// id : 1
/// product_name : "Arabian Woman, Egypt Pyramids, Camels Painting."
/// product_image : "https://deploytrial-nxth.onrender.com/Product/Product%20Images/Product%20Images/1.png"
/// product_description : "A Souvenir Photo | Woman | Camels| Pyramids | Painting"
/// SKU : "TS789UYO"
/// quantity : 699
/// price : "120.000"
/// created_at : "2024-01-31"
/// modified_at : "2024-02-01"
/// category_id : 1
/// seller_id : 1

class ProductSuccessModel {
  ProductSuccessModel({
      num? id, 
      String? productName, 
      String? productImage, 
      String? productDescription, 
      String? sku, 
      num? quantity, 
      String? price, 
      String? createdAt, 
      String? modifiedAt, 
      num? categoryId, 
      num? sellerId,}){
    _id = id;
    _productName = productName;
    _productImage = productImage;
    _productDescription = productDescription;
    _sku = sku;
    _quantity = quantity;
    _price = price;
    _createdAt = createdAt;
    _modifiedAt = modifiedAt;
    _categoryId = categoryId;
    _sellerId = sellerId;
}

  ProductSuccessModel.fromJson(dynamic json) {
    _id = json['id'];
    _productName = json['product_name'];
    _productImage = json['product_image'];
    _productDescription = json['product_description'];
    _sku = json['SKU'];
    _quantity = json['quantity'];
    _price = json['price'];
    _createdAt = json['created_at'];
    _modifiedAt = json['modified_at'];
    _categoryId = json['category_id'];
    _sellerId = json['seller_id'];
  }
  num? _id;
  String? _productName;
  String? _productImage;
  String? _productDescription;
  String? _sku;
  num? _quantity;
  String? _price;
  String? _createdAt;
  String? _modifiedAt;
  num? _categoryId;
  num? _sellerId;
ProductSuccessModel copyWith({  num? id,
  String? productName,
  String? productImage,
  String? productDescription,
  String? sku,
  num? quantity,
  String? price,
  String? createdAt,
  String? modifiedAt,
  num? categoryId,
  num? sellerId,
}) => ProductSuccessModel(  id: id ?? _id,
  productName: productName ?? _productName,
  productImage: productImage ?? _productImage,
  productDescription: productDescription ?? _productDescription,
  sku: sku ?? _sku,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  createdAt: createdAt ?? _createdAt,
  modifiedAt: modifiedAt ?? _modifiedAt,
  categoryId: categoryId ?? _categoryId,
  sellerId: sellerId ?? _sellerId,
);
  num? get id => _id;
  String? get productName => _productName;
  String? get productImage => _productImage;
  String? get productDescription => _productDescription;
  String? get sku => _sku;
  num? get quantity => _quantity;
  String? get price => _price;
  String? get createdAt => _createdAt;
  String? get modifiedAt => _modifiedAt;
  num? get categoryId => _categoryId;
  num? get sellerId => _sellerId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_name'] = _productName;
    map['product_image'] = _productImage;
    map['product_description'] = _productDescription;
    map['SKU'] = _sku;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['created_at'] = _createdAt;
    map['modified_at'] = _modifiedAt;
    map['category_id'] = _categoryId;
    map['seller_id'] = _sellerId;
    return map;
  }

}