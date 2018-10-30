class Post < ApplicationRecord
    def sum_of_totaldistance
        posts = Post.all
        total_distance =0
        for var in posts do
          c_distance = var.content_distance
          total_distance += c_distance
        end
        return total_distance
    end
    
    def sum_of_contentdistance(strings)
        string = strings
        characters = string.chars #1文字1文字に分解（データは配列）
        
        content_distance = 0#データベースから文字距離を引っ張ってくる。なおかつ変数距離に代入してく
        for var in characters do
          c_distance = Character.find_by(character: var)
          content_distance += c_distance.character_distance
        end
        return content_distance
    end
    
    def case_totalputs(total_distance)
        case total_distance
          when 0..100
            total_puts = "CDAの誕生"
          when 100..200
            total_puts = "100m到達！！ウサイン・ボルトと走ろう"
          else
            total_puts = "我々は未開の地に足を踏み入れたようだ..."
        end
    end
end
