class Usuario < ApplicationRecord
validates :nome, presence: true
validates :email, presence: true, uniqueness: true 
has_many :enderecos
has_many :posts



end

