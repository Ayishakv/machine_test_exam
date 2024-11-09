import 'package:flutter/material.dart';
import 'package:machine_test_exam/controller/home_screen_controller.dart';
import 'package:machine_test_exam/utils/color_constants.dart';
import 'package:machine_test_exam/utils/image_constants.dart';
import 'package:machine_test_exam/view/detail_screen/detail_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomeScreenController>().getallproducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeprovider = context.watch<HomeScreenController>();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          "All Products",
          style: TextStyle(
              color: ColorConstants.mainblack,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.notifications_none,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: homeprovider.isproductloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: homeprovider.allProducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisExtent: 350),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  productId:
                                      homeprovider.allProducts[index].id!,
                                ),
                              ));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              height: 280,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.grey.withOpacity(.2),
                                  color: ColorConstants.maingrey,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        ImageConstants.splash_image,
                                      ))),
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.7),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.favorite_outline_outlined,
                                  size: 30,
                                ),
                              ),
                            ),
                            Text(
                              maxLines: 1,
                              homeprovider.allProducts[index].name ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
