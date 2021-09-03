class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 has_many :cart_items
 has_many :orders
 has_many :addresses
         
  enum is_subscribed: { 有効: 1, 退会済: 0 }
  
  validates :last_name,  presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :phone_number, presence: true
  validates :postcode,  presence: true
  validates :address, presence: true
end
