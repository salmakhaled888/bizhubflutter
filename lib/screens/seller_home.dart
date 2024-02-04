import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/cubit/category/category_cubit.dart';
import '../Models/categories/CategoryModel.dart';
import '../Repository/Requests.dart';
import '../cubit/all_products/all_products_cubit.dart';
import '../widgets/appbar.dart';

class SellerHomeScreen extends StatelessWidget {


  const SellerHomeScreen({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data = [ModalRoute.of(context)!.settings.arguments];
    BlocProvider.of<CategoryCubit>(context).CategoriesCheck();
    BlocProvider.of<AllProductsCubit>(context).AllProductCheck();
    return Scaffold(
      appBar: const CustomAppBar(
        backImage: false,
        logoutImage: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const InkWell(
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 170),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/search');
                        // Replace with your actual route for the search screen
                      },
                      icon: Icon(Icons.search, color: Color(0xff53B0A2)),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () async{
                Response userInfo = await Requests().SearchSeller(search_query: "?id=${data[0][0]}") as Response;
                Response shop_category = await Requests().SearchShopCategory(search_query: data[0][0]) as Response;
                Response shop_name = await Requests().SearchShop(search_query: data[0][0]) as Response;
                Navigator.pushNamed(context, '/sellerProfile',
                arguments:[
                  userInfo.data[0]['first_name'],
                  userInfo.data[0]['last_name'],
                  shop_name.data[0]['shop_name'],
                  shop_category.data[0]['category_name']
                ]);
                // Replace with your actual route for the profile screen
              },
              child: Text(
                '${data[0][1]}',
                style: const TextStyle(
                  color: Color(0xff53B0A2),
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            InkWell(
              onTap: () async{
                Response userInfo = await Requests().SearchSeller(search_query: "?id=${data[0][0]}") as Response;
                Response shop_category = await Requests().SearchShopCategory(search_query: data[0][0]) as Response;
                Response shop_name = await Requests().SearchShop(search_query: data[0][0]) as Response;
                Navigator.pushNamed(context, '/sellerProfile',
                    arguments:[
                      userInfo.data[0]['first_name'],
                      userInfo.data[0]['last_name'],
                      shop_name.data[0]['shop_name'],
                      shop_category.data[0]['category_name']
                    ]);
                // Replace with your actual route for the profile screen
              },
              child: Text(
                '${data[0][2]}',
                style: const TextStyle(
                  fontSize: 16,
                  color: const Color(0xff53B0A2),
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Replace the following with your logic to display offers
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildOfferRectangle('Offer 1'),

                  // Add more offer rectangles as needed
                ],
              ),
            ),
            const Text(
              'Categories:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Replace the following with your logic to display categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      BlocBuilder<CategoryCubit,CategoryState>(
                          builder: (context,state){
                            if(state is CategorySuccess){
                              List<CategoryModel> categories = state.categories;
                              return Row(
                                children: [
                                  _buildCategoryCard('${categories[0].categoryName}'),
                                  _buildCategoryCard('${categories[1].categoryName}'),
                                  _buildCategoryCard('${categories[2].categoryName}'),
                                  _buildCategoryCard('${categories[3].categoryName}'),
                                  _buildCategoryCard('${categories[4].categoryName}'),
                                  _buildCategoryCard('${categories[5].categoryName}'),
                                  _buildCategoryCard('${categories[6].categoryName}'),
                                  _buildCategoryCard('${categories[7].categoryName}'),
                                  _buildCategoryCard('${categories[8].categoryName}')
                                ],
                              );
                            }
                            else if (state is CategoryFailed) {
                              return Text("Failed");
                            }
                            else{
                              return CircularProgressIndicator();
                            }
                          }),
                      // Add more category cards as needed
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Featured Section with 'See All'
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Featured:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/productList');
                    // Replace with your actual route
                  },
                  child: Row(
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.teal,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Replace the following with your logic to display categories
            BlocBuilder<AllProductsCubit,AllProductsState>(
                builder: (context,state){
                  if(state is AllProductsSuccess){
                    print(state.products[0].productName);
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Wrap(
                            spacing: 16,
                            runSpacing: 8,
                            children: [
                              _buildFeaturedCard('${state.products[0].productName}', '${state.products[0].price}','${state.products[0].productImage}'),
                              _buildFeaturedCard('${state.products[1].productName}', '${state.products[1].price}','${state.products[1].productImage}'),
                              _buildFeaturedCard('${state.products[2].productName}', '${state.products[2].price}','${state.products[2].productImage}'),
                              // Add more category cards as needed
                            ],
                          ),
                        ],
                      ),
                    );

                  }
                  else{
                    print("Failed");
                    return Container();
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferRectangle(String offerText) {
    return Container(
      width: 310,
      height: 150,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        offerText,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String categoryName) {
    return Container(
      width: 120,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        categoryName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildFeaturedCard(String productName, String productPrice, String productImage) {
    return Container(
      width: 120,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.only(bottom: 8),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage('$productImage'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                productName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$productPrice EGP',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
