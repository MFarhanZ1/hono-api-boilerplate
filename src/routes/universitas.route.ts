import { Hono } from "hono";
import { RegExpRouter } from "hono/router/reg-exp-router";
import { zValidator } from "@hono/zod-validator";
import { zodError } from "../utils/zod-error.util";
import { postUniversitasSchema, putUniversitasSchema } from "../validators/universitas.validator";
import UniversitasHandler from "../handlers/universitas.handler";

const universitasRoute = new Hono({ router: new RegExpRouter() });

universitasRoute.get("universitas", UniversitasHandler.getAll);
universitasRoute.get("universitas/:id", UniversitasHandler.get);
universitasRoute.post("universitas", zValidator("json", postUniversitasSchema, zodError), UniversitasHandler.post);
universitasRoute.put("universitas/:id", zValidator("json", putUniversitasSchema, zodError), UniversitasHandler.put);
universitasRoute.delete("universitas/:id", UniversitasHandler.delete);

export default universitasRoute;