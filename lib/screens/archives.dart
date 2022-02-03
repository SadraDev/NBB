import 'package:flutter/material.dart';
import 'package:nbb/models/sellsModel.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/widgets/admin_widgets/SellManager.dart';
import 'package:nbb/widgets/admin_widgets/archivesView.dart';

class ArchivesScreen extends StatefulWidget {
  const ArchivesScreen({Key? key}) : super(key: key);
  static const String id = 'archivesScreen';

  @override
  State<ArchivesScreen> createState() => _ArchivesScreenState();
}

class _ArchivesScreenState extends State<ArchivesScreen> {
  List<Sells> archives = [];
  List<dynamic> archivesCheckMarks = [];
  bool? loading;

  Future<void> getArchives() async {
    loading = true;
    this.archives = [];

    List<dynamic> archives = await Api.getSells();
    archivesCheckMarks = await Api.getSellsCheckMarks();

    setState(() {
      for (var archive in archives) {
        archive = Sells.fromJson(archive);
        for (Map<String, dynamic> archivesCheckMark in archivesCheckMarks) {
          if (archivesCheckMark['sell_id'] == archive.id) {
            archive.check1 = archivesCheckMark['check_1'];
            archive.check2 = archivesCheckMark['check_2'];
            archive.check3 = archivesCheckMark['check_3'];
            archive.archived = archivesCheckMark['archived'];
          }
        }
        if (archive.archived == 1) this.archives.add(archive);
      }
    });
    loading = false;
  }

  @override
  void initState() {
    super.initState();
    getArchives();
  }

  @override
  Widget build(BuildContext context) {
    return ArchivesView(
      onRefresh: getArchives,
      builder: (context) {
        List<Widget> archiveHolder = [
          const SellsManagerLoading(),
        ];
        if (!loading!) archiveHolder.removeAt(0);
        for (Sells archive in archives) {
          var newArchive = ArchiveViewHolderCard(
            archive: archive,
            onTap: () async {
              setState(() {
                if (archive.archived == 0) {
                  archive.archived = 1;
                } else if (archive.archived == 1) {
                  archive.archived = 0;
                }
              });
              await Api.updateSellsCheckMarks(
                  archive.check1, archive.check2, archive.check3, archive.id, archive.archived);
            },
          );
          archiveHolder.add(newArchive);
        }
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          children: archiveHolder,
        );
      },
    );
  }
}
