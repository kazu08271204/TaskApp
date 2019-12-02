class Task < ApplicationRecord
  belongs_to :user #user_id属性が追加されActiveRecordがUserモデルとAttendanceモデルを紐付ける
  
  #presence(存在しているか？)がtrueの場合にのみデータが保存される,〇文字以内か？
  validates :contentname, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 30}
end

