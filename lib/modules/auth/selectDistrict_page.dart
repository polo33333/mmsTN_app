import 'package:flutter/material.dart';
import '../../configs/app_config.dart';
import '../../helpers/apihelper.dart';
import '../../models/district.dart';

class SelectDistrictPage extends StatefulWidget {
  const SelectDistrictPage({Key key}) : super(key: key);

  @override
  State<SelectDistrictPage> createState() => _SelectDistrictPageState();
}

class _SelectDistrictPageState extends State<SelectDistrictPage> {
  TextEditingController _controller = new TextEditingController();
  List<District> _districtList = [];
  List<District> _searchResult = [];

  @override
  void initState() {
    _districtList = _setDistrictList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //final height = MediaQuery.of(context).size.height;
    double defaultLoginSize = size.height - (size.height * 0.2);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Center(
              child: Text(
                'MMS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: const Text(
                'Chọn quận/huyện nơi quản lý đơn vị của bạn',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                'Dữ liệu và khả năng truy cập sẽ tương ứng với tùy chọn của bạn',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5 / 4, // 5 top and bottom
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _controller,
                onChanged: onSearchTextChanged,
                decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                  hintText: 'Tìm kiếm quận của bạn',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                height: defaultLoginSize / 5 * 3,
                child: _searchResult.length != 0 ||
                        _controller.text.isNotEmpty
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _searchResult.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: _searchResult[index].isSelected == true
                                  ? Colors.green
                                  : Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: InkWell(
                              onTap: () => {
                                setState(() {
                                  _searchResult.forEach((element) {
                                    element.isSelected = false;
                                  });
                                  _districtList.forEach((el) {
                                    el.isSelected = false;
                                    if (el.id == _searchResult[index].id)
                                      el.isSelected = true;
                                  });
                                  _searchResult[index].isSelected = true;
                                })
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _searchResult[index].name,
                                    style: TextStyle(
                                      color:
                                          _searchResult[index].isSelected ==
                                                  true
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                  ),
                                  _searchResult[index].isSelected == true
                                      ? const Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.white,
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _districtList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: _districtList[index].isSelected == true
                                  ? Colors.green
                                  : Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: InkWell(
                              onTap: () => {
                                setState(() {
                                  _districtList.forEach((element) {
                                    element.isSelected = false;
                                  });
                                  _districtList[index].isSelected = true;
                                })
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _districtList[index].name,
                                    style: TextStyle(
                                      color:
                                          _districtList[index].isSelected ==
                                                  true
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                  ),
                                  _districtList[index].isSelected == true
                                      ? const Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.white,
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: SizedBox(
                height: 45,
                child: TextButton(
                    onPressed: () {
                      _districtList.forEach((element) {
                        if (element.isSelected == true)
                          return _setDistrict(element.id);
                      });
                      Navigator.of(context).pushNamed('/login');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Text(
                      "TIẾP TỤC",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _districtList.forEach((userDetail) {
      if (userDetail.name.toLowerCase().contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }

  void _setDistrict(int id) async {
    await APIHelper.setDistrict(id);
  }

  List<District> _setDistrictList() {
    return AppConfig.setDistrictList();
  }
}
