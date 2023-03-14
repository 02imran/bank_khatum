import 'package:hive/hive.dart';
part 'dowasco_account_model.g.dart';

@HiveType(typeId: 0)
class DowascoAccountModel {

  @HiveField(0)
  final String accountNumber;

  @HiveField(1)
  final String tittle;



  DowascoAccountModel({required this.accountNumber, required this.tittle});
}