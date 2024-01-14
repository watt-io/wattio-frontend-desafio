import 'dart:convert';
import 'package:desafio/app/constants/app_colors.dart';
import 'package:desafio/app/model/company_model.dart';
import 'package:desafio/app/widgets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController moneyValueController = TextEditingController();

  GlobalKey<FormState> formKeyUserLogin = GlobalKey<FormState>();

  RxBool isLoadingCompany = false.obs;

  List<CompanyModel> companies = [];

  /// read json file companys
  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString('assets/json/companys.json');
      final Map<String, dynamic> jsonMap = json.decode(response);

      final List<dynamic> companyListJson = jsonMap['company'];
      companies = companyListJson.map((json) {
        json['minimum_value_month'] = json['minimum_value_month'].toDouble();
        json['maximum_value_month'] = json['maximum_value_month'].toDouble();
        return CompanyModel.fromJson(json);
      }).toList();

      debugPrint(companies.length.toString());
    } catch (e) {
      debugPrint('Error to read json file $e');
    }
  }

  /// validate get companys
  void validadeCompany() {
    double moneyValue = getDoubleValue(moneyValueController);
    if (formKeyUserLogin.currentState!.validate() &&
        moneyValue > 0.0 &&
        selectedFormOfHiring.value.isNotEmpty &&
        selectedContractPlan.value.isNotEmpty &&
        selectedPaymentTerm.value > 0) {
      readJson().then((_) {
        filterCompanies();
      });
      isLoaded.value = true;
      clearVariablesFilter();
    } else {
      Get.snackbar(
        'Preencha todos os campos obrigatórios!',
        '',
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  ///form_of_hiring
  RxString selectedFormOfHiring = ''.obs;

  void changeFormOfHiring(String value) {
    selectedFormOfHiring.value = value;
    debugPrint(selectedFormOfHiring.value);
  }

  ///contract_plan
  RxString selectedContractPlan = ''.obs;

  void changeContractPlan(String value) {
    selectedContractPlan.value = value;
    debugPrint(selectedContractPlan.value);
  }

  /// payment_term
  RxInt selectedPaymentTerm = 0.obs;

  void changePaymentTerm(int value) {
    selectedPaymentTerm.value = value;
    debugPrint(selectedPaymentTerm.value.toString());
  }

  /// apply filters in list companys
  List<CompanyModel> applyFilters({
    double? minValue,
    double? maxValue,
    String? contractPlan,
    String? formOfHiring,
    int? paymentTerm,
  }) {
    return companies.where((company) {
      if (minValue != null &&
          maxValue != null &&
          (company.minimumValueMonth > minValue || company.maximumValueMonth < maxValue)) {
        return false;
      }

      if (paymentTerm != null && company.paymentTerm != paymentTerm) {
        return false;
      }

      if (formOfHiring != null && company.formOfHiring != formOfHiring) {
        return false;
      }

      if (contractPlan != null && company.contractPlan != contractPlan) {
        return false;
      }

      return true;
    }).toList();
  }

  RxList<CompanyModel> filteredCompanies = <CompanyModel>[].obs;

  RxBool isLoaded = false.obs;
  void filterCompanies() async {
    try {
      isLoadingCompany.value = true;
      await Future.delayed(const Duration(seconds: 2));
      double typedValue = getDoubleValue(moneyValueController);

      double? minValue = typedValue;
      double? maxValue = typedValue;
      String? contractPlan = selectedContractPlan.value;

      String? formOfHiring = selectedFormOfHiring.value;

      int? paymentTerm = selectedPaymentTerm.value;

      filteredCompanies.value = applyFilters(
        minValue: minValue,
        maxValue: maxValue,
        contractPlan: contractPlan,
        formOfHiring: formOfHiring,
        paymentTerm: paymentTerm,
      );
      isLoadingCompany.value = false;
    } catch (e) {
      isLoadingCompany.value = false;
      debugPrint('Error company list $e');
    }
  }

  RxInt selectedIndex = RxInt(-1);
  double discount = 0.0;
  String contractPlan = '';
  RxDouble valueDescont = 0.0.obs;
  RxString nameCompany = ''.obs;
  RxInt months = 0.obs;
  RxDouble discountAmount = 0.0.obs;

  /// calculate value discount
  void calculateValue() async {
    try {
      isLoadingSaveContract.value = true;
      await Future.delayed(const Duration(seconds: 2));
      double moneyValue = getDoubleValue(moneyValueController);
      months.value;
      switch (contractPlan) {
        case 'Mensal':
          months.value = 12;
          break;
        case 'Trimestral':
          months.value = 3;
          break;
        case 'Semestral':
          months.value = 6;
          break;
        case 'Anual':
          months.value = 12;
          break;
        default:
          throw Exception('Plano de contrato inválido');
      }

      double total = moneyValue * months.value;
      discountAmount.value = total * discount;
      double discountedValue = discountAmount / months.value;
      valueDescont.value = discountedValue;
      isLoadingSaveContract.value = false;
    } catch (e) {
      isLoadingSaveContract.value = false;
      debugPrint('Error calculate value: $e');
    }
  }

  RxBool isLoadingSaveContract = false.obs;

  void validadeCompanyContract() async {
    clearVariables();
    Get.dialog(
      AppDialog(
        onTap: () {
          Get.back();
        },
      ),
      barrierDismissible: false,
    );
  }

  ///common methods

  clearVariables() {
    filteredCompanies.clear();
    discount = 0.0;
    contractPlan = '';
    valueDescont.value = 0.0;
    months.value = 0;
    discountAmount.value = 0.0;
    selectedIndex.value = -1;
    moneyValueController.text = '';
    selectedFormOfHiring.value = '';
    selectedContractPlan.value = '';
    selectedPaymentTerm.value = 0;
    isLoaded.value = false;
  }

  clearVariablesFilter() {
    filteredCompanies.clear();
    discount = 0.0;
    contractPlan = '';
    valueDescont.value = 0.0;
    months.value = 0;
    discountAmount.value = 0.0;
    selectedIndex.value = -1;
  }

  /// clean e convertion R$ to double
  double getDoubleValue(TextEditingController? controller) {
    try {
      if (controller == null || controller.text.isEmpty) {
        return 1.0;
      } else {
        String currentValue = controller.text;
        String onlyDigits = currentValue.replaceAll(RegExp('[^0-9]'), '');
        double doubleValue = double.parse(onlyDigits) / 100;
        return doubleValue;
      }
    } catch (e) {
      debugPrint('Error converting value: $e');
      return 0.0;
    }
  }
}
