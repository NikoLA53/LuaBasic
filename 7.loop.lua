--[[
lua中的循环

1.while
		while(condition)do

		end
		a=1
		while(a<=20)do	--20内的奇数
			if (a%2==1) then
			print(a)
			end
			a=a+1	--lua里面没有 ++ --
		end

2.for
		for var=start,end,step,do
			循环体
		end
		start(初始值),end(目标值),step(增加值默认为1)


3.repeat until    (do while)

	repeat	--重复
		循环体	--先执行一次,再判断条件
	until(condition)	--直到满足条件跳出

--]]


--[[
--1.数值for循环
for i=1,10,2 do	--每次增2
print(i)	--13579
end

for i=20,1,-1 do--每次减1
print(i)
end

--2.泛型for循环
tab1={key1='valu1',key2='valu2'}

for k,v in pairs(tab1)do
print(k..'-'..v)
end

tab2={10,20,30,40,50}
for i,v in pairs(tab2)do
print(i..'-'..v)
end


a=1
repeat
	print(a)
	a=a+1
until(a>10)
--]]

--循环嵌套
for i=1,10 do	--	使用for循环嵌套完成数字输出它数值的次数

	--[[
	for j=1,i do
	print(i)
	end
	--]]
	j=1
	while(j<=i)do	--内部换成while
	print(i)
	j=j+1
	end
end
