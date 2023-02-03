class Invoice < ApplicationRecord
  validates :name, presence: true
end
