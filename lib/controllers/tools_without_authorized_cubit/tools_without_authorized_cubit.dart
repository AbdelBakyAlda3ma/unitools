import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitools/core/common/api_services.dart';
import 'package:unitools/core/errors.dart';
import 'package:unitools/models/tool_model.dart';
part 'tools_without_authorized_state.dart';

class ToolsWithoutAuthorizedCubit extends Cubit<ToolsWithoutAuthorizedState> {
  ToolsWithoutAuthorizedCubit() : super(ToolsWithoutAuthorizedInitial());
  static ToolsWithoutAuthorizedCubit get(context) => BlocProvider.of(context);
  int _pageNumber = 1;

  final List<ToolModel> _tools = [];
  Future<void> getAllToolsWithoutAuthorized({bool fromLoading = false}) async {
    if (fromLoading) {
      emit(ToolsWithoutAuthorizedFromPaginationLoading());
    } else {
      emit(ToolsWithoutAuthorizedLoading());
    }
    try {
      Response response = await ApiService.get(
        path:
            "/api/Tools/AllToolWithoutAuthorized?pageNumber=$_pageNumber&pageSize=10",
      );

      List<dynamic> data = response.data['data'];
      if (data.isNotEmpty) {
        _pageNumber++;
        for (var tool in data) {
          _tools.add(
            ToolModel.fromMap(tool),
          );
        }
      }

      emit(ToolsWithoutAuthorizedSuccess(tools: _tools));
    } on DioException catch (e) {
      emit(
        ToolsWithoutAuthorizedFailure(
          errMsg: errorMsg(e),
        ),
      );
    } catch (e) {
      emit(
        ToolsWithoutAuthorizedFailure(
          errMsg: 'Some thing went wrong ,Please try again later!',
        ),
      );
    }
  }
}
