# Project 1: Postman Echo Basics

For this first Postman Portfolio project I wnated to start by showing the fundamentals of API testing with Postman, which I do by using the Postman Echo API.

**Goals of this Postman Project:**
*   To Understand the different HTTP methods (GET, POST, PUT, DELETE).
*   To Work with query parameters, request headers, and request bodies such as JSON, form-data, x-www-form-urlencoded.
*   To use Environment and Collection variables like for example `baseUrl`, `postedName` for chaining.
*   As well as to better learn how to write basic test assertions for status codes and response data using `pm.test()` and `pm.expect()`.
*   And finally to run collections with the Collection Runner and see the results.

**API Used:**
*   Postman Echo: `https://postman-echo.com` which was configured via `baseUrl` in `Echo Env`.

**Results**
*   Successfully sent the various request types and validated the responses as wanted.
*   Performed basic request chaining by using the collection variables.
*   And demonstrated testing for different status codes, which included the 404 not found status for any non-existent endpoints.

**Problems faced on this project:**
*   The Postman Echo API test for the 404 response for non-existent paths had an empty body, which required me to make tests to assert an empty response text rather than for a specific error content.