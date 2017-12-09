class Post < ApplicationRecord
	belongs_to :user
	has_many :post_images, dependent: :destroy
	accepts_attachments_for :post_images, attachment: :image
	acts_as_ordered_taggable_on :categories
	acts_as_taggable

	# scope :find_by_category, -> (categories) {
	#  	#タグが入力されている場合のみタグを条件に抽出
	#  	if categories.present?
	#  		tagged_with(categories, match_all: true)
	#  	end
	#  }
end
