class Avaliacao < ApplicationRecord
  has_many :curtida, dependent: :destroy

  belongs_to :usuario
  belongs_to :musica
end
