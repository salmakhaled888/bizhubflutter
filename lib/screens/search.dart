import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/cubit/products/product_cubit.dart';
import '../Models/products/ProductModel.dart';
import '../widgets/appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backImage: true, // Set to true if you want the back image
        logoutImage: false, // Set to true if you want the logout image
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Textfield for searching
            TextField(
              controller: search,
              decoration: InputDecoration(
                hintText: 'Search for products...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // You can add an onChanged callback for real-time search functionality
              onChanged: (query) {
                BlocProvider.of<ProductCubit>(context).SearchProductCheck(search_query: search.text.toString());
              },
            ),
            const SizedBox(height: 16),
            // Placeholder for search results (to be replaced with API data)
            Expanded(
              child: Center(
                child: Text(
                  'Search results will appear here.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            BlocBuilder <ProductCubit,ProductState>(
                builder: (context,state){
                  if(state is ProductLoading){
                    return CircularProgressIndicator();
                  }
                  else if(state is ProductFailed){
                    return Text("Failed");
                  }
                  else if (state is ProductSuccess){
                    List <ProductSuccessModel> products = state.products;
                    return SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: ListView.builder(
                        shrinkWrap: true,
                          itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading:CircleAvatar(
                              child: Image.network("${products[index].productImage}"),
                            ) ,
                            title: Text("${products[index].productName}"),
                            subtitle: Text("${products[index].productDescription}"),
                            onTap:(){
                              Navigator.pushReplacementNamed(context, '/product',
                                  arguments: products[index].id);
                            }
                          );
                        },
                      ),
                    );
                  }
                  else{
                    return Text("");
                  }
                })
          ],
        ),
      ),
    );
  }
}
