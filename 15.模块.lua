--模块的使用--

--加载模块,注意:这里是文件名而不是表名,为了防止混淆,最好把模块和表命名一致

local bool = require'module'
--require ('module')

--执行 require 后会返回加载成功与否的boolean
--如果成功会定义一个与模块同名的全局变量。

if  bool then
print(module.constant)	--	成功打印出模块的内容'这是一个常量'

module.publicFunc()
--	module.localFunc() 	--报错 私有函数无法从外部直接调用
module.func()	--可以通过公有接口访问私有函数

end

