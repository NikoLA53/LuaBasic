tab1={}	--构造了一个空表,{}是构造表达式
tab2={key1=100,key2='val2',1,'2'}
for k,v in pairs(tab2) do	--foreach取得键值对
print(k..'-'..v..type(k)..type(v))
end


tab2={}
for i=1,7,2 do	--for循环赋值
	tab2[i]=i*i;
end
--[[for i=1,7 do
	if tab2[i] == nil then
		print(i..'=nil')
	else
		print(i..'-'..tab2[i7	end
end
--]]
print('Repeat循环测试')
i=1;
repeat
	if tab2[i]== nil then
		print(i..'=nil')
	else
		print(i..'-'..tab2[i])
	end
	i=i+1;
	until i>7;

--key只有两种类型,string和number
tab3={'apple','pear','orage','grape'}
print(tab3[2])	--索引从1开始[0]是nil

--table的大小是动态的,不会固定

--数据的添加
tab2[10]=1000	--一般用在数组的值上
tab2.key1=2		--一般用在字符串为key的值上
for k,v in pairs(tab2) do
print(k..'--'..v)
end

--数据的删除
tab2.key1=nil;	--设置值为nil他的key也就nil了
for k,v in pairs(tab2) do
print(k..'-'..v)
end

--任何表里面的key都是不连续的,删除一个就少一个,数组后面的不会顶上来
