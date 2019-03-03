# frozen_string_literal: true

class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include Roleable

  validates :first_name, :last_name,
            :id_number, :role, presence: true
  validates :id_number, uniqueness: true

  has_many :registries, dependent: :nullify

  def full_name
    "#{first_name} #{last_name}"
  end

end
