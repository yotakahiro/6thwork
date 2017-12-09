100.times do |i|

	User.seed_once(:id) do |user|
		user.id = i + 1
		user.email = "#{i}@#{i}"
		user.encrypted_password = "aaaaaa"

		Post.seed_once(:id) do |post|
			post.id = i + 1
			post.user_id = i + 1
			post.name = "#{i + 1}番目の初期データ"
			post.price = (i + 1) * 1000
			post.description = "#{i + 1}番目の初期データの説明文"
			PostImage.seed_once(:id) do |post_image|
				post_image.post_id = i + 1
				post_image.image = File.open("app/assets/images/face.jpg")
			end
		end
	end
end