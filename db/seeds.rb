categories = ["여행", "그림.웹툰", "경제", "IT", "사진.촬영", "영화", "오늘의 책", "음악", "직장인들의 하루", "스타트업", "육아", "요리", "건강", "패션", "문화 예술", "건축", "역사", "철학", "반려동물", "사랑.이별"]
categories.each do |name|
  Category.create(name: name)
end