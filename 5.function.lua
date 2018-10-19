--[[
C#里的函数(递归算阶乘):

	int Fact(int n)
	{
		if(n==0)
		{
			return 1;
		}
		else
		{
			return	n*Fact(n-1);
		}
	}
--]]
--[[
--lua里面的函数前要加function关键字,不用标记返回值类型
function fact(n)--参数也不用指定类型
	if n==0 then
		return 1;
	else
		return n* fact(n-1)
	end
end--这个end是方法的结尾

print(fact(5))

func1=fact;	--在lua里方法可以直接被当做变量赋值,而C#里要通过委托
print(func1(5))
func1=1;--重新给func1赋值,他又变成了number类型的了
print(func1)


--把匿名函数当做参数传递
function func(tab,funcArg)
	for k,v in pairs(tab) do
		print( funcArg(k,v))
	end
end

tab={key1='val1',key2='val2','val','vals'}

func(tab,
	function(key,value)
		return(key..'-'..value)
	end
--]]
function PrintResult(n)	--打印结果的方法
	print(n)
end
tab ={}
for i=1,5 do	--给表赋值
	tab[i]=i
	--PrintResult(tab[i])
end
function Fact(n)	--阶乘方法
	if n==0 then
		return 1
	else
		return n*Fact(n-1)
	end
end

function FactTheTable(tableArg,FactFunc)
	i=1;
	while( i<= #tableArg)do
	PrintResult(FactFunc(tableArg[i]))
	i=i+1;
	end
end


FactTheTable(tab,Fact)



