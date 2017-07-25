require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should validate_presence_of(:campaign) }
  it { should validate_presence_of(:choice) }
  it { should validate_presence_of(:validity) }
end
