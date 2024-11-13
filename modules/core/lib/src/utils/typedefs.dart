import 'package:dependencies/dependencies.dart';

import '../features/consumo_api_ping/domain/usecase/model/data_api_response_ping.dart';
import '../models/pong_response_model.dart';


typedef CAPUsecase =  UsecaseBaseCallData<PongResponseModel, DataApiResponsePing>;
typedef CAPData =  Datasource<DataApiResponsePing> ;
