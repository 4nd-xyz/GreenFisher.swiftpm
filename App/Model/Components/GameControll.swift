import Foundation

struct GameControll {
  let actionEndGame: (Winner) -> Void
}

enum Winner {
  case player
  case fisher
}
