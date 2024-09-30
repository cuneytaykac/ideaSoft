import 'package:json_annotation/json_annotation.dart';

import '../../../data_provider_core/interfaces/base_network_model.dart';

part 'currency.g.dart';

@JsonSerializable()
class Currency extends BaseNetworkModel<Currency> {
  int? id;
  String? label;
  String? abbr;

  Currency({this.abbr, this.id, this.label});

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyToJson(this);

  @override
  Currency fromJson(Map<String, dynamic> json) {
    return Currency.fromJson(json);
  }
}
