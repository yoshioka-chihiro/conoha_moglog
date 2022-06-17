# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
   { name: '田中ゆうこ', nickname: 'タナカ',  age: 24, height: 155, start_weight: 57, active_level: 0, objective_weight: 40, gender: 1, email: 'tanaka@t', password: 'TanakaYuko' },
   { name: '森山太郎', nickname: 'モリ', age: 27, height: 175, start_weight: 77, active_level: 2, objective_weight: 60, gender: 0, email: 'moriyama@t', password: 'MoriyamaTaro' },
   { name: '山田太郎', nickname: 'ヤマダ', age: 37, height: 185, start_weight: 97, active_level: 1, objective_weight: 70, gender: 0, email: 'yamada@t', password: 'YamadaTaro' },
   { name: '秋山なお', nickname: 'ナオチャン', age: 18, height: 160, start_weight: 47, active_level: 1, objective_weight: 40, gender: 1, email: 'akiyama@t', password: 'AkiyamaNao' }
]

EndUser.create(users)

