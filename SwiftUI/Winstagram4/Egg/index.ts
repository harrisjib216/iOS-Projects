import express from "express";
import bodyParser from "body-parser";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import { createUser, findUser } from "./users";

const app = express();
const PORT = 3000;
const SECRET_KEY = "hegrjoafhiowaoijefhiuafsjoisadoijf";

app.use(bodyParser.json());

// Register route
app.post("/register", async (req, res) => {
  const { username, password } = req.body;
  const user = await createUser(username, password);
  res.status(201).json({ message: "User created", userId: user.id });
});

// Login route
app.post("/login", async (req, res) => {
  const { username, password } = req.body;
  const user = findUser(username);

  if (!user) return res.status(400).json({ error: "User not found" });

  const valid = await bcrypt.compare(password, user.passwordHash);
  if (!valid) return res.status(401).json({ error: "Invalid credentials" });

  const token = jwt.sign({ userId: user.id }, SECRET_KEY, { expiresIn: "1h" });
  res.json({ token });
});

// Protected route
app.get("/protected", (req, res) => {
  const authHeader = req.headers.authorization;
  if (!authHeader) return res.status(401).json({ error: "No token provided" });

  const token = authHeader.split(" ")[1];
  try {
    const decoded = jwt.verify(token, SECRET_KEY);
    res.json({ message: "Access granted", decoded });
  } catch (err) {
    res.status(401).json({ error: "Invalid token" });
  }
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
