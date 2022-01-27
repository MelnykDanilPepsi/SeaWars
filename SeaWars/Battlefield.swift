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
        func compareSquare(sq:Square)->Bool
        {
            if self.showStatus == sq.showStatus && self.name == sq.name && self.status == sq.status { return true }
            return false
        }
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
    private func getOneSquareByCoord(coordinaties: Int) -> Square { field[coordinaties] }

    private func checkSquareVertical(arr: Array<Square>,firstCoord:Int) -> Bool{
        if checkSquare(arr: arr,vertical:true){ return false}
        if firstCoord % 9 != 0{
            if !checkNaighbors(count: 2, num: 1, coord: firstCoord, countArr: Int8(arr.count), leftUpOrRightDown: false, vertical: true){
                return false
            }
        }
        if firstCoord % 10 != 0{
            if !checkNaighbors(count: 2, num: -1, coord: firstCoord, countArr: Int8(arr.count), leftUpOrRightDown: false, vertical: true){
                return false
            }
        }
        return true
    }
    private func checkNaighbors(count:Int,num:Int,coord: Int, countArr: Int8, leftUpOrRightDown lofr: Bool, vertical vh: Bool) -> Bool
    {
        var i = 0, neighbor : Array<Square>, n = num
        while i < count{
            neighbor = getArrSquare(startCoordinaties: coord+n, count: countArr, leftUpOrRightDown: lofr, vertical: vh)
            if !checkSquare(arr: neighbor, vertical: vh){
                return false
            }
            i+=1
            n = num * 2
        }
        return true
    }
    private func checkSquare(arr:Array<Square>,vertical:Bool) -> Bool {
        var index = indexFieldByElem(square: arr[0])
        if vertical && index - 9 > 0{
            if field[index-9].status == 2 { return false }
        }
        for sq in arr {
            if sq.status == 2 { return false }
        }
        index = indexFieldByElem(square: arr[arr.count-1])
        if vertical && index + 9 < 99{
            if field[index+9].status == 2 { return false }
        }
        return true
    }
    
    private func indexFieldByElem(square:Square) -> Int
    {
        for (index,sq) in field.enumerated(){
            if sq.compareSquare(sq: square){
                return index
            }
        }
        return -1
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
    


