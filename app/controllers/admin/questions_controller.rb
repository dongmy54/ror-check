class Admin::QuestionsController < ApplicationController
   before_action :authenticate_user!
   before_action :admin_require

   def index
   	  @questions = Question.all
   end

   def edit
   	  @question = Question.find(params[:id])
   end

   def update
       @question = Question.find(params[:id])
       if @question.update(question_params)
          redirect_to admin_questions_path
          flash[:notice] = "您的修改已生效"
      else
      	render :edit
       end
   end
   
   def destroy
   	  @question = Question.find(params[:id])
   	  @question.destroy
   	  redirect_to admin_questions_path
   	  flash[:notice] = "已成功删除试题"
   end

   private

   def question_params
   	 params.require(:question).permit(:stem, :a, :b, :c, :d, :answer, :note)
   end

end
