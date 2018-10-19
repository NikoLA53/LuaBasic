--[[
[local] function  functionName(arg1,arg2)--局部函数与变量一样可以添加local关键字
	functionBody
	[return val1,val2...valn]	--可选
end
--]]
local function max(num1,num2)
	if num1> num2 then
		return num1
	else
		return num2
	end
end
print(max(1,2))

--函数可以作为数据赋值 作为参数传递(类似委托事件)

temp=max
print(temp(2,3))

myPrint= function (param)
          print('这是我自己的打印方法'..param)
			end


function add(num1,num2,func)--函数作为参数,类似匿名函数
	func(num1,num2)
end
add(2,3,
		function(num1,num2)
		print(num1..'加'..num2..'等于'..num1+num2)
		end
	)

--lua里面的函数可以返回多个值

function temp()
return 1,3,5
end
res1,res2,res3,res4,res4=temp();
print(res1,res2,res3,res4,res4)	-->1 3 5 nil nil



--lua 的方法的可变参数
--print()方法的参数就是可变参数
function test(...)	--可变参数用三个点来表示
	--print(arg[1])	--arg是默认存储可变参数的表,但他最后一位存的是可变参数的个数
	local args={...}	--定义一个自己的表来存储可变函数就不会出现错误
	for k,v in pairs(args) do
		print(v)
	end
end
test(5,2,4,6)

--获取平均值的可变参数方法
function average(...)
	local nums={...}
	local temp=0
	for k,v in pairs(nums)do
	temp=temp+v
	end
	--return temp/table.getn(nums)	--table.getn(tab)获得表内key是序列时的长度,且表中不能有nil
	return temp/#nums	--#tab也可以获得表内元素的个数

end

print('平均值是:'..average(1,2,3,4,5))

TestTable={1,nil,3,key1='四',5}
print( '#table的长度是'..#TestTable..'\n.getn的长度是'..table.getn(TestTable))



