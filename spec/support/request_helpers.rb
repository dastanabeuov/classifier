# frozen_string_literal: true

module RequestHelpers
  def json
    @json ||= JSON.parse(response.body)
  end

  def do_request(method, path, params = {})
    send method, path, params
  end
end
