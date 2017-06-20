class AnswerRecordsController < ApplicationController

	def create
	  if current_user && Exam.where(user: current_user).last.total_quantity == nil
		
		rep_answer = params[:answer_record][:rep_answer]
		question_id = params[:answer_record][:question_id]
        question = Question.find(question_id)
        exam = Exam.where(user: current_user).last

		if rep_answer != nil
           	@answer_record = AnswerRecord.where(user: current_user,state: "temp",stem: question.stem).first
            
		  if @answer_record
		  	 @answer_record.rep_answer = rep_answer
		  	 @answer_record.save!
		  else
			@answer_record            = AnswerRecord.new
			@answer_record.style      = question.style
			@answer_record.stem       = question.stem
			@answer_record.a          = question.a
			@answer_record.b          = question.b
			@answer_record.c          = question.c
			@answer_record.d          = question.d
			@answer_record.answer     = question.answer
			@answer_record.note       = question.note
			@answer_record.rep_answer = rep_answer
			@answer_record.user       = current_user
			@answer_record.exam       = exam
			@answer_record.save!
		  end
	  
	      flash[:notice] = "您已提交第#{question.id}题"
	      @question = question
	    else
	    	flash[:warning] = "你没有选择任何选项"
	    	redirect_to questions_path
	    end

	  else
         flash[:alert] = "请确保你处于登录状态且已点击开始答题"
         redirect_to root_path
     end	
	end



end
