class Curtida < ApplicationRecord
  belongs_to :usuario
  belongs_to :avaliacao

  validates :usuario_id, presence: true
  validates :avaliacao_id, presence: true
end
