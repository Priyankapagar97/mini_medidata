class SubjectsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        @subject = Subject.new(subject_params)
        if @subject.save
           
            render json: { notice: "Subject created successfully!!"}
            # redirect_to participants_path
        else
            render json: { error: "Subject not created successfully!!"}
        end
    end


    private

    def subject_params
        params.require(:subject).permit(:email, :invitation_send)
    end
end