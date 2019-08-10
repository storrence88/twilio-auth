class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :phone_number
  validates :phone_number, phone: { possible: false, allow_blank: true, types: [:mobile] }

  def is_verified?
    return true if is_verified
    return false if phone_number.empty?
    return false
  end
end
