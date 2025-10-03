import { Prisma } from "@prisma/client";
import FakultasRepository from "../repositories/fakultas.repository";
import { APIError } from "../utils/api-error.util";

export default class FakultasService {
	public static async getAll() {
		const fakultas = await FakultasRepository.findAll();
		if (!fakultas) {
			throw new APIError(`Waduh, fakultas gak ditemukan, mas! 😭`, 404);
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
			throw new APIError(`Waduh, fakultas gak ditemukan, mas! 😭`, 404);
		}
		return {
			response: true,
			message: "Data fakultas berhasil diambil! 😁",
			data: fakultas,
		};
	}

	public static async post(
		kode: string,
		nama: string,
		id_universitas: string,
		id_akun: string
	) {
		try {
			const fakultas = await FakultasRepository.create(
				kode,
				nama,
				id_universitas,
				id_akun
			);
			if (!fakultas) {
				throw new APIError(`Waduh, gagal menambahkan data fakultas! 😭`, 400);
			}
			return {
				response: true,
				message: "Data fakultas berhasil dibuat! 😁",
				data: fakultas,
			};
		} catch (error) {
			if (error instanceof Prisma.PrismaClientKnownRequestError) {
				if (error.code === "P2002") {
					const field = (error as any).meta?.target?.[0];
					throw new APIError(`Waduh, ${field} fakultas ini sudah ada! 😭`, 409);
				}
			}
		}
	}

	public static async put(
		id: string,
		id_universitas: string,
		kode: string,
		nama: string,
		updated_by: string
	) {
		try {
			const fakultas = await FakultasRepository.update(
				id,
				id_universitas,
				kode,
				nama,
				updated_by
			);
			if (!fakultas) {
				throw new APIError(`Waduh, update gagal, mas! 😭`, 400);
			}
			return {
				response: true,
				message: "Data fakultas berhasil diperbarui! 😁",
				data: fakultas,
			};
		} catch (error) {
			if (error instanceof Prisma.PrismaClientKnownRequestError) {
				if (error.code === "P2002") {
					const field = (error as any).meta?.target?.[0];
					throw new APIError(`Waduh, ${field} fakultas ini sudah ada! 😭`, 409);
				}
				if (error.code === "P2025") {
					throw new APIError(
						`Waduh, Gagal update, Data fakultas dengan ID ${id} tidak ditemukan! 😭`,
						404
					);
				}
			}
		}
	}
	public static async delete(id: string) {
		try {
            const fakultas = await FakultasRepository.destroy(id);
            if (!fakultas) {
                throw new APIError(`Waduh, kamu siapa sih? 😭`, 404);
            }
            return {
                response: true,
                message: "Data fakultas berhasil dihapus! 😁",
                data: fakultas,
            };
        } catch (error) {
			if (error instanceof Prisma.PrismaClientKnownRequestError) {
				if (error.code === "P2025") {
					throw new APIError(
						`Waduh, Gagal hapus, Data fakultas dengan ID ${id} tidak ditemukan! 😭`,
						404
					);
				}
			}
		}
	}
}
