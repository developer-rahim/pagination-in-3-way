import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginated_app/controller/passanger_view_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshPagination extends StatefulWidget {
  const PullToRefreshPagination({super.key});

  @override
  _PullToRefreshPaginationState createState() =>
      _PullToRefreshPaginationState();
}

class _PullToRefreshPaginationState extends State<PullToRefreshPagination> {
  final controller = Get.put(PassengerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infinite List Pagination"),
      ),
      body: Obx(
        () => SmartRefresher(
          controller: controller.refreshController,
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: () async {
            final result =
                await controller.getPullToRefreshPassengerData(isRefresh: true);
            if (result) {
              controller.refreshController.refreshCompleted();
            } else {
              controller.refreshController.refreshFailed();
            }
          },
          onLoading: () async {
            final result = await controller.getPullToRefreshPassengerData();
            if (result) {
              controller.refreshController.loadComplete();
            } else {
              controller.refreshController.loadFailed();
            }
          },
          child: ListView.separated(
            itemBuilder: (context, index) {
              final passenger = controller.passengers[index];

              return ListTile(
                title: Text(index.toString()),
                subtitle: Text(
                  passenger.airline![0].country.toString(),
                ),
                trailing: Text(
                  passenger.airline![0].name.toString(),
                  style: const TextStyle(color: Colors.green),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: controller.passengers.length,
          ),
        ),
      ),
    );
  }
}
