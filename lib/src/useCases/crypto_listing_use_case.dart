import 'package:crypto_listing/shared/repositories/crypto_listing_repository.dart';
import 'package:crypto_listing/src/mapper/charts_listing_mapper.dart';
import 'package:crypto_listing/src/mapper/crypto_listing_mapper.dart';
import 'package:crypto_listing/src/model/charts_listing_view_data.dart';
import 'package:crypto_listing/src/model/crypto_listing_view_data.dart';

class GetCryptoListingUseCase {
  final CryptoListingRepository repository;
  GetCryptoListingUseCase({required this.repository});

  Future<List<CryptoListingViewData>> execute() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await repository.getAllCryptoInfo();

    return response.toViewData();
  }

  Future<List<ChartsListingViewData>> start() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await repository.getAllChartsInfo();

    return response.toViewDataCharts();
  }
}
