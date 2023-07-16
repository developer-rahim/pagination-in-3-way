import 'package:get/get.dart';
import 'package:paginated_app/model/passnager_model.dart';
import 'package:paginated_app/repository/passanger_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PassengerController extends GetxController {
  final _repository = PassangerRepository();

  PassengersResponseModel? _passengersResponseModel;

  Future<List<Passenger>> getPassengerData(int currentPage) async {
    var res = await _repository.getPassengerData(currentPage: currentPage);

    _passengersResponseModel = PassengersResponseModel.fromJson(res);

    return _passengersResponseModel!.data!;
  }

  ///   ............Pull-To-Refresh.............///

  int currentPage = 1;

  late int totalPages;

  RxList<Passenger> passengers = <Passenger>[].obs;

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getPullToRefreshPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }

    var response =
        await PullToRefreshPassangerRepository().getPassengerData(currentPage);

    if (response.statusCode == 200) {
      final result = passengersResponseModelFromJson(response.body);

      if (isRefresh) {
        passengers.value = result.data!;
      } else {
        passengers.addAll(result.data!);
      }

      currentPage++;

      totalPages = result.totalPages!;

      print(response.body);

      return true;
    } else {
      return false;
    }
  }
}
