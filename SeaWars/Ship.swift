import Foundation

struct Ship
{
    private var status: Array<Int> = []
    func getLenght() -> Int{ status.count }
    public func generateShips(bigShip: UInt8,mediumShip: UInt8,littleShip: UInt8,smalletsShip: UInt8) -> Array<Ship>
    {
        var tmpArr: Array<Ship> = []
        AddShip(arr: &tmpArr, pos: bigShip,count: 4)
        AddShip(arr: &tmpArr, pos: mediumShip,count: 3)
        AddShip(arr: &tmpArr, pos: littleShip,count: 2)
        AddShip(arr: &tmpArr, pos: smalletsShip,count: 1)
        return tmpArr
    }
    mutating func shipActivated(pos:Int,coord: Int) -> Void
    {
        self.status[pos] = coord
    }
    
   mutating func hit(position:Int) -> Void
    {
        self.status[position] = -1
    }
   private func createShip(count:Int) -> Array<Int>
    {
        var tmp: Array<Int> = []
        var i = 0
        while i < count
        {
            tmp.append(-1)
            i+=1
        }
        return tmp
    }
   private func AddShip(arr: inout Array<Ship>, pos: UInt8,count:Int) -> Void
    {
        var i = 0
        while i < pos
        {
            arr.append(Ship(status: createShip(count: count)))
            i+=1
        }
    }
    
}
