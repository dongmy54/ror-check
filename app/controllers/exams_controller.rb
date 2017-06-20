class ExamsController < ApplicationController
    
    def index
    	@exams = current_user.exams
        if @exams.last.score == nil
        	n = @exams.length
           @pure_exams = @exams[ 0, n-1]
       else
       	   @pure_exams = @exams
        end
    	

    	exam_dates = @pure_exams.map { |t| t.updated_at.strftime("%Y/%m/%d")}

    	@data = {
    		labels: exam_dates,
    		datasets: [
    			{
    			label: "历次考试成绩走势",
    			data: @pure_exams.map { |t| t.score  },
    			backgroundColor: "#DEFCF9",
    			borderColor: "#CADEFC",
			    pointBackgroundColor: "#CCA8E9",
                pointHoverBackgroundColor: "#C3BEF0",
    			}
    		]
    	}

    end

	def result
		@exam = current_user.exams.last

		if @exam != nil && @exam.score == nil
		@answer_records = @exam.answer_records
                	
		score = 0
		correct_quantity = 0
		total_quantity = @answer_records.size
       
		@answer_records.all.each do |r|
          if r.answer == r.rep_answer
          	 score += 2
          	 correct_quantity += 1
          	 r.state = "correct"
          	 r.save!
          else
              r.state = "error"
              r.save!
          end
		end

		@exam.score            = score
		@exam.correct_quantity = correct_quantity
		@exam.total_quantity   = total_quantity
		@exam.save!
       
       if total_quantity != 0
       flash[:notice] = "本次共测试#{total_quantity}道题;其中正确#{correct_quantity}道;正确率为#{(correct_quantity/total_quantity) * 100 }%;得分为#{score}"
       redirect_to questions_path
       else
	   flash[:alert] = "你交的是白卷！"
	   redirect_to questions_path
	   end

	elsif @exam != nil && @exam.score != nil 
		flash[:alert] = "你正在重复交卷，你上次成绩为#{@exam.score}分"
		redirect_to root_path
	else
		flash[:alert] = "请先到首页点击开始测试，再做答，最后才能交卷"
		redirect_to root_path
	end

	end


	def start_test  

	      if current_user

	      	if current_user.exams != [] && current_user.exams.last.answer_records == []
	      		flash[:alert] = "你上一次的试卷还没做答，现在开始答题吧！"
	      		redirect_to questions_path
	      	elsif current_user.exams != [] && current_user.exams.last.answer_records.first.state == "temp"
	      		flash[:alert] = "上次测试，你还没有交卷哦！赶快交卷吧！"
	      		redirect_to questions_path
	      	else
		        @exam = Exam.new
		        @exam.user = current_user
		        @exam.save!
		        redirect_to questions_path
		    end

	      else
	        flash[:alert] = "请先登录，然后开始测试！"
	        redirect_to root_path
	      end
    end


end
