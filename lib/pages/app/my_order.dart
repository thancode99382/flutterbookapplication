import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doanflutterfahasa/viewmodels/order_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';








class MyOrder extends StatefulWidget{
  const MyOrder({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyOrderState();
  }

}










class _MyOrderState extends State<MyOrder>
{


    String selectedStatus = 'pending';



    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                iconTheme: const IconThemeData(
                    color: Colors.white
                ),
                backgroundColor: Colors.red,
                title: Text(
                    'Lịch sử mua hàng',
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        )
                    )
                )
            ),
            body: Column(
                children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [


                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {

                                    selectedStatus = "pending";
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(

                                           color: selectedStatus == "pending" ? Colors.orange : Colors.transparent

                                      )
                                    )


                                  ),
                                  child: Center(
                                    child: Text(
                                        'Chờ thanh toán',
                                        style: GoogleFonts.openSans(
                                            textStyle: const TextStyle(
                                fontSize: 14


                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {

                                    selectedStatus = "processing";
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(

                                              color: selectedStatus == "processing" ? Colors.orange : Colors.transparent

                                          )
                                      )


                                  ),
                                  child: Center(
                                    child: Text(
                                        'Đang xử lý',
                                        style: GoogleFonts.openSans(
                                            textStyle: const TextStyle(
                                                fontSize: 14


                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {

                                    selectedStatus = "completed";
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(

                                              color: selectedStatus == "completed" ? Colors.orange : Colors.transparent

                                          )
                                      )


                                  ),
                                  child: Center(
                                    child: Text(
                                        'Hoàn tất',
                                        style: GoogleFonts.openSans(
                                            textStyle: const TextStyle(
                                                fontSize: 14


                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            ),




                          ],
                        )
                    ),


                  Expanded(
                    child: StreamBuilder<List<Map<String, dynamic>>>(
                      stream: OrderViewModel().productsByOrderStatusStream(selectedStatus),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                    
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(child: Text('Không có đơn hàng.'));
                        }
                    
                        var products = snapshot.data!;
                    
                    
                        return ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            var productData = products[index];  // Truy xuất dữ liệu sản phẩm
                            return Container(
                                height: 120,
                                padding: EdgeInsets.symmetric(vertical: 5),

                                child: Row(
                                    children: [
                                      Image.network(productData['imageUrl']),
                                      SizedBox(
                                          width: 250,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text(productData['productName'],
                                                    maxLines: 2, // Giới hạn 2 dòng
                                                    overflow: TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                        textStyle: const TextStyle(
                                                        )
                                                    )
                                                ),
                                                const SizedBox(
                                                    height: 5
                                                ),
                                                Text("${NumberFormat('#,###','vi_VN').format(productData['price'])} đ",
                                                    style: GoogleFonts.openSans(
                                                        textStyle: const TextStyle(
                                                            color: Colors.orange,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 12
                                                        )
                                                    )
                                                ),

                                              ]
                                          )
                                      )
                                    ]
                                )
                            );
                          },
                        );
                    
                      },
                    ),
                  )

                ]
            )
        );
    }
}
