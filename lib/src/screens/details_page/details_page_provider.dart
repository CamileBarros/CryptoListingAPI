import 'package:crypto_listing/shared/repositories/crypto_listing_repository_provider.dart';
import 'package:crypto_listing/src/model/charts_listing_view_data.dart';
import 'package:crypto_listing/src/model/crypto_listing_view_data.dart';
import 'package:crypto_listing/src/useCases/crypto_listing_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCryptoListingUseCase = Provider((ref) {
  return GetCryptoListingUseCase(
      repository: ref.read(cryptoListingRepositoryProvider));
});

final cryptoListingProvider =
    FutureProvider<List<CryptoListingViewData>>((ref) async {
  return ref.read(getCryptoListingUseCase).execute();
});

final chartsListingProvider =
    FutureProvider<List<ChartsListingViewData>>((ref) async {
  return ref.read(getCryptoListingUseCase).start();
});
// [0,1,2,3] List = List[2] = 2
// {name: Carlos} Posicoes = Posicoes.name = carlos