class Weixin::Router
  def initialize(type="text")
    @message_type = type
  end

  def matches?(request)
    xml_data = request.params[:xml]
    if xml_data and xml_data.is_a?(Hash)
      @message_type == request.params[:xml][:MsgType]
    end
  end
end

