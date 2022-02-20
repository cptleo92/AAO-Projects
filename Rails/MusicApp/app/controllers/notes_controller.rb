class NotesController < ApplicationController  
  before_action :require_logged_in!

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.save
    redirect_to track_url(@note.track_id)  
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    if current_user == @note.user
      @note.destroy
      redirect_to track_url(@note.track_id)  
    else
      render text: "Can only delete your own notes!", status: :forbidden
    end
  end

  private
  def note_params
    params.require(:note).permit(:text, :user_id, :track_id)
  end

end