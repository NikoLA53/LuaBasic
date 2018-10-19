--[[
	lua的面向对象
	对象由属性和方法组成
	Lua中最基本的结构是table,所以需要用table来描述对象的属性
	function也就是方法

	--类:	lua中的类可以用table+function模拟出来

	--继承:	可以通过metatable模拟(不推荐使用,但只模拟最基本的对象基本够用)


--]]

--这个定义,创建了一个新的函数,并且保存在Account对象的withdraw域内
Account  ={balance=1}--新建一个表表示对象,里面含有一个属性balance
 function Account.withdraw(v)	--定义这个类的函数,这个函数是操作成员balance的函数
	Account.balance=Account.balance -v
end

--可以这样调用
print('balance的初始值:'..Account.balance)
Account.withdraw(1)
print('调用函数后的balance值:'..Account.balance)

print('--------------另一个模拟类的例子----------------------------')
--[[
--基类 只有属性
do
	Rectangle={area=0,length=0,breadth=0}--矩形类,三个属性:面积,长,宽
end
--派生类 一个构造方法,一个打印面积方法 ,而这俩方法又同时是基类的成员函数
do
	--派生类的方法 new --类似构造函数
	function Rectangle:new(o,length,breadth)	--function Rectangle:new这种写法应该是默认new为Rectangle的成员函数
		o=o or{}			--这种 or的赋值应该是前面的值如果是nil才选后面的

		setmetatable(o,self)	--给新建的表设置元表(增加访问权限)
		self.__index=self
		self.length=length or 0
		self.breadth=breadth or 0
		self.area=length*breadth
		return o
	end

	--派生类的打印面积方法 printArea
	function Rectangle:printArea()
		print('矩形面积是: '..self.area)
	end
end

--创建派生类对象
	--创建对象是为类的实例分派内存的过程,每个类都有属于自己的内存并共享公共数据
	r = Rectangle:new(nil,10,20)

--访问属性
	print('访问派生对象的长度属性: '..r.length)

--访问成员函数
	--只能使用':'来访问类的成员函数
	print('访问派生对象的成员函数:')
	r:printArea()
--]]
--[[ 自己写了一个圆形的
do	--基类
	Circle={radius=0,area=0}
end

do	--派生类
	function Circle:new(n,r)
		n=n or {}
		setmetatable(n,self)
		self.__index=self
		self.radius= r or 0
		self.area=math.pi * r * r
		return n
	end

	function Circle:printArea()
		print(self.area)
	end
end

cir=Circle:new(nil,5)
cir:printArea()
--]]

print('----------------------------------------------------继承-------------------------------------------------------------')

do	--声明 基类(图形)的属性 area
	Shape={area=0,side=0}
end

do	--基类(图形)的方法

	--构造方法
	function Shape:new(o,s)
		o=o or {}
		setmetatable(o,self)
		self.__index=self
		self.side=s or 0
		self.area='基类的面积为0'
		return o
	end

	--打印面积方法
	function Shape:printArea()
		print(self.area)
	end
end


do	--声明 矩形 调用图形类的构造方法
	Rectangle=Shape:new()	--	可以看做是继承的标志
end
do	--矩形的派生方法

	--矩形自身的构造方法
	function Rectangle:new(o,w,h)
		o=o or Shape:new(nil,2)	--	这个地方有些不一样,不再是{}了,可以用父类的
		setmetatable(o,self)
		self.__index=self
		self.width=w or 0
		self.height=h or 0
		self.area=w*h
		return o
	end

	function Rectangle:printArea()
		print('矩形的面积: '..self.area..' side:'..self.side)
	end

end


do	--声明 圆形 调用图形类的构造方法
	Sphere=Shape:new()
end

do	--圆形的派生方法
	--圆形自己的构造方法
	function Sphere:new(o,r)
		o=o or Shape:new(nil,99)
		setmetatable(o,self)
		self.__index=self
		self.radius=r or 0
		self.area=math.pi*r*r
		return o
	end

	--圆形的打印面积方法
	function Sphere:printArea()
		print('圆形的面积: '..self.area..' side:'..self.side)
	end
end


myshape= Shape:new(nil,3)
myshape:printArea()

myRectangle=Rectangle:new(myshape,2,3)
myRectangle:printArea()
print(string.format('矩形的宽:%d,高%d',myRectangle.width,myRectangle.height))

mySphare=Sphere:new(myshape,6)
mySphare:printArea()
print('圆形的半径'..mySphare.radius)

mySphare2=Sphere:new(myshape,10)
mySphare2:printArea()
print('圆形2的半径'..mySphare2.radius)













