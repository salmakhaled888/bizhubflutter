import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassCubit() : super(ResetPassInitial());

  
  void resetPasswordCheck({required var newpassword, required var confirmpassword}) async {
    try{
        //Use Api for reset password
        emit(ResetPassLoaded());
    } catch (e){
        emit(ResetPassFailure ());
    }   
  }
}
