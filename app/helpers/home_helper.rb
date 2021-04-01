module HomeHelper
  def format_header(_user)
    result = ' '
    if user_signed_in?
      result << link_to('sign out', destroy_user_session_path, data: {
                          method: :delete
                        }, class: 'nav-link text-white')
      result << link_to('edit profile', edit_user_registration_path, class: 'nav-link text-white')
    else
      result << link_to('sign up', new_user_registration_path, class: 'nav-link text-white')
      result << link_to('sign in', new_user_session_path, class: 'nav-link text-white')

    end
    result.html_safe
  end
end
