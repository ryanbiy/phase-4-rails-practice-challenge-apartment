class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
    def index 
      leases = Lease.all
      render json: leases
    end
  
    def show 
      lease = find_lease
      render json: lease
    end
  
    def create 
      lease = Lease.create!(lease_params)
      render json: lease, status: :created
    end
  
    def update 
      lease = find_lease
      lease.update!(lease_params)
      render json: lease
    end
  
    def destroy 
      lease = find_lease
      lease.destroy
      render json: { success: "Lease was deleted successfully" }
    end
  
    private
  
    def find_lease
      Lease.find(params[:id])
    end
  
    def lease_params
      params.permit(:rent, :apartment_id, :tenant_id)
    end
  
    def render_not_found_response
      render json: { error: "Lease not found" }, status: :not_found
    end
  
    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
  end
  