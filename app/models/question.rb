class Question < ApplicationRecord
    validates :stem, :a, :b, :c, :d, :answer, :note, presence: { message: "亲，关键信息不能为空哦！"}
    validates :answer, inclusion: { in: %w(A B C D), message: "%{value} 不是有效值，有效值只能为 A B C D中的一个"}
   
	belongs_to :user
end
