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


 //Ranking Hotels in particular city 
  FOR h IN Hotels
 // RETURN u.friends[* RETURN CONCAT(CURRENT.name, " is a friend of ", u.name)]
 filter lower(h.city) == "new delhi" && h.hotel_star_rating != null
    RETURN CONCAT(h.property_name, "is a hotel found in  ", h.city, "and the Rating of the hotels are ",h.hotel_star_rating )
    
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
  
  
  //returning those hotels which provide free private parking
  FOR doc IN perfectView
   SEARCH PHRASE(doc.hotel_description, 'Free private parking','text_en'
  ) 
  RETURN 
  GEO_POINT(doc.longitude,doc.latitude)
  
  
  //those places whose have parking facilities and available in mumbai with high rating and 24 hrs available

  FOR doc IN perfectView
   SEARCH ANALYZER(doc.hotel_description == TOKENS("parking",  "text_en")[0] and
   doc.hotel_description == TOKENS("24",  "text_en")[0]
   And doc.city == "mumbai" and doc.hotel_star_rating !=null  , "text_en")
  RETURN {
   name : doc.Place,
   rating : doc.hotel_star_rating,
   city : doc.city
   }
   
   
   
   
   
   // Filterout those Hotels which have Mountain view 
   FOR doc IN perfectView
   SEARCH ANALYZER( MIN_MATCH(
   phrase(doc.hotel_facilities, 'Mountain view') ,
   phrase(doc.hotel_facilities, 'room service') ,
   phrase(doc.hotel_facilities, '
   climb hill'),2 
   ) ,'text_en'
  ) 
  RETURN {
   name : doc.Place,
   rating : doc.hotel_star_rating,
   city : doc.city
   }
   
   
   //Filter Outh those cities which 
   FOR doc IN perfectView

   SEARCH ANALYZER( starts_with(doc.hotel_facilities, '24'), 'text_en' ) 
   limit 30
  RETURN {
   name : doc.Place,
   rating : doc.hotel_star_rating,
   discription : doc.hotel_facilities,
   city : doc.city
   }
   
   //returning railway datas
   for r in Railway
   filter r.geometry != null
   return r
  
  //those places whose rating are higher and came under cities
FOR doc IN perfectView
  SEARCH ANALYZER(doc.Distance == "4" AND doc.Ratings >3 , "text_en")
  RETURN {
   name : doc.Place,
   rating : doc.Ratings,
   kilometerFromCity : doc.Distance
   }
   
   
   //finding those travelling place with nearby station
for r in Railway
 filter r.properties.state =="Rajasthan"
  for p in placesNkey
  filter p.City == "Jaipur" and p.Ratings != null
  
   return {
   "station" : r.properties.name,
   "City" : p.City,
   "Place" : p.Place,
   "Distance" : p.Distance
   }
   
   
   
   //Graph queries
   //check  b/w cities and unique places
for v,e,p IN 1..2 ANY
'placesNkey/VenkatappaArtGallery' places2hotels
options {uniqueVertices : 'path'}
LIMIT 1000
Return p


//checking how many hotels present in particular city

FOR h IN hotels3
  COLLECT city = h.city WITH COUNT INTO length
  RETURN { 
    "city" : city, 
    "count" : length 
  }
  
  
 //Ranking Hotels in particular city 
  FOR h IN Hotels
 // RETURN u.friends[* RETURN CONCAT(CURRENT.name, " is a friend of ", u.name)]
 filter lower(h.city) == "new delhi" && h.hotel_star_rating != null
    RETURN CONCAT(h.property_name, "is a hotel found in  ", h.city, "and the Rating of the hotels are ",h.hotel_star_rating )

  
