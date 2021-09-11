class Prototype < ApplicationRecord
  belongs_to :user,            optional: true
  has_many :comments,          dependent: :destroy ##dependent: :destroy と foreign_key: :prototype_id,を追記しても解決しない
  has_one_attached :image,     ##dependent: :destroyを追記しても解決しない

  validates :title,            presence: true
  validates :catch_copy,       presence: true
  validates :concept,          presence: true
  validates :image,            presence: true
end
