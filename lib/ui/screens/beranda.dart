import 'package:flutter/material.dart';
import 'package:gojek_clone/ui/widgets/card_goclub.dart';
import 'package:gojek_clone/ui/widgets/card_info.dart';
import 'package:gojek_clone/ui/widgets/custom_button_icon.dart';
import 'package:gojek_clone/ui/widgets/custom_card.dart';
import 'package:gojek_clone/ui/widgets/nav_bottom.dart';
import 'package:gojek_clone/common/my_colors.dart';
import 'package:gojek_clone/common/my_font_size.dart';
import 'package:gojek_clone/common/my_style.dart';
import 'package:gojek_clone/ui/widgets/subtitle.dart';
import 'package:gojek_clone/ui/widgets/scroll_brush.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  var _scrollController = ScrollController();

  List<bool> tabBarBadgeList = [false, false, false, true];

  List tabBarList = ["Beranda", "Promo", "Pesanan", "Chat"];

  int tabBarIndex = 0;

  int balanceBalance = 0;

  bool isBrush = false;

  bool isCollapseNavBottom = true;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 0) {
        isBrush = true;
        setState(() {});
      } else{
        isBrush = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget tabBarItem(int index) {
      return Expanded(
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: (tabBarIndex == index)
                      ? MyColors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      tabBarIndex = index;
                    });
                  },
                  child: Center(
                    child: Text(
                      tabBarList[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: (tabBarIndex == index)
                              ? MyColors.darkGreen
                              : MyColors.white,
                          fontSize: MyFontSize.medium1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            if (tabBarBadgeList[index])
              Align(
                alignment: Alignment.topRight,
                child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: MyColors.red,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: MyColors.white,
                          width: 1.5,
                        )),
                    child: Center(
                        child: Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                          color: MyColors.red,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: MyColors.white,
                          )),
                    ))),
              )
          ],
        ),
      );
    }

    Widget tabBar() {
      return Container(
        margin: EdgeInsets.only(bottom: 8),
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.darkGreen,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            tabBarItem(0),
            tabBarItem(1),
            tabBarItem(2),
            tabBarItem(3),
          ],
        ),
      );
    }

    Widget searchBox() {
      return Row(
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: MyColors.whiteL2,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: MyColors.softGrey,
                      width: 1.5,
                    )),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: MyColors.blackText,
                      size: 35,
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      child: Text("Cari layanan, makanan, & tujuan",
                          style: TextStyle(color: MyColors.grey, fontSize: 15)),
                    )
                  ],
                )),
          ),
          SizedBox(width: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.network(
              "https://e-filling.smkn1ciamis.id/upload/avatar/avatar_Reihan%20Andika%20AM1646100687_300_x_300.webp",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          )
        ],
      );
    }

    Widget balance() {
      return Container(
        height: 130,
        decoration: BoxDecoration(
            color: MyColors.blue, borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  2,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                    height: 16,
                    width: 4,
                    decoration: BoxDecoration(
                        color: (balanceBalance == index)
                            ? MyColors.white
                            : MyColors.softGrey,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 90,
              width: 150,
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "IndoPay",
                        style: TextStyle(
                          color: MyColors.blackText,
                          fontSize: MyFontSize.large1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Saldo masih kosong",
                    style: TextStyle(
                      color: MyColors.blackText,
                      fontSize: MyFontSize.medium1,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Klik buat isi",
                    style: TextStyle(
                      color: MyColors.green,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: CustomButtonIcon(
                action: () {},
                iconPath: "assets/images/ic_bayar.png",
                text: "Bayar",
                fontColor: MyColors.white,
                height: 33,
                width: 33,
                isBold: true,
              ),
            ),
            Expanded(
              child: CustomButtonIcon(
                action: () {},
                iconPath: "assets/images/ic_topup.png",
                text: "Top Up",
                fontColor: MyColors.white,
                height: 33,
                width: 33,
                isBold: true,
              ),
            ),
            Expanded(
              child: CustomButtonIcon(
                action: () {},
                iconPath: "assets/images/ic_eksplor.png",
                text: "Eksplor",
                fontColor: MyColors.white,
                height: 33,
                width: 33,
                isBold: true,
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.green,
        title: tabBar(),
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(20),
            children: [
              searchBox(),
              SizedBox(height: 20),
              balance(),
              SizedBox(height: 20),
              CardGoClub(),
              SizedBox(height: 20),
              Subtitle(
                iconPath: "assets/images/ic_indoshop.png",
                iconText: "IndoPayBefore",
                subtitle: "Pake IndoPayBefore di Tokopedia",
                caption: "Belanja & nikmati beragam promo cashback istimewa hingga Rp 1,7 juta untukmu",
              ),
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate( 5,(index) => CardInfo(
                        imageUrl:
                            "https://mmc.tirto.id/image/otf/700x0/2021/04/14/kejar-diskon-tokopedia_ratio-16x9.jpg",
                        title: "Bongkar rahasia penjualan barang murah",
                        caption:
                            "Nikmatin perjalanan aman dan hemat naik IndoJek/IndoCar. Diskon sampai Rp 76.000 pake kode INDOMERDEKA. Klik!",
                      )),
                  ),
                ),
              SizedBox(height: 120),
            ],
          ),
          if (isBrush)
          Align(alignment: Alignment.topCenter, child: ScrollBrush()),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dy < 0) {
                  isCollapseNavBottom = false;
                  setState(() {});
                }

                if (details.delta.dy > 0) {
                  isCollapseNavBottom = true;
                  setState(() {});
                }
              },
              child: NavBottom(
                isCollapse: isCollapseNavBottom,
              )
            ),
          ),
        ],
      ),
    );
  }
}
