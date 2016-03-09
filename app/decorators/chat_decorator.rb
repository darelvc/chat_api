class ChatDecorator < Draper::Decorator
  delegate_all

  decorates_association :users

  def as_json params = {}
    {
      id: id,
      name: name,
      description: description
    }.tap do |hash|
      hash[:users] = users unless params[:short]
    end
  end
end
