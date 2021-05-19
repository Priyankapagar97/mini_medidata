class ParticipantsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        @participant = Participant.new(participant_params)
        if @participant.save
            ParticipantMailer.with( participant: @participant ).success_email(@participant).deliver_later
            render json: { notice: "Study created successfully!!"}
            # redirect_to participants_path
        else
            render :new
        end
    end

    private

    def participant_params
        params.require(:participant).permit(:email_address, :name, :study_id)
    end
end