class Task < ApplicationRecord
  belongs_to :user #user_id属性が追加されActiveRecordがUserモデルとAttendanceモデルを紐付ける
end

