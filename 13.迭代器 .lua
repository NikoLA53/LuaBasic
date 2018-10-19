--迭代器--
array={'c',nil,'c#'}
for	k,v in pairs(array)do print(k..' '..v)end
-- c c# 跳过了nil值

for k,v in ipairs(array) do print(k..' '..v)end	--Lua 默认提供的迭代函数 ipairs 只能迭代连续的数组,如果中间有nil值会跳出迭代
-- C 遇到nil直接跳出

--无状态迭代器

function Squre(iteratorMaxCount,curNum)--利用此函数实现无状态迭代器,参数是 最大迭代次数[状态常量],和当前数字[控制变量]
	if curNum<iteratorMaxCount then
		curNum=curNum+1		--控制变量会不断的赋值返回,供下次迭代使用,而状态常量只在最开始迭代的时候读取一次
		return curNum,curNum*curNum
	end

end

for curNum,SqureNum in Squre,3,0 do	--循环调用 注意这里的写法与kv那种不一样自己写的迭代器后面不用像调用函数一样加括号传参,而是这种不好形容的方式....
	print(curNum..' '..SqureNum)
end


-- ipairs 默认迭代器内部应该是这样实现的,最后封装了一下
function iter (tab, i)
    i = i + 1
    local v = tab[i]
    if v then
       return i, v
    end
end

function mipairs (tab)
    return iter, tab, 0
end

for k,v in mipairs(array) do print(k..' '..v)end


--根据这个再封装一下刚才的平方迭代器
function sqriter(tab,i)--	由于模拟的是ipairs迭代器,
	i=i+1
	local v=tab[i]

--[[if v then		--如果该递增的下标取值非空,那就返回此下标与值,ipairs类型若遇到nil值,会停止迭代
		return i,v*v
	end
--]]
	if i<=# tab then	--pairs类型,根据迭代次数来限制
		if v==nil then
			return sqriter(tab,i)	--遇到空值从空值的地方开启下一轮迭代,由于lua没有continue只能结束当前函数再重新开启下一个
		else
			return i,v*v
		end
	end

end
function sqrFunc(tab)
	return sqriter,tab,0	--	需要习惯这种不带括号而是跟在后面的传参写法,
end

--测试一下
testTab={1,2,nil,4,5}
for	k,v in sqrFunc(testTab) do
	print(k..' '..v)
end
