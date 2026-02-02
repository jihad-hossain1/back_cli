import express, { Request, Response } from "express";
import { databaseConfig } from "./config/database";

const app = express();
const port = 3000;

app.use(express.json());

app.get("/", (req: Request, res: Response) => {
  res.json({
    message: "🚀 Express App started",
    mode: "$PATTERN",
    db: databaseConfig.database,
  });
});

app.listen(port, () => {
  console.log(`🚀 Server running at http://localhost:${port}`);
});
