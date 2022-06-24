# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup)
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "a@g", password: "HogeHoge")

EndUser.create!(
  [
    {email: "yuki@test.com", name: "佐々木 あや子", nickname: "あーちゃん", age: 26, height: 158, start_weight: 54, active_level: 0, objective_weight: 47, gender: 1, password: "123456"},
    {email: "yuka@test.com", name: "須藤 結賀", nickname: "ユカ", age: 27, height: 158, start_weight: 55, active_level: 0, objective_weight: 45, gender: 1, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: "misa@test.com", name: "馬場 未佐霞", nickname: "ミサミサ", age: 35, height: 162, start_weight: 65, active_level: 0, objective_weight: 55, gender: 1, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: "kikuo@test.com", name: "蔭佐 喜久生", nickname: "キクオ", age: 45, height: 185, start_weight: 85, active_level: 0, objective_weight: 75, gender: 0, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: "eri@test.com", name: "渡辺 えり子", nickname: "えりぴよ", age: 28, height: 159, start_weight: 77, active_level: 1, objective_weight: 47, gender: 1, password: "123456"},
    {email: "yoshiya@test.com", name: "舛田 慶也", nickname: "yoshiya", age: 17, height: 175, start_weight: 55, active_level: 2, objective_weight: 65, gender: 0, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: "loid@test.com", name: "下鉢 ロイド", nickname: "ロイド", age: 32, height: 167, start_weight: 57, active_level: 2, objective_weight: 62, gender: 0, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {email: "tyoko@test.com", name: "佐藤 蝶子", nickname: "ちょーこ", age: 25, height: 165, start_weight: 57, active_level: 2, objective_weight: 53, gender: 1, password: "123456"},
    {email: "juri@test.com", name: "信濃 ジョエリー", nickname: "ジュリー", age: 25, height: 170, start_weight: 55, active_level: 1, objective_weight: 50, gender: 1, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")},
    {email: "ayamo@test.com", name: "菊池 礼百", nickname: "Ayamo", age: 23, height: 156, start_weight: 45, active_level: 1, objective_weight: 35, gender: 1, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")},
    {email: "kuwa@test.com", name: "鋤 幸雄", nickname: "クワちゃん", age: 24, height: 165, start_weight: 60, active_level: 2, objective_weight: 70, gender: 1, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")},
    {email: "itiro@test.com", name: "吉田 一郎", nickname: "ダイエッター", age: 29, height: 165, start_weight: 87, active_level: 0, objective_weight: 77, gender: 0, password: "123456"},
    {email: "taro@test.com", name: "山田 太郎", nickname: "たろてゃ", age: 20, height: 175, start_weight: 57, active_level: 2, objective_weight: 67, gender: 0, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")},
    {email: "hana@test.com", name: "田中 花子", nickname: "はなてゃ", age: 20, height: 155, start_weight: 47, active_level: 1, objective_weight: 43, gender: 1, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")},
    {email: "keiji@test.com", name: "森山 圭治", nickname: "KG", age: 27, height: 178, start_weight: 67, active_level: 2, objective_weight: 67, gender: 0, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename:"sample-user11.jpg")},
    {email: "ten@test.com", name: "天 董", nickname: "テンドー", age: 55, height: 165, start_weight: 87, active_level: 1, objective_weight: 73, gender: 0, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user12.jpg"), filename:"sample-user12.jpg")},
    {email: "noriyasu@test.com", name: "乗安 鎭芸", nickname: "ノブ", age: 66, height: 175, start_weight: 77, active_level: 0, objective_weight: 66, gender: 0, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user13.jpg"), filename:"sample-user13.jpg")},
    {email: "to@test.com", name: "袈裟丸 統", nickname: "とー", age: 59, height: 165, start_weight: 57, active_level: 2, objective_weight: 60, gender: 0, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user14.jpg"), filename:"sample-user14.jpg")},
    {email: "masao@test.com", name: "稲村 正男", nickname: "まさおくん", age: 79, height: 159, start_weight: 57, active_level: 2, objective_weight: 65, gender: 0, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user15.jpg"), filename:"sample-user15.jpg")},
    {email: "okuoku@test.com", name: "奥田 湖紫渚", nickname: "奥ちゃん", age: 78, height: 155, start_weight: 87, active_level: 0, objective_weight: 57, gender: 1, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user16.jpg"), filename:"sample-user16.jpg")},
    {email: "shimityan@test.com", name: "志見 紋加", nickname: "アヤカ", age: 54, height: 165, start_weight: 57, active_level: 1, objective_weight: 54, gender: 1, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user17.jpg"), filename:"sample-user17.jpg")},
    {email: "yua@test.com", name: "小河 結愛", nickname: "ゆあてゃ", age: 49, height: 155, start_weight: 57, active_level: 2, objective_weight: 49, gender: 1, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user18.jpg"), filename:"sample-user18.jpg")},
    {email: "arako@test.com", name: "荒子 舞奈", nickname: "マナ", age: 65, height: 149, start_weight: 50, active_level: 0, objective_weight: 45, gender: 1, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user19.jpg"), filename:"sample-user19.jpg")},
    {email: "haruka@test.com", name: "河村 遥香", nickname: "はるぴ", age: 59, height: 175, start_weight: 67, active_level: 2, objective_weight: 63, gender: 1, password: "123456", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user20.jpg"), filename:"sample-user20.jpg")},
    {email: "nokati@test.com", name: "渡部 乃華", nickname: "のかぴ", age: 68, height: 178, start_weight: 63, active_level: 2, objective_weight: 56, gender: 1, password: "123456"}
  ]
  )

15.times do |n|
  start_day = Date.new(2022, 5, 24)
  end_day = Date.new(2022,6, 24)
  Condition.create!(
    end_user_id: 1,
    movement: Random.rand(0..4),
    feel: Random.rand(0..2),
    created_at: Random.rand(start_day..end_day),
    start_time: Random.rand(start_day..end_day)
  )
end

# 10.times do |n|
#   Diary.create!(
#   end_user_id: 1 + n,
#   title: "めちゃくちゃ食べた",
#   body: "今日はご飯を食べた！"
#   )
# end

# 10.times do |n|
#   DiaryComment.create!(
#   end_user_id:2 + n,
#   diary_id:1 + n,
#   comment: "コメントテスト#{n + 1}"
#   )
# end

# 10.times do |n|
#   Favorite.create!(
#     end_user_id: 1 + n,
#     diary_id: 5 - n
#   )
# end

10.times do |n|
  Relationship.create!(
    follower_id: 1 + n,
    followed_id: 1 + n
  )
end


# 30.times do |n|
#   start_day = Date.new(2022, 6, 1)
#   end_day = Date.new(2022, 6, 30)
#   Meal.create!(
#     end_user_id: 1,
#     meal_type: 2,
#     record_time: Random.rand(start_day..end_day)
#   )
# end

# 30.times do |n|
#   MealDetail.create!(
#     meal_id: 1 + n,
#     food_id: 1,
#     quantity:  1
#   )
# end

30.times do |n|
  start_day = Date.new(2022, 5, 24)
  end_day = Date.new(2022, 6, 24)
  Weight.create!(
  end_user_id: 1,
  value: Random.rand(40..80),
  record_day: Random.rand(start_day..end_day)
  )
end

require "csv"

CSV.foreach('db/pf_food.csv',headers: true) do |row|
  Food.create!(
    id: row['id'],
    name: row['name'],
    protein: row['protein'],
    calorie: row['calorie'],
    fat: row['fat'],
    fiber: row['fiber'],
    carbohydrate: row['carbohydrate'],
    introduction: row['introduction']
  )
end
