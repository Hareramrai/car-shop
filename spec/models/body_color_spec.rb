# == Schema Information
#
# Table name: body_colors
#
#  id         :bigint           not null, primary key
#  exterior   :string
#  interior   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe BodyColor, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:interior) }
    it { should validate_presence_of(:exterior) }
  end

  describe 'relationships' do
    it { should have_many(:model_features) }
  end
end
