module UsersHelper
    def display_login_error
        if flash[:loginerror]
          content_tag(:p, flash[:loginerror])
        end
    end
end
