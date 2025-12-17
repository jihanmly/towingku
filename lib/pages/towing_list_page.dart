import 'package:flutter/material.dart';
import '../data/towing_data.dart';
import '../models/towing_model.dart';
import '../widgets/towing_card.dart';
import 'towing_detail_page.dart';

class TowingListPage extends StatefulWidget {
  final String vehicleType;
  const TowingListPage({Key? key, required this.vehicleType}) : super(key: key);

  @override
  State<TowingListPage> createState() => _TowingListPageState();
}

class _TowingListPageState extends State<TowingListPage> {
  String query = '';
  List<TowingModel> filtered = towingData;

  @override
  void initState() {
    super.initState();
    filtered = towingData;
  }

  void _search(String q) {
    setState(() {
      query = q;
      filtered = towingData.where((t) {
        final lower = q.toLowerCase();
        return t.name.toLowerCase().contains(lower) || t.location.toLowerCase().contains(lower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Towing — ${widget.vehicleType}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: _search,
              decoration: const InputDecoration(
                hintText: 'Cari nama atau lokasi...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('Tidak ada hasil'))
                : ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (_, idx) {
                      final towing = filtered[idx];
                      return TowingCard(
                        towing: towing,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => TowingDetailPage(towing: towing)),
                          );
                        },
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
