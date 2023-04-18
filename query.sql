-- //counts
FOR h IN hotels
  COLLECT city = h.city WITH COUNT INTO length
  RETURN { 
    "city" : city, 
    "count" : length 
  }

--   //count hotels on the basis of city
FOR h IN hotels
  filter h.city == "ooty"
  filter h.hotel_star_rating != null
  COLLECT rating = h.hotel_star_rating WITH COUNT INTO length
  RETURN { 
    "rating" : rating, 
    "count" : length 
  }

--   //count the famous total chains 
FOR h IN hotels
  //filter h.city == "ooty"
  filter h.hotel_brand != null
  COLLECT brand= h.hotel_brand WITH  COUNT INTO length
  RETURN { 
    "hotels" : brand,
    "Total chain" : length,
  }

--   //graph representation
for h in hotels
FILTER h.country == "India"
-- //FILTER h.state == "Goa"
RETURN GEO_POINT(h.longitude,h.latitude)



FOR h IN hotels
  LET recommendations = ( 
      FILTER h.room_count >= 4 
      SORT h.room_count DESC
      LIMIT 10
      RETURN h
  ) 
  RETURN { recommendations : recommendations }