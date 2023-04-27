// abstract class Failure {
//   @override
//   List<Object> get props => [];
// }

// General failures
import 'package:flutter_example/features/UserList/domain/usecase/user_list_usecase.dart';

class FailureMessage extends Failure {
  String message;

  FailureMessage(this.message);
}