import '../../models/proposal_model.dart';

abstract class IRepositoryApi {
  Future<List<ProposalModel>?> getApiData();
}
