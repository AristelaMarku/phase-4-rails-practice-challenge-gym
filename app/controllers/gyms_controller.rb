class GymsController < ApplicationController

    def show
    gym=Gym.find_by(id:params[:id])
    if gym
    render json: gym, status: :ok
    else
    render json: {error: "Not found"}, status: :not_found
    end
    end


    def destroy
    gym=Gym.find_by(id:params[:id])
    if gym
        gym.destroy
        head :no_content
    else
       render json: {error: "Gym not found"}, status: :not_found
    end
    end 

    def create
     gym=Gym.create(gym_params)
     render json: gym, status: :created
    end

    def update
    gym=Gym.find_by(id:params[:id])
    if gym
        gym.update(gym_params)
        render json: gym, status: :ok
    else
        render json: {error: "Not found"}, status: :not_found
    end
    end


    private

    def gym_params
    params.permit(:name, :address)
    end

end
