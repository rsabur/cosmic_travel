class MissionsController < ApplicationController

    def new
        @mission = Mission.new 
    end

    def create
        @mission = Mission.new(mission_params)
       
        if @mission.valid?
            @mission.save
            redirect_to scientist_path(@mission.scientist)
        else
            flash.now[:messages] = @mission.errors.full_messages[0]
            render :new
        end
    end

    private

    def mission_params
        params.require(:mission).permit(:scientist_id, :planet_id, :name)
    end
end
