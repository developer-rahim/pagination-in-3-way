import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:get/get.dart';
import 'package:paginated_app/controller/passanger_view_controller.dart';
import 'package:paginated_app/model/passnager_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(PassengerController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  static const int PAGE_SIZE = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infinite List Pagination"),
      ),
      body: PagewiseListView<Passenger>(
        pageSize: PAGE_SIZE,
        itemBuilder: _itemBuilder,
        pageFuture: (pageIndex) {
          return controller.getPassengerData(pageIndex! + 1);
        },
      ),
    );
  }

  Widget _itemBuilder(context, Passenger passenger, _) {
    return ListTile(
      title: Text(passenger.name.toString()),
      subtitle: ListView.builder(
          itemCount: passenger.airline!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Text(passenger.airline![index].country.toString());
          }),
    );
  }
}
