--[[
a=5 --默认全局变量

print(type(a))	-->number

a="hello"

print(type(a))	-->string  变量的类型是根据值变化的

local b=10 --只有加了local才是局部变量,在代码块(从声明到结束)内有效,否则为nil

print(b)	-->10

function test()
	c=5	--全局变量
	local d=6 --生命周期是这个函数
end
print(c,d)	-->nil nil 因为他俩所在的函数没有运行,他俩也就是不存在的
test()
print(c,d)	-->5 nil 运行函数后,全局变量有值,而局部变量在函数结束时会被销毁


do	--自定义代码块,可以用来限制变量的作用域

	local a=10
	b=11;
	print('作用域内输出'..a,b) -->10 11
end
print(a,b)	-->hello 11

--由于作用域的区别局部变量的速度比全局变量快,一般尽可能使用局部变量

--]]

--多个变量同时赋值
x,y,z=10,20,'hello'	--x=10 y=20 z='hello'
print(x,y,z)	--10 20 hello

x,y=y,x	--两个变量交换的便捷写法
print(x,y)	--20 10

x,y=10,20,30
print(x,y)	--10 20

x,y,z=10,20
print(x,y,z)	--10 20 nil 值不够时是nil

function test()	--同时返回两个值的方法
	return 40,50
end
a=test()	--用一个变量接收,就赋前面的值
print(a)
a,b=test()	--两个变量接收,就按顺序赋值
print(a,b)

varTest='GlobalVar'
do
	varTest='localInput'
	local localVar='localVar'
	print(varTest,localVar)
end
print(varTest,localVar)
