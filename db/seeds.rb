# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "a@g", password: "HogeHoge")

EndUser.create!(
    email: "y@g",
    name: "吉岡千緩",
    nickname: "よっし",
    age: 27,
    height: 158,
    start_weight: 55,
    active_level: 0,
    objective_weight: 45,
    gender: 1,
    password: "123456"
    )

5.times do |n|
    EndUser.create!(
      email: "test#{n + 1}@t",
      name: "テスト太郎#{n + 1}",
      nickname: "タロちゃん#{n + 1}",
      age: 20 + n,
      height: 160 + n,
      start_weight: 47 + n,
      active_level: 0,
      objective_weight: 40  + n,
      gender: 0,
      password: "test#{n + 1}test"
    )
 end

30.times do |n|
   Food.create!(
      name: "food#{n + 1}",
      introduction: "100gあたり",
      calorie: Random.rand(1..500),
      protein: Random.rand(1..30),
      carbohydrate: Random.rand(1..50),
      fat: Random.rand(1..50),
      fiber: Random.rand(0.1..1)
   )
end

15.times do |n|
   start_day = Date.new(2022, 6, 1)
   end_day = Date.new(2022,6, 30)
   Condition.create!(
     end_user_id: 1,
     movement: 2,
     feel: 2,
     created_at: Random.rand(start_day..end_day),
     start_time: Random.rand(start_day..end_day)
   )
end

5.times do |n|
   Diary.create!(
   end_user_id: 1 + n,
   title: "test#{n + 1}めちゃくちゃ食べた",
   body: "今日は#{n + 1}合のご飯を食べた！"
   )
end

5.times do |n|
   DiaryComment.create!(
   end_user_id:1 + n,
   diary_id:5 - n,
   comment: "コメントテスト#{n + 1}"
   )
   end

5.times do |n|
   Favorite.create!(
    end_user_id: 1 + n,
    diary_id: 5 - n
   )
end

5.times do |n|
   Relationship.create!(
    follower_id: 1 + n,
    followed_id: 5 - n
   )
end


30.times do |n|
   start_day = Date.new(2022, 6, 1)
   end_day = Date.new(2022, 6, 30)
   Meal.create!(
    end_user_id: 1,
    meal_type: 2,
    record_time: Random.rand(start_day..end_day)
   )
end

30.times do |n|
   MealDetail.create!(
    meal_id: 1 + n,
    food_id: 1,
    quantity:  1
   )
end

30.times do |n|
   start_day = Date.new(2022, 6, 1)
   end_day = Date.new(2022, 6, 30)
   Weight.create!(
   end_user_id: 1,
   value: Random.rand(30..70),
   record_day: Random.rand(start_day..end_day)
   )
end
