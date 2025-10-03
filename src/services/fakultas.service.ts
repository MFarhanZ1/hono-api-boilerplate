import FakultasRepository from "../repositories/fakultas.repository";
import { APIError } from "../utils/api-error.util";

export default class FakultasService {

    public static async getAll() {
        const fakultas = await FakultasRepository.findAll();
        if (!fakultas) {
            throw new APIError(`Waduh, kamu siapa sih? 😭`, 404);
        }
        return {
            response: true,
            message: "Data semua fakultas berhasil diambil! 😁",
            data: fakultas,
        };
    }
    public static async get(id: string) {
        const fakultas = await FakultasRepository.findByID(id);
        if (!fakultas) {
            throw new APIError(`Waduh, kamu siapa sih? 😭`, 404);
        }
        return {
            response: true,
            message: "Data fakultas berhasil diambil! 😁",
            data: fakultas,
        };
    }
    public static async post(kode: string, nama: string, id_universitas: string, id_akun: string) {
        const fakultas = await FakultasRepository.create(kode, nama, id_universitas, id_akun);
        if (!fakultas) {
            throw new APIError(`Waduh, kamu siapa sih? 😭`, 404);
        }
        return {
            response: true,
            message: "Data fakultas berhasil diubah! 😁",
            data: fakultas,
        };
    }
    public static async put(id: string, id_universitas: string, kode:string, nama: string, updated_by: string) {
        const fakultas = await FakultasRepository.update(id, id_universitas, kode, nama, updated_by);
        if (!fakultas) {
            throw new APIError(`Waduh, kamu siapa sih? 😭`, 404);
        }
        return {
            response: true,
            message: "Data fakultas berhasil diperbarui! 😁",
            data: fakultas,
        };
    }
    public static async delete(id: string) {
        const fakultas = await FakultasRepository.destroy(id);
        if (!fakultas) {
            throw new APIError(`Waduh, kamu siapa sih? 😭`, 404);
        }
        return {
            response: true,
            message: "Data fakultas berhasil dihapus! 😁",
            data: fakultas,
        };
    }
}
