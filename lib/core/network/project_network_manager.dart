import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/model/base_model.dart';

class ProjectNetworkManager {
  static ProjectNetworkManager? _instance;
  static ProjectNetworkManager get instance {
    if (_instance != null) return _instance!;
    _instance = ProjectNetworkManager._init();
    return _instance!;
  }

  final String _baseUrl = "https://rickandmortyapi.com/api";
  late final Dio dio;
  ProjectNetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        final data = e.data;
        if (data is Map<String, dynamic>) {
          final model = BaseResponseModel.fromJson(data);
          if (model.info?.count == 0) {
            handler.reject(DioError(requestOptions: RequestOptions(path: e.realUri.path)));
            return;
          }
          e.data = data['results'];
        }
        handler.next(e);
      },
    ));
  }
}
