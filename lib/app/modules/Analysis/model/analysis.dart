// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../shared/enum/property_type.dart';
import '../../../shared/util/brazilian_states.dart';

class Analysis {
  double averageValueInvoice;
  PropertType propertType;
  State state;

  Analysis({
    required this.averageValueInvoice,
    required this.propertType,
    required this.state,
  });

  @override
  String toString() => 'Analysis(averageValueInvoice: $averageValueInvoice, propertType: $propertType, state: $state)';
}
