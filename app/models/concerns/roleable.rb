module Roleable
  extend ActiveSupport::Concern

  ROLES = %i[
    admin
    personal_escolar
  ].freeze

  def add_valid_role(role)
    if ROLES.include?(role)
      update(role: role)
    else
      errors.add(:roles, :invalid)
    end
  end

  def admin?
    role.to_sym == :admin
  end

  def personal_escolar?
    role.to_sym == :personal_escolar
  end
end
