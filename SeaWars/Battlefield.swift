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
        var c:UInt8 = 0, pos:UInt8 = 0 //pos: 1 - vertical, 2 - horizon
        for ship in ships
        {
            var flag:Bool = false
            while !flag{
            c = UInt8.random(in: 0...99)
            
            }
        }
    }
    
    private func checkFieldVerical(coordinaties:UInt8,count:UInt8) -> Int8 //-1 false, 1 - up / 2 - down
    {
        if coordinaties % 9 == 0 || coordinaties % 10 == 0
        {
            
        }
        return -1
    }
    private func checkVertical(coordinaties: Int,count : Int8) -> Bool
    {
        var flag = false
        if coordinaties + (Int(coordinaties) * 10) < 99{
            var i = 0, lofr = 2, modul = 8  //left or right side, and modul
            while i < 4 {
                if coordinaties % modul != 0 {
                    flag = checkMechVertical(coordinaties: coordinaties, count: count, leftOrRight: lofr)
                     if flag == false {return false}
                }
                i+=1
                lofr -= 1
                modul += 1
            }
            flag = true
        }
        return flag
    }
    
    private func checkHorizontal(coordinaties: Int,count : Int8) -> Bool
    {
        var flag = false
        if coordinaties + (Int(coordinaties)) < 99{
            var i = 0, lofr = 2, modul = 8  //left or right side, and modul
            
        }
    }
    
    private func checkMechVertical(coordinaties: Int,count : Int8,leftOrRight lofr: Int) -> Bool
    {
        if mechVericalTop(coordinaties: coordinaties) { return false}
        var coord = coordinaties
        while coord < coord + Int(count * 10) {
            if (field[coord+lofr].status == 2) { return false }
            coord += 10
        }
        if mechVericalDown(coordinaties: coordinaties) == false { return false }
        return true
    }
    
   
    private func mechVericalDown(coordinaties: Int) -> Bool
    {
        if coordinaties < field.count - 19{
            if field[coordinaties+10].status == 2 || field[coordinaties+19].status == 2{
                return false
            }
            return true
        }
        if coordinaties < field.count - 9{
            if field[coordinaties+10].status == 2
            {
                return false
            }
        return true
        }
    }
        
    private func mechVericalTop(coordinaties: Int) -> Bool
    {
        if coordinaties > 19{
            if field[coordinaties-10].status == 2 || field[coordinaties-20].status == 2{
                return false
            }
            return true
        }
        if coordinaties < field.count - 9{
            if field[coordinaties+10].status == 2
            {
                return false
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
