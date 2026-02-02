import { serve } from "@hono/node-server";
import { Hono } from "hono";
import { databaseConfig } from "./config/database";

const app = new Hono();

app.get("/", (c) => {
  return c.json({
    message: "🚀 Hono App started",
    mode: "$PATTERN",
    db: databaseConfig.database,
  });
});

const port = 3000;
console.log(`🚀 Server is running on http://localhost:${port}`);

serve({
  fetch: app.fetch,
  port,
});
