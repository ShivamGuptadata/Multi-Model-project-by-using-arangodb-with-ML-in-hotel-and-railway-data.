<br/>

<h1 align="center"> Multi-Model knowledge graph using ArangoDB with Wikidata </h1>
<br/>
<br/>
<br/>
<br/>

<a href="#"><img width="100%" height="500px" margin = 20px src="https://venturebeat.com/wp-content/uploads/2019/03/arangodb-dbms-use-case.png?w=1200&strip=all" height="100px"/></a>


<h1 align="center">Hi <img src="https://raw.githubusercontent.com/MartinHeinz/MartinHeinz/master/wave.gif" width="30px">, Welcome</h1>
<h3 align="center"> Problem statement </h3>

Load the Wikidata into ArangoDB and create a graph that represents the relationships between entities, such as people, places, and things. Use AQL to query the graph and find all instances of a particular entity type, such as all instances of a person.





<h1 align="center"> Getaway Guide </h1>

<br>
Over the past few years, the hotel sector has experienced rapid growth, which has increased consumer demand for tailored recommendations. We have created a hotel recommendation system based on customer preferences in this data science assignment adding a railway dataset to see the connectivity of railways along with it.
We use  n Query Model that filter out nearby restaurant , Hospitals and Railway Station . With the help of AQL we manipulate all dataset, create an graph and find a relations between entities for the purpose of  extracting  meaningful information from them. </br>

</br>
<h1> <b> 🚀 Execution: </b> </h1>
<ol>
<li> ArangoDb ByDefault take a JSON formatted data So, we first explore data in any format and then convert it into a JSON format. we created JSONConverter.pynb for generating reliable data format </li>

<li> Connecting Arangodb with python(jupyter notebook using pyArango library, plotting geolocations using Folium library and the graphs on jupyter notebook using networkx libraryuy of python </li>

<li>Using Arangoash create an database _system   </li>

<li> We create a 3 Document collection that contain data of hotels Hotels, Travelling Places and Railway stations and two edge collection for graph connectivity first one for Hotels dataset -> Travelling dataset  and another one  Hotels dataset -> Railway dataset </li>

<li>Explore realtime observation and Form a Queries on them through AQL   </li>
<li> Form a Graph between the attribute of different dataset and make an relationship between them </li>
<li> Use Geo_Location to integrate queries with realtime map</li>
<li>ArangoDb has an feature of arango Search through which we explore an useful insight from descriptive data  </li>
  
</ol>


