--这是计算射程范围的模块,当然也包括照明弹和火箭发射井的范围计算

--根据移动力计算火力范围
function caculateFlightshot_byMovement()
	firablePoints:clear()

	local p = movablePoints:constReferenceBegin()
	while not movablePoints:constIteratorIsEnd() do
		firablePoints:push_back(p+up)
		firablePoints:push_back(p+down)
		firablePoints:push_back(p+left)
		firablePoints:push_back(p+right)
		p = movablePoints:constReferenceNext()
	end
	firablePoints:eraseDuplicate()
	battleField:removePoints_NoInRange(firablePoints)
end

--根据范围值计算火力范围(好吧这是个比较恶心的递归函数的写法)
function caculateFlightshot_byCenter(center,minDistance,maxDistance)
	if maxDistance then--这是有三个参数的情况
		firablePoints:clear()
		for i=minDistance,maxDistance do
			caculateFlightshot_byCenter(center,i)
		end
		battleField:removePoints_NoInRange(firablePoints)
	else--这是只有两个参数的情况
		local d=minDistance
		for i=1,d do
			tryToAimAt(center,i,i-d)
			tryToAimAt(center,d-i,i)
			tryToAimAt(center,-i,d-i)
			tryToAimAt(center,i-d,-i)
		end
	end
end

--试图瞄准某个点
function tryToAimAt(center,dx,dy)
	local p=Point:new(center.x+dx,center.y+dy)
	firablePoints:push_back(p)
end