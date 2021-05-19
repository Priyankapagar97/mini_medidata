class StudyGroupsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
       
        @study_group = StudyGroup.new(study_group_params)

        if @study_group.save
            render json: { notice: "Study created successfully!!"}
        else
            render json: { error: "Could not create study!!"}
        end
    end

    def index
        @study_groups = StudyGroup.all
  	    render json: @study_groups
    end

    private
    def study_group_params
        params.require(:study_group).permit(:name)
    end

end 