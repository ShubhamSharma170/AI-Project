import 'package:ai_project/constant/ai_api.dart';
import 'package:ai_project/model/ai_response_model.dart';
import 'package:ai_project/network_manager/http_helper.dart';

class RestClient {
  static final HttpHelper httpHelper = HttpHelper();
  AiResponseModel aiResponseModel = AiResponseModel();

  static Future<AiResponseModel> getChatBotData(String content) async {
    Map<String, dynamic> response = await httpHelper.postAPI(
      url: chatBotUrl,
      body: {
        "model": model,
        "messages": [
          {"role": "user", "content": content},
        ],
      },
      isRequiredAuthorization: true,
    );

    return AiResponseModel.fromJson(response);
  }
}
