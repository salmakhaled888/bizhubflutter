import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/cubit/single_category/single_category_cubit.dart';
import 'package:helloworld/cubit/single_product/single_product_cubit.dart';
import '../widgets/appbar.dart';
import '../widgets/main_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 0;
  int product_quantity = 0;
  var category_id;
  String category_name = "";

  @override
  Widget build(BuildContext context) {
    var product_id = ModalRoute.of(context)!.settings.arguments;
    BlocProvider.of<SingleProductCubit>(context).SingleProductCheck(id: product_id);
    return Scaffold(
      appBar: CustomAppBar(
        backImage: true,
        logoutImage: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<SingleProductCubit,SingleProductState>(
                builder: (context,state){
                  if(state is SingleProductLoading){
                    return CircularProgressIndicator();
                  }
                  else if(state is SingleProductFailed){
                    return Text("Failed");
                  }
                  else if(state is SingleProductSuccess){
                    category_id = state.single_product.categoryId;
                    BlocProvider.of<SingleCategoryCubit>(context).SingleCategoryCheck(id: category_id);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Big Image
                        Container(
                          width: double.infinity,
                          height: 200, // Adjust the height as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage('${state.single_product.productImage}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Small Images
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSmallImage('assets/images/1.jpg'),
                            _buildSmallImage('assets/images/2.jpg'),
                            _buildSmallImage('assets/images/3.jpg'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Product Information
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${state.single_product.productName}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              BlocBuilder<SingleCategoryCubit,SingleCategoryState>(
                                  builder: (context,state){
                                    if(state is SingleCategorySuccess){
                                      return   Text(
                                        'Category: ${state.category.categoryName}', // Replace with actual category
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      );
                                    }
                                    else{
                                      return Container();
                                    }
                                  }),
                              const SizedBox(height: 8),
                              Text(
                                'Price: ${state.single_product.price.toString()}', // Replace with actual price
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Quantity Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                // Decrease quantity
                                setState(() {
                                  if (quantity > 0) {
                                    quantity--;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              ' $quantity ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // Increase quantity
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Add to Cart Button
                        Center(
                          child: CustomMainButton(
                            text: 'Add to Cart',
                            onPressed: () {
                              // TODO: Implement logic to add the product to the cart
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  else{
                    return Container();
                  }
                }),

          ],
        )
      ),
    );
  }

  Widget _buildSmallImage(String imagePath) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
