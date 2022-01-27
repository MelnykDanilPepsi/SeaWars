import Foundation

class Battlefield
{
    var field: Array<Square> = []
    var ships: Array<Ship> = []
    
    struct Square
    {
        var showStatus: String
        var name: String
        var status: Int8 = 0  //0 - clear, 1 - killed, 2 - ship exist, -1 - error(nil)
    }
    
    enum Flags : String{
        case emptyShot = "•"
        case clearShot = "*"
        case trueShot = "X"
    }
    
    subscript (name: String) -> Square
    {
        get { return getFieldByName(name: name) }
        set (newElem) { field[getIDbyName(name: name)] = newElem }
    }
    
    func createField() -> Array<Square>
    {
        let str = UInt32("A") ... UInt32("J")
        let letters = String(String.UnicodeScalarView(str.compactMap(UnicodeScalar.init)))
        var tmpArr: Array<Square> = []
                             
        for leter in letters
        {
            for num in 1...10
            {
                tmpArr.append(Square(showStatus: Flags.emptyShot.rawValue,
                                     name: String(leter) + String(num),status: 0))
            }
        }
        return tmpArr
    }
    func shot(coordinaties: String) -> Bool{
        if field[getIDbyName(name: coordinaties)].showStatus == " "
        {
            
        }
        return false
    }
    
    func getIDbyName(name:String) -> Int{
        Int(field.firstIndex{$0.name == name}!)
    }
    
    func getFieldByName(name:String) -> Square{
        for sq in field
        {
            if sq.name == name {
                return sq
            }
        }
        return Square(showStatus: "", name: "",status: -1)
    }
   private func AddAllShips(arr:Array<Square>) -> Void
    {
        ships = Ship().generateShips(bigShip: 1,mediumShip: 2,littleShip: 3,smalletsShip: 4)
        var c:UInt8 = 0, pos:Bool = false //pos: false - vertical
        for ship in ships
        {
            
        }
    }
    private func getArrSquare(startCoordinaties coord:Int, count:Int8,leftUpOrRightDown lofr: Bool,vertical vh: Bool) -> Array<Square>{
    //left|up - true //  / horizon - true
        var tmpArr : Array<Square> = [],i = 0, c=count
        while i < count{
            if vh && lofr { tmpArr.append(field[coord - Int(c * 10)])}
            else if vh && !lofr { tmpArr.append(field[coord + Int(c * 10)])}
            else if !vh && lofr { tmpArr.append(field[coord - Int(c)]) }
            else { tmpArr.append(field[coord + Int(c)]) }
            c-=1
            i+=1
            return tmpArr
        }
        return tmpArr
    }
    private func getOneSquare(coordinaties: Int) -> Square { field[coordinaties] }
    
    private func checkSquareVertical(arr: Array<Square>,firstCoord:Int) -> Bool{
        var flag = false, coord = 8, index = 0
        flag = checkSquare(arr: arr)
        if !flag{ return false }
        while index < 2 {
            
            index+=1
        }
        return true
    }
    private func checkSquare(arr:Array<Square>) -> Bool{
        for sq in arr {
            if sq.status == 2 { return false }
        }
        return true
    }
    
    func Show() -> Void
    {
        var count=0
        var i = 0
        print(" A B C D E F G H I J")
        print("|--------------------|")
        print("|",terminator: "")
        for f in field{
            print("\(f.showStatus) ",terminator: "")
            i+=1
            if i == 10
            {
                count+=1
                print("| \(count)",terminator: "")
                print("")
                
                print("|",terminator: "")
                i = 0
            }
        }
        print("--------------------|")
        print("*-miss|X-hit|•-clear")
    }
}
    


