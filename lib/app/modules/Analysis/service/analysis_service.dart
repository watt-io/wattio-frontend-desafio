import 'package:wattio_frontend_desafio_offkevyn/app/modules/Analysis/model/result_offert.dart';

import '../mock/cooperative_mock.dart';
import '../model/analysis.dart';
import '../model/cooperative.dart';

class AnalysisService {
  List<Cooperative> searchCooperative({required Analysis analysis}) {
    List<Cooperative> allCooperatives = CooperativeMock().cooperatives();
    // return allCooperatives;
    List<Cooperative> approvedCooperatives = [];

    approvedCooperatives = allCooperatives.where((cooperative) {
      bool isApproved = true;


      if (analysis.averageValueInvoice > cooperative.maxMonthlyAmount ||
          analysis.averageValueInvoice < cooperative.minMonthlyAmount) {
        isApproved = false;
      }


      if (!cooperative.propertyTypes.contains(analysis.propertType)) {
        isApproved = false;
      }


      if (!cooperative.states.contains(analysis.state)) {
        isApproved = false;
      }

      return isApproved;
    }).toList();

    return approvedCooperatives;
  }

  ResultOffert calcResult({required Analysis analysis, required Cooperative cooperative}) {
    return ResultOffert(
      cooperative: cooperative,
      annualSavings: (analysis.averageValueInvoice * 12) * cooperative.economy,
    );
  }
}
