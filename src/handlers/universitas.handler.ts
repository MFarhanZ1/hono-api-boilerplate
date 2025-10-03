import { Context } from "hono";
import UniversitasService from "../services/universitas.service";

export default class UniversitasHandler {

    public static async getAll(c: Context) {
        return c.json(await UniversitasService.getAll());
    }

    public static async get(c: Context) {
        const { id } = c.req.param();
        return c.json(await UniversitasService.get(id));
    }

    public static async post(c: Context) {
        const { nama, akronim } = await c.req.json();
        const { id: id_akun } = c.get("user");

        return c.json(await UniversitasService.post(nama, akronim, id_akun));
    }

    public static async put(c: Context) {
        const { id } = c.req.param();
        const { nama, akronim } = await c.req.json();
        const { id: id_akun } = c.get("user");
        
        return c.json(await UniversitasService.put(id, nama, akronim, id_akun));
    }

    public static async delete(c: Context) {
        const { id } = c.req.param();
        return c.json(await UniversitasService.delete(id));
    }
}
