import Foundation

class Battlefield
{
    var field: Array<Square> = []
    
    struct Square
    {
        var showStatus: String
        var name: String
        var status: Int8  //0 - clear, 1 - falseShoot, 2 - corable
    }
    
    enum Flags : String{
        case emptyShot = " "
        case clearShot = "*"
        case trueShot = "X"
    }
    
    subscript (name: String) -> Square
    {
        get
        {
            return getFieldByName(name: name)
        }
        set (newElem)
        {
             field[getIDbyName(name: name)] = newElem
        }
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
                                     name: String(leter) + String(num),
                                     status: 0))
            }
        }
        return tmpArr
    }
    func shot(coordinaties: String) -> Bool
    {
        field[getIDbyName(name: name)].status == 
    }
    
    func getIDbyName(name:String) -> Int
    {
        Int(field.firstIndex{$0.name == name}!)
    }
    func getFieldByName(name:String) -> Square
    {
        for sq in field
        {
            if sq.name == name {
                return sq
            }
        }
        return Square(showStatus: "", name: "", status: -1)
    }
    func Show()
    {
        var count=0
        var i = 0
        print(" A B C D E F G H I J")
        print("---------------------")
        print("|",terminator: "")
        for f in field{
            print("\(f.showStatus)|",terminator: "")
            i+=1
            if i == 10
            {
                count+=1
                print(" \(count)",terminator: "")
                print("")
                print("---------------------")
                print("|",terminator: "")
                i = 0
            }
        
        }
        print("*-miss|X-hit")
    }
}
