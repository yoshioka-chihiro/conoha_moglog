class Tag < ApplicationRecord
  
  has_many :tagmaps, dependent: :destroy
  has_many :diaries, through: :tagmaps
  
  def self.search(word)
    if word != '#'
      tag = Tag.where(tag_name: word)
      tag_diaries = tag.diaries
      @diaries = Kaminari.paginate_array(diaries).page(params[:page]).per(10)
    else
      Diary.all
    end
  end
  
  
  
end
