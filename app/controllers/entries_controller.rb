class EntriesController < ApplicationController
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      render json: { success: true }, status: :ok
    else
      render json: { success: false, errors: @entry.errors }, status: :unprocessable_entity
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def entry_params
    params.require(:entry).permit(:competition_id, :name, :email)
  end
end
