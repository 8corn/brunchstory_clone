# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = ["여행", "그림.웹툰", "경제", "IT", "사진.촬영", "영화", "오늘의 책", "음악", "직장인들의 하루", "스타트업", "육아", "요리", "건강", "패션", "문화 예술", "건축", "역사", "철학", "반려동물", "사랑.이별"]
categories.each do |name|
  Category.create(name: name)
end