import { Hono } from "hono";
import { RegExpRouter } from "hono/router/reg-exp-router";
import FakultasHandler from "../handlers/fakultas.handler";

const fakultasRoute = new Hono({ router: new RegExpRouter() });

fakultasRoute.get("/fakultas", FakultasHandler.getAll);
fakultasRoute.get("/fakultas/:id", FakultasHandler.get);
fakultasRoute.post("/fakultas", FakultasHandler.post);
fakultasRoute.put("/fakultas/:id", FakultasHandler.put);
fakultasRoute.delete("/fakultas/:id", FakultasHandler.delete);

export default fakultasRoute;