class Usuario < ApplicationRecord
  has_many :curtida, dependent: :destroy
  has_many :avaliacao, dependent: :destroy
end
