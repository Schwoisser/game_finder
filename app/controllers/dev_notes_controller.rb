class DevNotesController < ApplicationController

  def index
    return "unauthorized" unless current_user.is_admin
    @dev_notes = DevNote.all
  end

  def show
    @dev_note = DevNote.find(params[:id])
  end

  def new
    return "unauthorized" unless current_user.is_admin
    @dev_note = DevNote.new
  end

  def create
    return "unauthorized" unless current_user.is_admin
    dev_note = DevNote.new(dev_note_params)
    dev_note.user = current_user
    dev_note.save
    redirect_to dev_notes_path
  end

  def edit
    return "unauthorized" unless current_user.is_admin
    @dev_note = DevNote.find(params[:id])
  end

  def update
    return "unauthorized" unless current_user.is_admin
    @dev_note = DevNote.find(params[:id])
    @dev_note.user = current_user
    @dev_note.save
    @dev_note.update(dev_note_params)
    redirect_to dev_notes_path
  end



  def dev_note_params
    params.require(:dev_note).permit(:title, :intro, :text, :image )
  end
end