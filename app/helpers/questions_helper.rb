module QuestionsHelper
	def is_answered?(q)
		current_user.exams.last.answer_records.find_by(:stem => q.stem) != nil
	end

	def answer_option(q)
		if is_answered?(q)
          current_user.exams.last.answer_records.find_by(:stem => q.stem).rep_answer	
        end
	end
	
end
