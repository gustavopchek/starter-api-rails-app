# README

## Rails starter API app
---
## Listing links
  GET "/links"
  ### responses
    200: [{ 
         id: 123,
         original_url: "http://abc.de/efghi",
         shortened_url: "http://abc.de/l/abcd"
       }]

## Creating a link
  POST "/links"
  ### params
     - original_url*: string 256 character limit

  ### responses
    200: { 
           id: 123,
           original_url: "http://abc.de/efghi",
           shortened_url: "http://abc.de/l/abcd",
           password: "password"
         }

    400: bad request

## Deleting a link
  POST "/links"
  ### params
   - id*: link id
   - password*: link password

  ### responses
    200: true
    404: not found
    400: bad request