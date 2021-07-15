# frozen_string_literal: true

module UsersHelper
  def get_user_roles
    roles = User.user_roles.keys
    roles.map { |role| [role.gsub('_', ' ').capitalize, role] }
  end
end
