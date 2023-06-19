class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
    end

    # def show
    #     spice = find_spice
    #     render json: spice
    # rescue ActiveRecord::RecordNotFound
    #     spice_not_found
    # end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    rescue ActiveRecord::RecordNotFound
        spice_not_found
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        spice_not_found
    end

    private 

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        spice = Spice.find_by(id:params[:id])
    end

    def spice_not_found
        render json: { error: "Spice not found" }, status: :not_found
    end
end
