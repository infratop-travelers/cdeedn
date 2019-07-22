class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    def pull_down_menu(model)
      menu_array = []
      model.each do |m|
        menu_array += [[m.name, m.id]]
      end
      return menu_array
    end
    
    protected
    def configure_permitted_parameters
        added_attrs = [ :last_name, :first_name, :read_last_name, :read_first_name, :post_code, :prefecture, :city, :street, :phone_number, :email, :encrypted_password]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end

