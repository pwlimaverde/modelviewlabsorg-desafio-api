import 'package:dependencies/dependencies.dart';

import '../features/consumo_api_ping/domain/usecase/model/data_api_response_ping.dart';
import '../features/consumo_api_random/domain/usecase/model/data_api_response_random.dart';
import '../features/consumo_api_validate/domain/usecase/model/data_api_response_validate.dart';
import '../models/pong_response_model.dart';


typedef CAPUsecase =  UsecaseBaseCallData<PongResponseModel, DataApiResponsePing>;
typedef CAPData =  Datasource<DataApiResponsePing>;

typedef CARUsecase =  UsecaseBaseCallData<PasswordSchemaModel, DataApiResponseRandom>;
typedef CARData =  Datasource<DataApiResponseRandom>;

typedef CAVUsecase =  UsecaseBaseCallData<ValidateSuccessModel, DataApiResponseValidate>;
typedef CAVData =  Datasource<DataApiResponseValidate>;
