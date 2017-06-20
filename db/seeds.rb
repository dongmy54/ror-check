# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "123456@qq.com", password: "123456", password_confirmation: "123456", is_admin: true)
User.create!(email: "456789@qq.com", password: "123456", password_confirmation: "123456")
puts "成功创建123456@qq.com管理员！"
puts "成功创建456789@qq.com用户！"


q1 = Question.new
q1.stem = "下面关于ruby说法正确的是？"
q1.a    = "ruby 是一种静态语言"
q1.b    = "ruby 起源于美国"
q1.c    = "ruby 是一种动态语言"
q1.d    = "ruby 中不能打开类"
q1.answer   = "C"
q1.note     = "ruby是一种动态语言，它起源于日本，在ruby中可以打开类"
q1.user_id = 1
q1.save!

q2 = Question.new
q2.stem = "rails 默认开发数据库是？"
q2.a    = "sqlite"
q2.b    = "mysql"
q2.c    = "postgresql"
q2.d    = "mongosql"
q2.answer   = "A"
q2.note     = "rails默认开发数据库是sqlite"
q2.user_id = 1
q2.save!

q3 = Question.new
q3.stem = "ruby中哪个是类变量？"
q3.a    = "@group"
q3.b    = "group"
q3.c    = "@@group"
q3.d    = "$group"
q3.answer   = "C"
q3.note     = "类变量以@@开头,实例变量以@开头, 局部变量以英文字母或_开头，全局变量以$开头，常量以大写字母开头"
q3.user_id = 1
q3.save!

q4 = Question.new
q4.stem = "下面关于散列的创建错误的是？"
q4.a    = "h1 = Hash.new"
q4.b    = "h1 = ash.new("")"
q4.c    = %Q[C、h1 = {a: "b",c: "d"}]
q4.d    = "h1 = Array.new"
q4.answer   = "D"
q4.note     = "Array.new是创建数组"
q4.user_id = 1
q4.save!
puts "成功创建4笔question资料"

questions = [
{   :stem => "下面关于数据验证的说法不正确的是？" ,
	:a    => "inclusion 检查属性的值是否在指定的集合中。",
	:b => "presence 检查属性值不能为空。" ,
	:c => "numerically 检查属性值只能包含数字。",
	:d => "comfirmation 会创建一个真实的属性，其名字为要验证的属性名后加 _confirmation。",
	:answer => "D",
	:note => "comfirmation创建的是虚拟属性，它的主要目的是用来判断用户两次输入是否一致。",
	:user_id => 1
}
]

questions.each_with_index do |q,i|
    @question = Question.new
	@question.stem = q[:stem]
	@question.a = q[:a]
	@question.b = q[:b]
	@question.c = q[:c]
	@question.d = q[:d]
	@question.answer = q[:answer]
	@question.note = q[:note]
	@question.user_id = q[:user_id]
	@question.save!
	puts "已创建完循环中第#{i+1}道试题"
end





