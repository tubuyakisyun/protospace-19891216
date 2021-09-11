class Prototype < ApplicationRecord
  belongs_to :user,            optional: true
  has_many :comments,          foreign_key: :prototype_id,          dependent: :destroy ##dependent: :destroy と foreign_key: :prototype_id,を追記しても解決しない
  has_one_attached :image,                                          dependent: :destroy ##dependent: :destroyを追記

  validates :title,            presence: true
  validates :catch_copy,       presence: true
  validates :concept,          presence: true
  validates :image,            presence: true
end
