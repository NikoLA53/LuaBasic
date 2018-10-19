
	--type的用法
str=type("hello world")--type返回传入值的类型名 类型名是string类型的
print(str)-->string
print(type(8))-->number
print(type(print))-->function
print(type(nil))-->nil


	--nil的用法
tab1 = { "a","b","c",key1="val1","d"} --构造一个表,
for k, v in pairs(tab1) do --循环打印键值对
    print(k .. " - " .. v) --字符串连接使用的是..
end
tab1.key1=nil;--置空一个值
for k,v in pairs(tab1) do
	print(k .. "-" .. v)
end



	--Boolean布尔的用法   Lua 把 false 和 nil 看作是"假"，其他的都为"真"
print(type(true))
print(type(false))
print(type(nil))

if false or nil then--if(false||nil) {prin()} else (print())
		print("至少有一个是true")
else
		print("false和nil都是false")

end--相当于括号完了 do{ end}   then{ end}

tablle={1,2,3,4,key1='G',5}
--print('遍历一个数组和键值对都能存储的集合')
for k,v in pairs (tablle) do
	print(k..'-'..v)
end

	--string类型
--[[
str1="string1"
str2='string2'	--单双引号没区别

print(html)
print('字符串'..'拼接')	--用..来拼接字符串
print('10'+8)	-->数字字符串进行运算操作时,系统会自动把字符串转为数字
print('10'+'8')
print('www.baidu.com的长度为:'..#"www.baidu.com")	--使用#来获取字符串的长度
cnstr="这段中文字符"
print(cnstr..'的长度是'..#cnstr)	--一个中文字占3位数
--]]
