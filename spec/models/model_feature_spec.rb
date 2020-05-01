# == Schema Information
#
# Table name: model_features
#
#  id            :bigint           not null, primary key
#  body_type     :integer
#  cylinders     :string
#  displacement  :string
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
  pending "add some examples to (or delete) #{__FILE__}"
end
