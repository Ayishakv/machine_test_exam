import 'package:flutter/material.dart';
import 'package:machine_test_exam/controller/detail_screen_controller.dart';
import 'package:machine_test_exam/utils/color_constants.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.productId,
  });
  final int productId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context
            .read<DetailScreenController>()
            .getproductdetails(productid: widget.productId.toString());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detailsprovider = context.watch<DetailScreenController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
          color: Colors.black,
        ),
        title: Text(
          "Details",
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
      body: detailsprovider.isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(.2),
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage(""))),
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.favorite_outline_outlined,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: Text(
                      detailsprovider.productdetails?.name ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Color : ${detailsprovider.productdetails?.data?.color ?? ""}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Capacity : ${detailsprovider.productdetails?.data?.capacity}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Price : ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
