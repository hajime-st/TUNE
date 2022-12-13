module ApplicationHelper
  #お題に設定されたジャンルが曲のジャンルと合致するかを調べる
  def genre_include?(song_genres, theme_genre)
    # binding.pry
    if !song_genres.empty?
      song_genres.each_with_index do |song_genre, index|
        case song_genre
        when *theme_genre
          return true
        else
          return false if index == song_genres.size - 1
        end
      end
    end

  end
end
