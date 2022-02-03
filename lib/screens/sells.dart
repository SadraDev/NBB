import 'package:flutter/material.dart';
import 'package:nbb/models/sellsModel.dart';
import 'package:nbb/screens/archives.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/widgets/admin_widgets/sellManager.dart';
import 'package:nbb/widgets/admin_widgets/sellManagerCard.dart';

class SellsScreen extends StatefulWidget {
  const SellsScreen({Key? key}) : super(key: key);
  static const String id = 'sellsScreen';

  @override
  _SellsScreenState createState() => _SellsScreenState();
}

class _SellsScreenState extends State<SellsScreen> {
  List<Sells> sells = [];
  List<dynamic> sellsCheckMarks = [];
  bool? loading;

  Future<void> getSells() async {
    loading = true;
    this.sells = [];

    List<dynamic> sells = await Api.getSells();
    sellsCheckMarks = await Api.getSellsCheckMarks();

    setState(() {
      for (var sell in sells) {
        sell = Sells.fromJson(sell);
        for (Map<String, dynamic> sellsCheckMark in sellsCheckMarks) {
          if (sellsCheckMark['sell_id'] == sell.id) {
            sell.check1 = sellsCheckMark['check_1'];
            sell.check2 = sellsCheckMark['check_2'];
            sell.check3 = sellsCheckMark['check_3'];
            sell.archived = sellsCheckMark['archived'];
          }
        }
        if (sell.archived != 1) this.sells.add(sell);
      }
    });
    loading = false;
  }

  @override
  void initState() {
    super.initState();
    getSells();
  }

  @override
  Widget build(BuildContext context) {
    return SellsManager(
      onRefresh: getSells,
      builder: (context) {
        List<Widget> sellHolder = [
          SellsManagerViewArchive(
            onTap: () => Navigator.pushNamed(context, ArchivesScreen.id),
          ),
          const SellsManagerLoading(),
        ];
        if (!loading!) sellHolder.removeAt(1);
        for (Sells sell in sells) {
          var newHolder = SellsManagerCard(
            sell: sell,
            checker1: (value) async {
              setState(() {
                if (sell.check1 == 0) {
                  sell.check1 = 1;
                } else if (sell.check1 == 1) {
                  sell.check1 = 0;
                }
              });
              await Api.updateSellsCheckMarks(sell.check1, sell.check2, sell.check3, sell.id, sell.archived);
            },
            checker2: (value) async {
              setState(() {
                if (sell.check2 == 0) {
                  sell.check2 = 1;
                } else if (sell.check2 == 1) {
                  sell.check2 = 0;
                }
              });
              await Api.updateSellsCheckMarks(sell.check1, sell.check2, sell.check3, sell.id, sell.archived);
            },
            checker3: (value) async {
              setState(() {
                if (sell.check3 == 0) {
                  sell.check3 = 1;
                } else if (sell.check3 == 1) {
                  sell.check3 = 0;
                }
              });
              await Api.updateSellsCheckMarks(sell.check1, sell.check2, sell.check3, sell.id, sell.archived);
            },
            archiver: () async {
              setState(() {
                if (sell.archived == 0) {
                  sell.archived = 1;
                } else if (sell.archived == 1) {
                  sell.archived = 0;
                }
              });
              await Api.updateSellsCheckMarks(sell.check1, sell.check2, sell.check3, sell.id, sell.archived);
            },
          );
          sellHolder.add(newHolder);
        }
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          children: sellHolder,
        );
      },
    );
  }
}
