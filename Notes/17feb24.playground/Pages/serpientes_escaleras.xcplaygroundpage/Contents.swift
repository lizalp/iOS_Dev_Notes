//: [Previous](@previous)

import Foundation

var rollDice = Int.random(in: 1...6)
var score: Int = 0



//Int.random(in: 1...6) para dado
// gana y termina en casilla "Win" = casilla 0
// inicia en casilla "start" = casilla 24
/* casillas que suben de nivel (suma el score)
 2 a 10 = aumenta 8
 9 a 11 = aumenta 2
 8 a 17 = aumenta 9
 5 a 16 = aumenta 11
*/
/* casillas que bajan de nivel (resta el score)
 21 baja a casilla 10 = resta 11
 18 baja a casilla 7 = resta 11
 23 baja a casilla 16 = resta 7
 11 baja a casilla 3 = resta 8
 */
//tirar dado = generar aleatorio
// score = acumulado de suma de dados

//: [Next](@next)
