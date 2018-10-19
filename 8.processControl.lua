--流程控制
--[[

if(boolean)then

end

if(boolean)then

else

end


if(boolean1)then

elseif (boolean2)

else

end
--]]

--[[
if(0)then
	print(0)	--0
end
--]]


a=10
if (a>10) then
	print('a大于10')
elseif (a<10) then		--elseif是连在一起的,elseif后也要加then
	print('a小于10')
else
	print('a等于10')
end



if b then
	print('b不为空')
else
	print('b为空')
end

a,b=1,2

function Compare()
if a<b then
		a,b=b,a
		return -1;	--也能返回Numble(double)
	elseif	a==b then
		return '相等' --可返回string
	end
	return a>b	--也可返回boolean

end
print(Compare())
print('a-'..a..'\nb-'..b)
