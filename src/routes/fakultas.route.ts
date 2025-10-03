import { Hono } from "hono";
import { RegExpRouter } from "hono/router/reg-exp-router";
import FakultasHandler from "../handlers/fakultas.handler";
import { zValidator } from "@hono/zod-validator";
import { postFakultasSchema, putFakultasSchema } from "../validators/fakultas.validator";
import { zodError } from "../utils/zod-error.util";

const fakultasRoute = new Hono({ router: new RegExpRouter() });

fakultasRoute.get("/fakultas", FakultasHandler.getAll);
fakultasRoute.get("/fakultas/:id", FakultasHandler.get);
fakultasRoute.post("/fakultas", zValidator("json", postFakultasSchema, zodError), FakultasHandler.post);
fakultasRoute.put("/fakultas/:id", zValidator("json", putFakultasSchema, zodError), FakultasHandler.put);
fakultasRoute.delete("/fakultas/:id", FakultasHandler.delete);

export default fakultasRoute;