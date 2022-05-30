import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../configs/themes/app_colors.dart';
import '../../models/revenue.dart';
import '../../provider/revenue_provider.dart';
import 'package:provider/provider.dart';

class RevenueDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RevenueDetailPageState();
  }
}

class RevenueDetailPageState extends State<RevenueDetailPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  ScrollController _scrollController = ScrollController();

  _showSnackbar(String message, {Color bgColor}) {
    _globalKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: bgColor ?? Colors.red,
      ),
    );
  }

  _hideSnackbar() {
    _globalKey.currentState.hideCurrentSnackBar();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final f = new DateFormat('dd-MM-yyyy');
    double revenueSum = 0;
    return Scaffold(
        key: _globalKey,
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: AppColors.blue_w500,
          title: Text(
            'Các khoản nộp - Danh sách',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              fontFamily: "Calibre-Semibold",
              letterSpacing: 1.0,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // Container(
                //   padding: EdgeInsets.all(10.0),
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "",
                //     style: TextStyle(
                //       color: Colors.black.withOpacity(0.5),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 30,
                ),
                Consumer<RevenueProvider>(
                  builder: (_, provider, __) => provider.revenueListLength > 0
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          controller: _scrollController,
                          itemBuilder: (_, index) {
                            Revenue post = provider.getRevenueByIndex(index);
                            //revenueSum += post.amount;
                            // return ListTile(
                            //   title: Text((index + 1).toString() + '. ' + post.marketName),
                            //   onTap: (){
                            //     Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: MarketDetailPage()));
                            //   },
                            // );
                            return Card(
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(5))),
                                margin:
                                new EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                                child: Container(
                                    child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10.0),
                                        // leading: Icon(
                                        //   Icons.note_add_sharp,
                                        //   color: Colors.green,
                                        //   size: 30.0,
                                        // ),, //element['group'] group name get
                                        subtitle: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: double.infinity,
                                              height: 5,
                                            ),
                                            RichText(
                                                text: TextSpan(children: <
                                                    TextSpan>[
                                              TextSpan(
                                                  text: "Loại khoản thu: ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                              TextSpan(
                                                  text: post.revenueTypeName,
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.kPrimaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ])),
                                            // SizedBox(
                                            //   width: double.infinity,
                                            //   height: 5,
                                            // ),
                                            // RichText(
                                            //     text: TextSpan(children: <
                                            //         TextSpan>[
                                            //   TextSpan(
                                            //       text: "Ngành hàng: ",
                                            //       style: TextStyle(
                                            //         color: Colors.black,
                                            //         fontSize: 16,
                                            //         fontWeight: FontWeight.w500,
                                            //       )),
                                            //   TextSpan(
                                            //       text: post.productGroupName,
                                            //       style: TextStyle(
                                            //         color:
                                            //             AppColors.kPrimaryColor,
                                            //         fontSize: 16,
                                            //         fontWeight: FontWeight.w400,
                                            //       )),
                                            // ])),
                                            // SizedBox(
                                            //   width: double.infinity,
                                            //   height: 5,
                                            // ),
                                            // RichText(
                                            //     text: TextSpan(children: <
                                            //         TextSpan>[
                                            //   TextSpan(
                                            //       text: "ĐKD: ",
                                            //       style: TextStyle(
                                            //         color: Colors.black,
                                            //         fontSize: 16,
                                            //         fontWeight: FontWeight.w500,
                                            //       )),
                                            //   TextSpan(
                                            //       text: post.kiotName,
                                            //       style: TextStyle(
                                            //         color:
                                            //             AppColors.kPrimaryColor,
                                            //         fontSize: 16,
                                            //         fontWeight: FontWeight.w400,
                                            //       )),
                                            // ])),
                                            // SizedBox(
                                            //   width: double.infinity,
                                            //   height: 5,
                                            // ),
                                            // RichText(
                                            //     text: TextSpan(children: <
                                            //         TextSpan>[
                                            //   TextSpan(
                                            //       text: "Khu vực: ",
                                            //       style: TextStyle(
                                            //         color: Colors.black,
                                            //         fontSize: 16,
                                            //         fontWeight: FontWeight.w500,
                                            //       )),
                                            //   TextSpan(
                                            //       text: null,
                                            //       style: TextStyle(
                                            //         color:
                                            //             AppColors.kPrimaryColor,
                                            //         fontSize: 16,
                                            //         fontWeight: FontWeight.w400,
                                            //       )),
                                            // ])),
                                            SizedBox(
                                              width: double.infinity,
                                              height: 5,
                                            ),
                                            RichText(
                                                text: TextSpan(children: <
                                                    TextSpan>[
                                              TextSpan(
                                                  text: "Só tiền: ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                              TextSpan(
                                                  text: post.amount.toString(),
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.kPrimaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ])),
                                            SizedBox(
                                              width: double.infinity,
                                              height: 5,
                                            ),
                                            RichText(
                                                text: TextSpan(children: <
                                                    TextSpan>[
                                              TextSpan(
                                                  text: "Tình trạng: ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                              TextSpan(
                                                  text: (post.amount == 0? "Chưa nộp": "Đã nộp"),
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.kPrimaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ])),
                                          ],
                                        ))));

                            // return Row(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     DataTable(columns: [
                            //       DataColumn(
                            //           label: Text('#',
                            //               style: TextStyle(
                            //                   fontSize: 16,
                            //                   fontWeight: FontWeight.bold))),
                            //       DataColumn(
                            //           label: Text('Loại khoản nộp',
                            //               style: TextStyle(
                            //                   fontSize: 16,
                            //                   fontWeight: FontWeight.bold))),
                            //       DataColumn(
                            //           label: Text('Số tiền',
                            //               style: TextStyle(
                            //                   fontSize: 16,
                            //                   fontWeight: FontWeight.bold))),
                            //       DataColumn(
                            //           label: Text('Tình trạng',
                            //               style: TextStyle(
                            //                   fontSize: 16,
                            //                   fontWeight: FontWeight.bold))),
                            //     ], rows: [
                            //       // DataRow(cells: [
                            //       //   DataCell(Text('1')),
                            //       //   DataCell(Text('Stephen33333333333333333333333333333333333333333333333333333333333333333333333333')),
                            //       //   DataCell(Text('Actor')),
                            //       //   DataCell(Text('Actor')),
                            //       // ]),
                            //       // DataRow(cells: [
                            //       //   DataCell(Text('5')),
                            //       //   DataCell(Text('John')),
                            //       //   DataCell(Text('Student')),
                            //       //  DataCell(Text('Actor')),
                            //       // ]),
                            //       // DataRow(cells: [
                            //       //   DataCell(Text('10')),
                            //       //   DataCell(Text('Harry')),
                            //       //   DataCell(Text('Leader')),
                            //       //   DataCell(Text('Actor')),
                            //       // ]),
                            //       // DataRow(cells: [
                            //       //   DataCell(Text('15')),
                            //       //   DataCell(Text('Peter')),
                            //       //   DataCell(Text('Scientist')),
                            //       //   DataCell(Text('Actor')),
                            //       // ]),
                            //       DataRow(cells: [
                            //         DataCell(Text((index + 1).toString())),
                            //         DataCell(Text('')),
                            //         DataCell(Text(post.amount.toString())),
                            //         DataCell(Text(post.amount == 0
                            //             ? "Chưa nộp"
                            //             : "Đã nộp")),
                            //       ]),
                            //       DataRow(cells: [
                            //
                            //         DataCell(Text("Tổng", style: TextStyle(fontSize: 16,color: Colors.red, fontWeight: FontWeight.bold),)),
                            //         DataCell(Text("")),
                            //         DataCell(Text("")),
                            //         DataCell(Text((revenueSum.toString()))),
                            //       ])
                            //     ])
                            //   ],
                            // );
                          },
                          itemCount: provider.revenueListLength,
                        )
                      : Center(
                    child: Container(
                      width: 500,
                      height: 400,
                      color: Colors.transparent,
                      child: Image.asset('assets/images/no-data-found-1.png'),
                    ),
                  ),
                ),
              ],
            )));
  }
}
