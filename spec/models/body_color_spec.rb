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
  pending "add some examples to (or delete) #{__FILE__}"
end
