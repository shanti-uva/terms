module TermsEngineAssistantOpenaiErrors
  extend ActiveSupport::Concern

  included do
    rescue_from Faraday::TooManyRequestsError, with: :handle_openai_rate_limit
  end

  private

  def handle_openai_rate_limit(error)
    openai_error = parse_openai_error(error)
    error_details = [openai_error[:type], openai_error[:code], openai_error[:message]].compact.join(" - ")

    Rails.logger.warn("OpenAI rate limit reached for admin assistant: #{error_details.presence || error.message}")

    @translations ||= {}
    notice = ["OpenAI rate limit reached. Parsed terms are shown without AI suggestions."]
    notice << openai_error[:message] if openai_error[:message].present?
    notice << "OpenAI error type: #{openai_error[:type]}" if openai_error[:type].present?
    notice << "OpenAI error code: #{openai_error[:code]}" if openai_error[:code].present?

    flash.now[:notice] = notice.join(" ")

    render "show", status: :too_many_requests
  end

  def parse_openai_error(error)
    body = error.response&.fetch(:body, nil)
    parsed_body = body.is_a?(String) ? JSON.parse(body) : body
    openai_error = parsed_body.is_a?(Hash) ? parsed_body["error"] : nil

    return {} unless openai_error.is_a?(Hash)

    {
      type: openai_error["type"],
      code: openai_error["code"],
      message: openai_error["message"]
    }
  rescue JSON::ParserError
    {}
  end
end

Rails.application.config.to_prepare do
  next unless defined?(Admin::AssistantsController)
  next if Admin::AssistantsController < TermsEngineAssistantOpenaiErrors

  Admin::AssistantsController.include TermsEngineAssistantOpenaiErrors
end
