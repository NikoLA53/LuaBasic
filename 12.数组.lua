--Lua的数组--
array={'C#','Lua'}
for i=1,#array do print(array[i])end

array={};	--数组置空
for i=-2,2 do array[i]=i end --数组可以从负数的索引赋值
array.key='value'

for k,v  in pairs(array) do print(k..'-'..v) end	--但打印键值对的话会先从1开始,再打印键值对,最后才是负索引的值

function P()
	i=-2
	while(i<=#array) do
		print(array[i])
		i=i+1
	end

	repeat
		print(array[i])
		i=i+1
	until i>#array
end

P()

--多维数组(3*3)
mutiTable={}	--	初始化横数组
for i=1,3 do
	mutiTable[i]={}	--初始化纵数组
	for j=1,3 do
		mutiTable[i][j]={}	--初始化深度数组
		for k=1,3 do
			mutiTable[i][j][k]=i*j*k
		end
	end
end

for i=1,3 do
	for j=1,3 do
		for k=1,3 do
			print(mutiTable[i][j][k])
		end
	end
end
