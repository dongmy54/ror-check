class Exam < ApplicationRecord
	belongs_to :user
	has_many :answer_records
end
