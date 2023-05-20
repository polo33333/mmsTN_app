
import 'dart:ui';

import 'package:flutter/material.dart';
import '../../configs/themes/app_colors.dart';
import 'package:provider/provider.dart';
import '../../helpers/contracthelper.dart';
import '../../models/contract_2.dart';
import '../../provider/contract_2_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class ContractDetail_2Screen extends StatefulWidget {
  int marketId;
  ContractDetail_2Screen({this.marketId});
  @override
  _ContractDetail_2ScreenState createState() => _ContractDetail_2ScreenState();
}

class _ContractDetail_2ScreenState extends State<ContractDetail_2Screen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  ScrollController _scrollController = ScrollController();

  _getContracts({bool refresh = true}) async {
    var provider = Provider.of<Contract_2_Provider>(context, listen: false);
    var postsResponse =
        await ContractHelper.getContractByMarketId(widget.marketId);
    provider.setIsContractProcessing(true);
    if (postsResponse.isSuccessful) {
      if (postsResponse.data.isNotEmpty || postsResponse.data.length == 0) {
        if (refresh) {
          provider.mergeContractList(postsResponse.data, notify: false);
        } else {
          provider.setContractList(postsResponse.data, notify: false);
        }
        provider.setCurrentPage(provider.currentPage + 1);
      } else {
        provider.setShouldRefresh(false);
      }
    } else {
      //_showSnackbar(postsResponse.message);
    }
    await Future.delayed(Duration(seconds: 1));
    provider.setIsContractProcessing(false);
    //_hideSnackbar();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getContracts(refresh: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final f = new DateFormat('dd-MM-yyyy');
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        floating: true,
        pinned: true,
        snap: true,
        centerTitle: true,
        title: Text(
          'Hợp đồng thầu chợ',
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
          automaticallyImplyLeading: false,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              cursorColor: Color(0xFF000000),
              onChanged: (value) =>
                  Provider.of<Contract_2_Provider>(context, listen: false)
                      .changeSearchString(value),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF000000).withOpacity(0.5),
                  ),
                  hintText: "Nhập mã hợp đồng để tìm kiếm...",
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
      SliverFillRemaining(
        child: Consumer<Contract_2_Provider>(
          builder: (_, provider, __) => provider.isContractPageProcessing
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : provider.contractListLength > 0
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.all(5),
                      child: Column(children: [
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          controller: _scrollController,
                          itemBuilder: (_, index) {
                            Contract_2 post =
                                provider.getContractByIndex(index);
                            return Container(
                                // margin: new EdgeInsets.symmetric(
                                //     horizontal: 10.0, vertical: 6.0),
                                child: Card(
                                    elevation: 1.0,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.grey, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    margin: new EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 2.0),
                                    child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 5.0, 5, 5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              decoration: new BoxDecoration(
                                                  color: Colors.green),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 5.0, 0, 10.0),
                                              alignment: Alignment.centerLeft,
                                              child: RichText(
                                                  text: TextSpan(children: <
                                                      TextSpan>[
                                                    TextSpan(
                                                        text: "Ngày hợp đồng: ",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight.bold
                                                        )),
                                                    TextSpan(
                                                        text: post.contractDate == null
                                                            ? ''
                                                            : f.format(DateTime.fromMillisecondsSinceEpoch(
                                                            int.parse(post
                                                                .contractDate
                                                                .replaceAll(
                                                                RegExp(
                                                                    '[^0-9]'),
                                                                '')))),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold,
                                                        )),
                                                  ])),
                                            ),
                                            Container(
                                              decoration: new BoxDecoration(
                                                  color: Colors.green),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 5.0, 0, 10.0),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Thông tin chung",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              height: 10,
                                            ),
                                            LineData(
                                                title: "Số hợp đồng ký kết: ",
                                                value: post.contractNo),
                                            SizedBox(
                                              width: double.infinity,
                                              height: 5,
                                            ),
                                            RichText(
                                                text: TextSpan(children: <
                                                    TextSpan>[
                                              TextSpan(
                                                  text: "Thời hạn gói thầu: ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                              TextSpan(
                                                  text: post.startDate == null
                                                      ? ''
                                                      : f.format(DateTime.fromMillisecondsSinceEpoch(
                                                              int.parse(post
                                                                  .startDate
                                                                  .replaceAll(
                                                                      RegExp(
                                                                          '[^0-9]'),
                                                                      '')))) +
                                                          ' - ' +
                                                          (post.endDate == null
                                                              ? ''
                                                              : f.format(
                                                                  DateTime.fromMillisecondsSinceEpoch(int.parse(post.endDate.replaceAll(RegExp('[^0-9]'), ''))))),
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.kPrimaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ])),
                                            SizedBox(
                                              width: double.infinity,
                                              height: 10,
                                            ),
                                            Container(
                                              decoration: new BoxDecoration(
                                                  color: Colors.green),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 5.0, 0, 10.0),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Trách nhiệm đã thực hiện trong năm",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              height: 10,
                                            ),
                                            LineData(
                                                title: "Hạng mục: ", value: ''),
                                            post.contractImplement.length > 0
                                                ? ListView.builder(
                                                    physics:
                                                        ClampingScrollPhysics(),
                                                    //scrollDirection: Axis.horizontal,
                                                    shrinkWrap: true,
                                                    itemCount: post
                                                        .contractImplement
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Text(
                                                        '- ' +
                                                            post
                                                                .contractImplement[
                                                                    index]
                                                                .contractContentTypeName,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16),
                                                      );
                                                    },
                                                  )
                                                : Text(''),

                                            SizedBox(
                                              width: double.infinity,
                                              height: 10,
                                            ),
                                            Container(
                                              decoration: new BoxDecoration(
                                                  color: Colors.green),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 5.0, 0, 10.0),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "File",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ),
                                            post.contractAttachFile.length > 0
                                                ?
                                            SizedBox(
                                              height: 150,
                                              child: SingleChildScrollView(
                                                physics: ScrollPhysics(),
                                                child: Column(
                                                  children: <Widget>[
                                                    ListView.builder(
                                                        physics: NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: post
                                                            .contractAttachFile
                                                            .length,
                                                        itemBuilder: (context, index) {
                                                          return Row( children: [
                                                            IconButton(onPressed: () async {
                                                              FileDownloader.downloadFile(
                                                                  url: post.contractAttachFile[index].fileLink,
                                                                  name: post.contractAttachFile[index].fileName,
                                                                  onDownloadCompleted: (path) {
                                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                      content: Text("Tải xuống thành công"),
                                                                    ));
                                                                    //final File file = File(path);
                                                                    //This will be the path of the downloaded file
                                                                  });
                                                            }, icon: const Icon(Icons.download, color: Colors.redAccent,)),
                                                            Text(
                                                              post
                                                                  .contractAttachFile[
                                                              index]
                                                                  .fileName,
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 14),
                                                            )
                                                          ],);
                                                        },)
                                                  ],
                                                ),
                                              ),
                                            ): Text(''),

                                            // ListView.builder(
                                            //   physics:
                                            //   ClampingScrollPhysics(),
                                            //   //scrollDirection: Axis.horizontal,
                                            //   shrinkWrap: true,
                                            //   itemCount: post
                                            //       .contractAttachFile
                                            //       .length,
                                            //   itemBuilder:
                                            //       (context, index) {
                                            //         return Row( children: [
                                            //           IconButton(onPressed: () async {
                                            //             FileDownloader.downloadFile(
                                            //                 url: post.contractAttachFile[index].fileLink,
                                            //                 name: post.contractAttachFile[index].fileName,
                                            //                 onDownloadCompleted: (path) {
                                            //                   //final File file = File(path);
                                            //                   //This will be the path of the downloaded file
                                            //                 });
                                            //           }, icon: const Icon(Icons.download, color: Colors.redAccent,)),
                                            //         Text(
                                            //               post
                                            //                   .contractAttachFile[
                                            //               index]
                                            //                   .fileName,
                                            //           style: TextStyle(
                                            //               color: Colors.black,
                                            //               fontSize: 14),
                                            //         )
                                            //         ],);
                                            //   },
                                            // )
                                             //   : Text(''),
                                          ],
                                        ))));
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
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          )),
      TextSpan(
          text: value,
          style: TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          )),
    ]));
  }
}
