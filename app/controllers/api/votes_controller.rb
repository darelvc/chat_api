class Api::VotesController < Api::BaseController
  private
  def parent
    if params[:message_id].present?
      @message ||= Message.find params[:message_id]
    elsif params[:ping_id].present?
      @ping ||= Ping.find params[:ping_id]
    elsif params[:picture_id].present?
      @picture ||= Picture.find params[:picture_id]
    end
  end

  def build_resource
    @vote = Vote.find_or_initialize_by(votable_id: parent.id, votable_type: parent.type, user: current_user).tap do |vote|
      vote.kind = params[:kind]
    end
  end

  def resource
    @vote
  end
end
