--文件名为 module.lua
--定义一个名为module的模块,模块和表要命名一致
module={}	--模块的本质就是一个表

--定义一个常量
module.constant='这是一个常量'

--定义一个函数
function module.publicFunc()
	io.write('这是一个公有函数')	--暂时还不懂这个io往哪写入呢
end

module.publicFunc1=function()	--可以从table的角度理解 给名叫publicFunc1的键 赋函数类型的值
	print('另一种写法')
end
local function localFunc()
	print('这是一个私有函数')
end

function module.func()
	localFunc()
end


--模块的结构就是一个table的结构,因此可以像调用table一样调用模块中的常量或函数
