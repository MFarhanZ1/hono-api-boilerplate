import { Context } from "hono";
import FakultasService from "../services/fakultas.service";

export default class FakultasHandler {

    public static async getAll(c: Context) {
        return c.json(await FakultasService.getAll());
    }

    public static async get(c: Context) {
        const { id } = c.req.param();
        return c.json(await FakultasService.get(id));
    }

    public static async post(c: Context) {
        const { kode, nama, id_universitas } = await c.req.json();
        const { id: id_akun } = c.get("user");

        return c.json(await FakultasService.post(kode, nama, id_universitas, id_akun));
    }

    public static async put(c: Context) {
        const { id } = c.req.param();
        const { id_universitas, kode, nama } = await c.req.json();
        const { id: id_akun } = c.get("user");
        
        return c.json(await FakultasService.put(id, id_universitas, kode, nama, id_akun));
    }

    public static async delete(c: Context) {
        const { id } = c.req.param();
        return c.json(await FakultasService.delete(id));
    }
}
