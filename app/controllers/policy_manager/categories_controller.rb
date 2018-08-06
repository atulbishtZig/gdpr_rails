require_dependency "policy_manager/application_controller"

module PolicyManager
  class CategoriesController < ApplicationController

    before_action :allow_admins

    # GET /categories
    def index
      @categories = PolicyManager::Config.rules
      respond_to do |format|
        format.html{ }
        format.json{ render json: @categories }
      end
    end

    # GET /categories/1
    def show
      @category = PolicyManager::Config.rules.find{|o| o.name == params[:id]}
      @terms = @category.terms.paginate(:page => params[:page], 
                                        :per_page => 12)
        respond_to do |format|
            format.html{ }
            format.json{ render json: @terms }
          end
    end

    private
  end
end
