class StudiesController < ApplicationController
    skip_before_action :verify_authenticity_token

    # around_action :demo_around_action

    def create
        @study_group = StudyGroup.find(params[:study_group_id]) 
       
        @study = @study_group.studies.create(study_params)

        if @study.save
            # StudyMailer.with( study: @study ).success_email.deliver_later
            # render json: { notice: "Study created successfully!!"}
            redirect_to studies_path
        else
            # render json: { error: "Could not create study!!"}
            render :new
        end
    end

    def index
        puts "Index method called"
        @studies = Study.all
        # @study_group = StudyGroup.find(params[:study_group_id])
        # @studies = @study_group.studies.all
        @studies123 = Study.all
        # render json: @studies
    end

    def new
        @study ||= Study.new
    end

    def active
        
    end

    def show
        
    end

    def edit
        
    end

    def update
        
    end

    def update
        @study = Study.find(params[:id])

        if @study.update(study_params)
            render json: { notice: "Study updated successfuly!!"}
        else
            render json: { error: "Could not find study!!"}
        end
    end

    def destroy
        @study = Study.find(params[:id])
        @study.destroy
        render json: { status: 'success', message: 'delete the study', data: study}
    end

    private

    def demo_around_action
        p "this is at the beggining"
        yield
        p "this is after action call"
    end

    def study_params
        params.require(:study).permit(:name, :age_limit, :drug, :phase, :study_group_id, :symptoms, :my_image)
    end
end