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

class BodyColor < ApplicationRecord
end
