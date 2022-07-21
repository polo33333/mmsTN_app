import 'package:flutter/material.dart';
import '../configs/themes/app_colors.dart';
import 'package:provider/provider.dart';
import '../helpers/contracthelper.dart';
import '../models/contract.dart';
import '../provider/contract_provider.dart';
import 'package:intl/intl.dart';

class ContractPage extends StatefulWidget {
  @override
  _ContracPageState createState() => _ContracPageState();
}

class _ContracPageState extends State<ContractPage> {
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

  _getPosts({bool refresh = true}) async {
    var provider = Provider.of<ContractProvider>(context, listen: false);
    var postsResponse = await ContractHelper.search();
    if (postsResponse.isSuccessful) {
      if (postsResponse.data.isNotEmpty) {
        provider.setContractList(postsResponse.data, notify: false);

        //provider.setCurrentPage(provider.currentPage + 1);
      } else {
        // provider.setShouldRefresh(false);
      }
    } else {
      //_showSnackbar(postsResponse.message);
    }
    provider.setIsContractProcessing(false);
    //_hideSnackbar();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent) {
          _getPosts();
        }
      }
    });
    _getPosts(refresh: false);
  }

  @override
  Widget build(BuildContext context) {
    final f = DateFormat('dd-MM-yyyy');
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        backgroundColor: AppColors.blue_w500,
        floating: true,
        pinned: true,
        snap: true,
        centerTitle: true,
        title: const Text(
          'Hợp đồng thuê',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            fontFamily: "Calibre-Semibold",
            letterSpacing: 1.0,
          ),
        ),
        actions: <Widget>[],
        bottom: AppBar(
          backgroundColor: AppColors.blue_w500,
          automaticallyImplyLeading: false,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextField(
              cursorColor: const Color(0xFF000000),
              onChanged: (value) =>
                  Provider.of<ContractProvider>(context, listen: false)
                      .changeSearchString(value),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: const Color(0xFF000000).withOpacity(0.5),
                  ),
                  hintText: "Nhập mã hợp đồng để tìm kiếm...",
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
      SliverFillRemaining(
        child: Consumer<ContractProvider>(
          builder: (_, provider, __) => provider.isContractPageProcessing
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : provider.contractListLength > 0
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.all(5),
                      child: Column(children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          controller: _scrollController,
                          itemBuilder: (_, index) {
                            Contract post = provider.getContractByIndex(index);
                            return Card(
                                elevation: 1.0,
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.grey, width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 2.0),
                                child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    // leading: Icon(
                                    //   Icons.note_add_sharp,
                                    //   color: Colors.green,
                                    //   size: 30.0,
                                    // ),
                                    title: LineData(
                                        title: "Số hợp đồng: ",
                                        value: post.rentCode),
                                    subtitle: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const SizedBox(
                                          width: double.infinity,
                                          height: 5,
                                        ),
                                        LineData(
                                            title: "Chợ: ",
                                            value: post.marketName),
                                        const SizedBox(
                                          width: double.infinity,
                                          height: 5,
                                        ),
                                        LineData(
                                            title: "Thương nhân: ",
                                            value: post.householdBusinessName),
                                        const SizedBox(
                                          width: double.infinity,
                                          height: 5,
                                        ),
                                        // LineData(
                                        //     title: "Ngành hàng: ",
                                        //     value: post.productGroupName),
                                        // const SizedBox(
                                        //   width: double.infinity,
                                        //   height: 5,
                                        // ),
                                        LineData(
                                            title: "Danh sách ĐKD: ",
                                            value: ''),
                                        post.dSDKD.length > 0
                                            ? ListView.builder(
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                //scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount: post.dSDKD.length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      const Divider(
                                                        height: 10,
                                                        thickness: 2,
                                                        indent: 0,
                                                        endIndent: 0,
                                                        color: Colors.green,
                                                      ),
                                                      LineDataSub(
                                                          title: "ĐKD: ",
                                                          value: post
                                                                      .dSDKD[
                                                                          index]
                                                                      .kiotName ==
                                                                  null
                                                              ? ""
                                                              : post
                                                                  .dSDKD[index]
                                                                  .kiotName),
                                                      const SizedBox(
                                                        width: double.infinity,
                                                        height: 5,
                                                      ),
                                                      LineDataSub(
                                                          title: "Khu vực: ",
                                                          value: post
                                                              .dSDKD[
                                                          index]
                                                              .regionName ==
                                                              null
                                                              ? ""
                                                              : post
                                                              .dSDKD[index]
                                                              .regionName),
                                                      const SizedBox(
                                                        width: double.infinity,
                                                        height: 5,
                                                      ),
                                                      LineDataSub(
                                                          title: "Thời hạn (số tháng thuê): ",
                                                          value: post
                                                              .dSDKD[
                                                          index]
                                                              .qty ==
                                                              null
                                                              ? ""
                                                              : post
                                                              .dSDKD[index]
                                                              .qty.toString()),
                                                      const SizedBox(
                                                        width: double.infinity,
                                                        height: 5,
                                                      ),
                                                      RichText(
                                                          text: TextSpan(children: <TextSpan>[
                                                        const TextSpan(
                                                            text: "Ngày bắt đầu: ",
                                                            style: TextStyle(
                                                              color: Colors.black54,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w500,
                                                            )),
                                                        TextSpan(
                                                            text: post
                                                                .dSDKD[index].startDate != null ? f.format(DateTime
                                                                .fromMillisecondsSinceEpoch(
                                                                    int.parse(post
                                                                        .dSDKD[index].startDate
                                                                        .replaceAll(
                                                                            RegExp('[^0-9]'),
                                                                            '')))) : '',
                                                            style: const TextStyle(
                                                              color: AppColors.kPrimaryColor,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w400,
                                                            )),
                                                      ])),
                                                      const SizedBox(
                                                        width: double.infinity,
                                                        height: 5,
                                                      ),
                                                      RichText(
                                                          text: TextSpan(children: <TextSpan>[
                                                        const TextSpan(
                                                            text: "Ngày hết hạn: ",
                                                            style: TextStyle(
                                                              color: Colors.black54,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w500,
                                                            )),
                                                        TextSpan(
                                                            text: post
                                                                .dSDKD[index].endDate!= null? f.format(DateTime
                                                                .fromMillisecondsSinceEpoch(
                                                                    int.parse(post
                                                                        .dSDKD[index].endDate
                                                                        .replaceAll(
                                                                            RegExp('[^0-9]'),
                                                                            '')))): '',
                                                            style: const TextStyle(
                                                              color: AppColors.kPrimaryColor,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w400,
                                                            )),
                                                      ])),
                                                    ],
                                                  );
                                                },
                                              )
                                            : const Text(''),

                                        // RichText(
                                        //     text: TextSpan(children: <TextSpan>[
                                        //   const TextSpan(
                                        //       text: "Ngày bắt đầu: ",
                                        //       style: TextStyle(
                                        //         color: Colors.black,
                                        //         fontSize: 16,
                                        //         fontWeight: FontWeight.w500,
                                        //       )),
                                        //   TextSpan(
                                        //       text: post.startDate != null ? f.format(DateTime
                                        //           .fromMillisecondsSinceEpoch(
                                        //               int.parse(post.startDate
                                        //                   .replaceAll(
                                        //                       RegExp('[^0-9]'),
                                        //                       '')))) : '',
                                        //       style: const TextStyle(
                                        //         color: AppColors.kPrimaryColor,
                                        //         fontSize: 16,
                                        //         fontWeight: FontWeight.w400,
                                        //       )),
                                        // ])),
                                        // const SizedBox(
                                        //   width: double.infinity,
                                        //   height: 5,
                                        // ),
                                        // RichText(
                                        //     text: TextSpan(children: <TextSpan>[
                                        //   const TextSpan(
                                        //       text: "Ngày hết hạn: ",
                                        //       style: TextStyle(
                                        //         color: Colors.black,
                                        //         fontSize: 16,
                                        //         fontWeight: FontWeight.w500,
                                        //       )),
                                        //   TextSpan(
                                        //       text: post.endDate!= null? f.format(DateTime
                                        //           .fromMillisecondsSinceEpoch(
                                        //               int.parse(post.endDate
                                        //                   .replaceAll(
                                        //                       RegExp('[^0-9]'),
                                        //                       '')))): '',
                                        //       style: const TextStyle(
                                        //         color: AppColors.kPrimaryColor,
                                        //         fontSize: 16,
                                        //         fontWeight: FontWeight.w400,
                                        //       )),
                                        // ])),
                                      ],
                                    )));
                          },
                          itemCount: provider.contractListLength,
                        )
                      ]))
                  : Center(
                      child: Container(
                        width: 500,
                        height: 400,
                        color: Colors.transparent,
                        child: Image.asset('assets/images/no-data-found-1.png'),
                      ),
                    ),
        ),
      ),
    ]));
  }
}

class LineData extends StatelessWidget {
  LineData({this.title, this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
          text: title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
      TextSpan(
          text: value,
          style: const TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          )),
    ]));
  }
}


class LineDataSub extends StatelessWidget {
  LineDataSub({this.title, this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          TextSpan(
              text: value,
              style: const TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
        ]));
  }
}
