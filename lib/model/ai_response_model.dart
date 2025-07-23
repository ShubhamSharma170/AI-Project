class AiResponseModel {
  List<Choices>? choices;
  double? created;
  String? id;
  String? model;
  String? object;
  String? systemFingerprint;
  Usage? usage;

  AiResponseModel({
    this.choices,
    this.created,
    this.id,
    this.model,
    this.object,
    this.systemFingerprint,
    this.usage,
  });

  AiResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(Choices.fromJson(v));
      });
    }
    created = json['created'];
    id = json['id'];
    model = json['model'];
    object = json['object'];
    systemFingerprint = json['system_fingerprint'];
    usage = json['usage'] != null ? Usage.fromJson(json['usage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (choices != null) {
      data['choices'] = choices!.map((v) => v.toJson()).toList();
    }
    data['created'] = created;
    data['id'] = id;
    data['model'] = model;
    data['object'] = object;
    data['system_fingerprint'] = systemFingerprint;
    if (usage != null) {
      data['usage'] = usage!.toJson();
    }
    return data;
  }
}

class Choices {
  String? finishReason;
  int? index;
  Null logprobs;
  Message? message;

  Choices({this.finishReason, this.index, this.logprobs, this.message});

  Choices.fromJson(Map<String, dynamic> json) {
    finishReason = json['finish_reason'];
    index = json['index'];
    logprobs = json['logprobs'];
    message = json['message'] != null
        ? Message.fromJson(json['message'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['finish_reason'] = finishReason;
    data['index'] = index;
    data['logprobs'] = logprobs;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class Message {
  String? content;
  String? role;

  Message({this.content, this.role});

  Message.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['role'] = role;
    return data;
  }
}

class Usage {
  int? completionTokens;
  double? completionTokensAfterFirstPerSec;
  double? completionTokensAfterFirstPerSecFirstTen;
  double? completionTokensAfterFirstPerSecGraph;
  double? completionTokensPerSec;
  double? endTime;
  bool? isLastResponse;
  int? promptTokens;
  PromptTokensDetails? promptTokensDetails;
  double? startTime;
  String? stopReason;
  double? timeToFirstToken;
  double? totalLatency;
  int? totalTokens;
  double? totalTokensPerSec;

  Usage({
    this.completionTokens,
    this.completionTokensAfterFirstPerSec,
    this.completionTokensAfterFirstPerSecFirstTen,
    this.completionTokensAfterFirstPerSecGraph,
    this.completionTokensPerSec,
    this.endTime,
    this.isLastResponse,
    this.promptTokens,
    this.promptTokensDetails,
    this.startTime,
    this.stopReason,
    this.timeToFirstToken,
    this.totalLatency,
    this.totalTokens,
    this.totalTokensPerSec,
  });

  Usage.fromJson(Map<String, dynamic> json) {
    completionTokens = json['completion_tokens'];
    completionTokensAfterFirstPerSec =
        json['completion_tokens_after_first_per_sec'];
    completionTokensAfterFirstPerSecFirstTen =
        json['completion_tokens_after_first_per_sec_first_ten'];
    completionTokensAfterFirstPerSecGraph =
        json['completion_tokens_after_first_per_sec_graph'];
    completionTokensPerSec = json['completion_tokens_per_sec'];
    endTime = json['end_time'];
    isLastResponse = json['is_last_response'];
    promptTokens = json['prompt_tokens'];
    promptTokensDetails = json['prompt_tokens_details'] != null
        ? PromptTokensDetails.fromJson(json['prompt_tokens_details'])
        : null;
    startTime = json['start_time'];
    stopReason = json['stop_reason'];
    timeToFirstToken = json['time_to_first_token'];
    totalLatency = json['total_latency'];
    totalTokens = json['total_tokens'];
    totalTokensPerSec = json['total_tokens_per_sec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['completion_tokens'] = completionTokens;
    data['completion_tokens_after_first_per_sec'] =
        completionTokensAfterFirstPerSec;
    data['completion_tokens_after_first_per_sec_first_ten'] =
        completionTokensAfterFirstPerSecFirstTen;
    data['completion_tokens_after_first_per_sec_graph'] =
        completionTokensAfterFirstPerSecGraph;
    data['completion_tokens_per_sec'] = completionTokensPerSec;
    data['end_time'] = endTime;
    data['is_last_response'] = isLastResponse;
    data['prompt_tokens'] = promptTokens;
    if (promptTokensDetails != null) {
      data['prompt_tokens_details'] = promptTokensDetails!.toJson();
    }
    data['start_time'] = startTime;
    data['stop_reason'] = stopReason;
    data['time_to_first_token'] = timeToFirstToken;
    data['total_latency'] = totalLatency;
    data['total_tokens'] = totalTokens;
    data['total_tokens_per_sec'] = totalTokensPerSec;
    return data;
  }
}

class PromptTokensDetails {
  int? cachedTokens;

  PromptTokensDetails({this.cachedTokens});

  PromptTokensDetails.fromJson(Map<String, dynamic> json) {
    cachedTokens = json['cached_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cached_tokens'] = cachedTokens;
    return data;
  }
}
