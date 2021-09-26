class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
        case resource
        when Admin
            admin_items_path
        when Customer
            show_path
        end
    end
    
    def after_sign_up_path_for(resource)
        case resource
        when Admin
            new_admin_session_path
        when Customer
            show_path
        end
    end
    
    def after_sign_out_path_for(resource)
        case resource
        when :admin
            new_admin_session_path
        when :customer
            root_path
        end
    end
    # signin&signupとsignoutではresourceの中身が違う。前者は#で後者が:
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:postcode])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    end
    
end