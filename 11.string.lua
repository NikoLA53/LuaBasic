--1.定义字符串
-- ' '   " "  [[ ]]

--2.转义字符
--[[
\n 换行 \\ 一个反斜杠  \" 代表"   \' 代表'

--]]

path='C:\\Users\\\nNicolas\\\'Desktop\'\\"Lua教程"'
print(path)

str='my name is NikoLA!~'
str=string.upper(str)	--字符串大写API

--str=string.lower(str)	--string小写API

str=string.gsub(str,'S','$',1)	--替换API Gsub区分大小写,最后一个参数是从前往后最大替换次数,默认最大

index=string.find(str,'N',5) --查找匹配字符的方法,返回第一个匹配的索引,后面的参数是起始位置(包含),默认从1开始,

restr=string.reverse(str)	--字符串反转

num1,num2=1,2
strformat=string.format('%d+%d=%d',num1,num2,num1+num2)	--%d代表number类型的参数

username,password='nikola','666666'
--'%s'来代表字符串的格式,注意如果有字符串符号嵌套最好外部用" 内部用'
strformat1=string.format("select * from user where username = '%s' password = '%s'",username,password)

strDate=string.format('%d年%02d月%02d日',2018,1,1)	--02d是补足两位,数字以此类推

print( 'asc码转字母'..string.char(97,98,99,100))	--asc码转字母
print(string.byte("ABCD",4))
print('字母转asc码'..string.byte("ABCD"))	--字母转asc码 ,只能转一个

name='NikoLA'
print('字符串长度'..string.len(name)..#name)	--string.len(name)..#name这俩效果一样
print(string.rep(name,2))	--返回字符串的n个拷贝

print(str)
print('查找的字符所在位置是:'..index)
print('字符串反转'..restr)
print('字符串格式化'..strformat)
print('字符串格式化写sql语句'..strformat1)
for word in string.gmatch('hello lua users','%a+')  do print(word) end	--打印所有由空格分开的串  %a+连续的字母组成的串(正则表达式)

-----------------------------------------------------------------------------------------------------------------

--闭包测试
--闭包的数据隔离(一个闭包不同的引用之间数据隔离)
function BiBaoTest()
	local i=0	--upvalue  内函数可访问在其所在作用域内的局部变量
	return function()
		 i=i+1;
		 return i
	end
end
bibao1=BiBaoTest();
bibao2=BiBaoTest();
print(bibao1())--1
print(bibao1())--2 访问同样的闭包时其upvalue不会初始化
print(bibao2())--1 各自引用的闭包之间数据隔离 类似工厂模式下产生的不同对象

--闭包的数据共享(一个闭包内的子闭包之间数据共享)
function VarShare(n)
	local function a()
		print(n)
	end
	local function b()
		n=n+1
		print(n)
	end
	return a,b
end
local aa,bb=VarShare(100) --接收返回值的时候要注意权限修饰符local只能用local接
aa()	--100
bb()	--101
aa()	--101
bb()	--102
