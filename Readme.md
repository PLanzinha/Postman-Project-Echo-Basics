# Project 1: Postman Echo Basics

For this first Postman Portfolio project I wnated to start by showing the fundamentals of API testing with Postman, which I do by using the Postman Echo API.

**Goals of this Postman Project:**
*   To Understand the different HTTP methods (GET, POST, PUT, DELETE).
*   To Work with query parameters, request headers, and request bodies such as JSON, form-data, x-www-form-urlencoded.
*   To use Environment and Collection variables like for example `baseUrl`, `postedName` for chaining.
*   As well as to better learn how to write basic test assertions for status codes and response data using `pm.test()` and `pm.expect()`.
*   And finally to run collections with the Collection Runner and see the results.

**API:**
*   Postman Echo: `https://postman-echo.com` which was configured via `baseUrl` in `Echo Env`.

**Results**
*   Successfully sent the various request types and validated the responses as wanted.
*   Performed basic request chaining by using the collection variables.
*   And demonstrated testing for different status codes, which included the 404 not found status for any non-existent endpoints.

**Problems faced on this project:**
*   The Postman Echo API test for the 404 response for non-existent paths had an empty body, which required me to make tests to assert an empty response text rather than for a specific error content.

### Test Cases Used For Project 1

**Test Suite:** P1 - Postman Basics

| ID | Title | Preconditions | Steps | Expected Results |
| :- | :- | :- | :- | :- |
| **P1-001** | Verify GET with multiple query params | - `Echo Env` is active.<br>- `baseUrl` is `https://postman-echo.com`. | 1. Send `GET` to `{{baseUrl}}/get`.<br>2. Use query params: `foo1=bar1` & `foo2=bar2`. | 1. Status is `200 OK`.<br>2. Response body is JSON.<br>3. `args` object contains `foo1: "bar1"` & `foo2: "bar2"`.<br>4. `headers` object contains `"x-forwarded-proto": "https"`. |
| **P1-002** | Verify POST with a raw JSON body | - `Echo Env` is active.<br>- `baseUrl` is `https://postman-echo.com`. | 1. Send `POST` to `{{baseUrl}}/post`.<br>2. Set body to `raw` (JSON).<br>3. Body is: `{"name": "Postman User", "purpose": "Learning"}`. | 1. Status is `200 OK`.<br>2. `Content-Type` header includes `application/json`.<br>3. `json` object in response has `name: "Postman User"` & `purpose: "Learning"`. |
| **P1-003** | Verify PUT with `form-data` | - `Echo Env` is active.<br>- `baseUrl` is `https://postman-echo.com`. | 1. Send `PUT` to `{{baseUrl}}/put`.<br>2. Set body to `form-data`.<br>3. Add keys: `field1: value1_updated` & `field2: value2_updated`. | 1. Status is `200 OK`.<br>2. `form` object in response has `field1: "value1_updated"` & `field2: "value2_updated"`. |
| **P1-004** | Verify basic DELETE request | - `Echo Env` is active.<br>- `baseUrl` is `https://postman-echo.com`. | 1. Send `DELETE` to `{{baseUrl}}/delete`. | 1. Status is `200 OK`. |
| **P1-005** | Verify variable chaining between requests   | - Test Case **P1-002** must be run first.<br>- `postedName` collection variable is set to "Postman User". | 1. Send `GET` to `{{baseUrl}}/get`.<br>2. Use query param: `name_check={{postedName}}`. | 1. Status is `200 OK`.<br>2. `args` object in response has `name_check: "Postman User"`. |
| **P1-006** | Verify 404 for a non-existent endpoint | - `Echo Env` is active.<br>- `baseUrl` is `https://postman-echo.com`. | 1. Send `GET` to `{{baseUrl}}/thisshouldnotexist`. | 1. Status is `404 Not Found`.<br>2. Response body is empty. |