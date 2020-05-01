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

FactoryBot.define do
  factory :model_feature do
    manufacturer { "MyString" }
    model { "MyString" }
    series { "MyString" }
    body_type { "" }
    cylinders { "MyString" }
    displacement { "MyString" }
    body_color { nil }
  end
end
