class Vote < ApplicationRecord
  validates :campaign, presence: true
  validates :choice, presence: true
  validates :validity, presence: true
end
