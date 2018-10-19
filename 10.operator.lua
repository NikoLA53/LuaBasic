--	数学运算符
-- 	+ - * / % ^(求幂) -
--[[
a=-2
b=4
print(-a)
--]]

--	关系运算符
--	== ~=(不等) > < >= <=
--[[
a=25
b=30
if a==b then
print("a==b")
else
print('a~=b')
end
--]]

--	逻辑运算符
--	and(&&) or(||) not(!)
 a=true
 b=false
 print(a and b)
 print (a or b)
 print(not a)

 --其他运算符
 --     .. 字符串拼接
 -- 	#取得字符串或表的长度,
 --只有当表的key为数字且连续且存在1的时候 #取得的长度才准确
 tab={}
 tab.key1='key1'
 tab.key2=2
 tab[1]=1
 tab[2]=2
 tab[3]=3
 print('#tab 长度是'..#tab)
 print('table.getn 长度是'..table.getn(tab))
 print('遍历表内所有元素:')
for	k,v in pairs(tab) do
	print(k..'-'..v)
end
