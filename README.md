***Parking Lot project***

This is to help our friend Jimmy fill up his parking lot. There is a ParkingLot class that has a find_parking_spot method; this method will find the first available spot on the lowest floor that's big enough to fit the vehicle.
There is also a MultiVehicleSpot which will maximize the profits for an individual spot by filling it with the most expensive cars.

The app is a basic Sinatra app and can be started by running `ruby app/app\.rb` from the top level of the project 


**API USAGE:**

`GET '/'`: returns current state of Parking Lot

_example request:_ `curl -H "Content-Type: application/json" -X GET http://localhost:4567`


`PUT '/find_parking_spot'`: returns the first available single vehicle spot to fit the given vehicle and claims the spot for the vehicle

_example request:_ `curl -H "Content-Type: application/json" -X PUT -d '{"vehicle": {"size":20,"cost":100}}' http://localhost:4567/find_parking_spot`



`PUT '/fill_multi_vehicle_parking_spot'`: returns the first available multi vehicle spot fills the spot to maximize profit based on vehicles' cost and size

_example request:_ `curl -H "Content-Type: application/json" -X PUT -d '{"vehicles": [{"size":20,"cost":100}, {"size":5,"cost":10}, {"size":30,"cost":120}, {"size":10,"cost":90}]}' http://localhost:4567/fill_multi_vehicle_parking_spot`


The following env vars can be passed when starting the application:
- `LEVELS` (number of levels in the parking lot)
- `SINGLE_VEHICLE_SPOTS` (number of single_vehicle_spots per level)
- `MULTI_VEHICLE_SPOTS` (number of multi_vehicle_spots per level)