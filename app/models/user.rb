class User < ApplicationRecord
  has_many :posts
  has_many :audit_logs

  has_many :staff_members_associations, class_name: 'StaffMember'
  has_many :staff_members, through: :staff_members_associations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :phone

  PHONE_REGEX = /\A[0-9]*\Z/

  validates_format_of :phone, with: PHONE_REGEX

  validates :phone, length: { is: 10 }

  def full_name
    "#{last_name}, #{first_name}".upcase
  end
end
