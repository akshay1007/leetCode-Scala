package dsa

class ParkingSystem(_big: Int, _medium: Int, _small: Int) {
  val map = collection.mutable.Map[Int, Int]()
  map.put(1, _big)
  map.put(2, _medium)
  map.put(3, _small)

  def addCar(carType: Int): Boolean = {
    map.put(carType, map(carType) - 1)
    if (map(carType) < 0) return false
    return true
  }
}

  object main {
    def main(args:Array[String]): Unit ={
      //Your ParkingSystem object will be instantiated and called as such:
      val big = 3
      val medium = 2
      val small = 0
      val carType = 3
      var obj = new ParkingSystem(big, medium, small)
      var param_1 = obj.addCar(carType)
      println(param_1)
    }
  }


