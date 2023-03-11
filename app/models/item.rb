class Item < ApplicationRecord
  belongs_to :list, dependent: :destroy
  validates :description, presence: true
end
