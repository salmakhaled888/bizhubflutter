import 'package:dio/dio.dart';
import 'package:helloworld/Models/products/ProductModel.dart';



class Requests{
  String api_link = "https://deploytrial-nxth.onrender.com/api";

  Future <Response?> LoginRequest({required Map data}) async{
    try{
      Response response = await Dio().post("$api_link/login/",data: data);
        return response;
    }
    on DioError catch(e){
      return e.response;
    }

}
  Future<Response?> RegisterRequest({required Map data}) async {
    try{
      Response response = await Dio().post("$api_link/users/", data: data);
      return response;
    }
    on DioError catch(e){
      return e.response;
    }
  }
  Future <Response?> SellerRegister({required Map data}) async {
    try{
      Response response = await Dio().post("$api_link/seller/", data: data);
      return response;
    }
    on DioError catch(e){
      return e.response;
    }
  }

  Future <Response?> CustomerRegister({required Map data}) async {
    try{
      Response response = await Dio().post("$api_link/customer/",data:data);
      return response;
    }
    on DioError catch(e){
      return e.response;
    }
  }

  Future <Response?> SearchUser({required var search_query}) async {

    try{
      Response response = await Dio().get("$api_link/users/?search=$search_query");
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> AddIsCustomer({required Map data}) async {
    try{
      Response response = await Dio().post("$api_link/iscustomer/",data:data);
      return response;
    }
    on DioError catch(e){
      return e.response;
    }
  }

  Future <Response?> SearchIsCustomer({required var search_query}) async {

    try{
      Response response = await Dio().get("$api_link/iscustomer/?user_id=$search_query");
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }


  Future <Response?> SearchSeller({required var search_query}) async {

    try{
      Response response = await Dio().get("$api_link/seller/$search_query");
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> SearchCustomer({required var search_query}) async {

    try{
      Response response = await Dio().get("$api_link/customer/$search_query");
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> SellerShop({required Map data}) async {

    try{
      Response response = await Dio().post("$api_link/sellershop/",
      data: data);
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> SearchShopCategory({required var search_query}) async {

    try{
      Response response = await Dio().get("$api_link/shopcategory/?seller_id=$search_query");
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> SingleProduct({required int id}) async {
    try{
      Response response = await Dio().get("$api_link/product/$id");
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> ProductSearch({required var search_query}) async {
    try{
      Response response = await Dio().get("$api_link/product/?search=$search_query");
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> AddProduct({required Map data}) async {

    try{
      Response response = await Dio().post("$api_link/product/",
          data: data);
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> Products() async {
    try {
      Response response = await Dio().get("$api_link/product/");
      return response;
    }
    on DioError catch (e) {
      return e.response;
    }
  }
  Future <Response?> Categories() async {
    try{
      Response response = await Dio().get("$api_link/productcategory/");
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }
  Future <Response?> SingleCategory({required var id}) async {
    try{
      Response response = await Dio().get("$api_link/productcategory/$id");
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> SearchShop({required var search_query}) async {
    try{
      Response response = await Dio().get("$api_link/sellershop/?seller_id=$search_query");
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> ShopCategory({required Map data}) async {

    try{
      Response response = await Dio().post("$api_link/shopcategory/",
          data: data);
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }


  Future <Response?> BusinessType({required Map data}) async {

    try{
      Response response = await Dio().post("$api_link/businesstype/",
          data: data);
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> AddCartItems({required Map data}) async {

    try{
      Response response = await Dio().post("$api_link/cartitems/",
          data: data);
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> GetCartItems({ required var search_query}) async {

    try{
      Response response = await Dio().post("$api_link/cartitems/?user_id=$search_query");
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }

  Future <Response?> GetRatings({ required var id}) async {

    try{
      Response response = await Dio().post("$api_link/ratings/$id");
      return response;

    }
    on DioError catch (e){
      return e.response;
    }
  }


}