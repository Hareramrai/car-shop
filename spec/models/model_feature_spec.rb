# == Schema Information
#
# Table name: model_features
#
#  id            :bigint           not null, primary key
#  body_type     :integer
#  cylinders     :integer
#  displacement  :integer
#  manufacturer  :string
#  model         :string
#  series        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  body_color_id :bigint
#
# Indexes
#
#  index_model_features_on_body_color_id  (body_color_id)
#  index_model_features_on_body_type      (body_type)
#
# Foreign Keys
#
#  fk_rails_...  (body_color_id => body_colors.id)
#

require 'rails_helper'

RSpec.describe ModelFeature, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:series) }
    it { should validate_presence_of(:manufacturer) }
    it { should validate_presence_of(:body_type) }
    it { should validate_presence_of(:model) }
  end

  describe 'relationships' do
    it { should have_many(:vehicles) }
    it { should belong_to(:body_color) }
  end
end
