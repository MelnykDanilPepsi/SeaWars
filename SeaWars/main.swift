import Foundation

print("Welcome to SeaWarsDemo")
print("Coordinaties format: 10A")
print("Get lucky!")


var flag = false
var battle = Battlefield()
battle.ReadKey()
battle.field = battle.createField()
battle.AddAllShips()
while !flag { flag = battle.Show() }

