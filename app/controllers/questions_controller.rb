class QuestionsController < ApplicationController

	def index
		@questions = Question.all
		@answer_record = AnswerRecord.new
	end

	def current_error
		@exam = current_user.exams.last
		@answer_records = @exam.answer_records
		@error_records = @answer_records.where(state: "error")
	end

	def all_error
        @exams = current_user.exams
	end

    def new
    	@question = Question.new
    end

    def create
    	@question = Question.new(question_params)
    	@question.user = current_user

    	if @question.save
    		redirect_to questions_path
    	else
    		render :new
    	end
    end

    def already_published
        if current_user
          @questions = current_user.questions
        else
            redirect_to root_path, alert:"请先登录"
        end
    end

    def edit
        @question = Question.find(params[:id])
    end

    def update
        @question = Question.find(params[:id])

        if @question.update(question_params)
            redirect_to already_published_questions_path, notice:"你对试题的修改已生效"
        else
            render :edit
        end
    end

    def destroy
        @question = Question.find(params[:id])

        if @question.destroy
            redirect_to already_published_questions_path, danger:"已将该题删除"
        end
    end

    def direct_login
        sign_in(User.first, scope: :user)
        flash[:notice]="😊您也成功登录"
        redirect_to "/"
    end
    
    private

    def question_params
    	params.require(:question).permit(:stem,:a,:b,:c,:d,:answer,:note)
    end
end