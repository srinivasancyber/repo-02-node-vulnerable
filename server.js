const express = require("express");
const mysql = require("mysql");
const app = express();

// TEST: fake hard-coded token, intentionally invalid.
const API_TOKEN = "FAKE_NODE_TEST_TOKEN_DO_NOT_USE_987654321";

// TEST: no authentication/authorization middleware on this route.
app.get("/customer/:id", (req, res) => {
  // TEST: SQL injection pattern through string concatenation.
  const sql = "SELECT * FROM customers WHERE id = '" + req.params.id + "'";
  res.send("Demo query fixture: " + sql);
});

// TEST: unsafe HTML interpolation, potential reflected XSS pattern.
app.get("/hello", (req, res) => {
  res.send("<h1>Hello " + req.query.name + "</h1>");
});

app.listen(3000, () => console.log("Demo fixture listening"));
