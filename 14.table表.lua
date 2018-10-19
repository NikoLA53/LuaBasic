--table 表

mytable={}	--	初始化表

mytable[1]='Lua'	--指定值

--mytable=nil	--移除引用 Lua垃圾回收会释放内存
--[[
for k,v in pairs(mytable) do print(k..'-'..v)end

for k,v in ipairs(mytable) do print(k..'-'..v)end

i=1
--while(i<=#mytable) do print(..'-'..mytable[i]) i=i+1 end

repeat print(i..'-'..mytable[i]) i=i+1 until(i>#mytable)
--]]
print(type(mytable))	--类型是table
mytable['wow']='修改前'
print('mytable索引为1的元素是',mytable[1])
print('mytable索引为wow的元素是',mytable['wow'])

mytable1=mytable	--mytable1和mytable指向的是同一个table
print('mytable1索引为1的元素是',mytable1[1])
print('mytable1索引为wow的元素是',mytable1['wow'])

mytable1['wow']='修改后'	--	修改key为wow的值

print('mytable索引为wow的元素是',mytable['wow'])	--相当于通过栈引用 修改了table在堆内存上的值

mytable1=nil --释放引用
print('mytable1是',mytable1)	--	mytable1是nil
print('mytable索引为wow的元素是',mytable['wow'])	--	mytable仍然可以访问

mytable=nil	--这下table所有的引用都空了 会在合适的时候回收
print('mytable是',mytable)	--	mytable是nil

print('-------------------------------table的方法-------------------------------------')

fruits={'banana','orage','apple'}
--concat连接所有元素,返回操作后的所有元素
print('连接后的字符串',table.concat(fruits))
print('添加了分隔符连接后的字符串',table.concat(fruits,','))	--table后面的参数是分割父
print('指定索引的字符串连接',table.concat(fruits,',',2,3))	-- orage,apple 只连接2~3的元素

--insert插入和remove移除
table.insert(fruits,1,'mango')	--没返回值
print('首位插入元素',table.concat(fruits,','))
table.remove(fruits,3)
print('移除',table.concat(fruits,','))

--sort排序
table.sort(fruits)
print('升序排序后',table.concat(fruits,','))	--目前只会升序排序..

--最大值
nums={key1=nil,key2=nil,3,key3=6,5,2}
--print('最大值是',table.maxn(nums))	--.maxn方法在5.2以后就没了
--自己写个最大值排序吧
function Max(tab)
	maxn=nil
	for k,v in pairs(tab) do
		if v~=nil then
			if maxn==nil then
				maxn=v
			end
			if maxn<v then
				maxn=v
			end
		end
	end

	--[[			--这两种方法都采用的是数组惯用方法循环(未包含键值对的值)，其实使用迭代器来遍历table更符合Lua的语言
					--毕竟他的table里面啥都有,如果单纯对比数组的话可以这样算,否则使用迭代器遍历会包含所有的值(包括键值对)
	i=1
	repeat
		if  tab[i]~=nil then
			if maxn==nil then
				maxn=tab[i]
			end
			if maxn<tab[i] then
					maxn=tab[i]
			end
		end
		i=i+1
	until i>#tab
	--]]
--------------------------------------------这两种方法在表中带有键值对时--对比结果会出现错误-----------------------------------------------
	--[[							--原因是#table以及table.getn 其都会在索引中断的地方停止计数
	maxn=nil
	for i=1,#tab do
		if tab[i]~=nil then
			if maxn==nil then
				maxn=tab[i]
			end
			if maxn<tab[i] then
				maxn=tab[i]
			end
		end
	end
	--]]




	return maxn
end

print('最大值是',Max(nums))
print('#table',#nums)	--3
print('table.getn',table.getn(nums))	--3

function GetLength(tab)
	local len=0
	for k,v in pairs(tab)do
		len=len+1
		print(k..'-'..v)
	end
	return len
end
print('自己写的GetLength',GetLength(nums))	--4 包含了键值对的数字






