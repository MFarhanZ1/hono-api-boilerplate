import { Prisma } from "@prisma/client";
import { APIError } from "../utils/api-error.util";
import UniversitasRepository from "../repositories/universitas.repository";

export default class UniversitasService {
	public static async getAll() {
		const universitas = await UniversitasRepository.findAll();
		if (!universitas) {
			throw new APIError(`Waduh, universitas gak ditemukan, mas! 😭`, 404);
		}
		return {
			response: true,
			message: "Data semua universitas berhasil diambil! 😁",
			data: universitas,
		};
	}
	public static async get(id: string) {
		const universitas = await UniversitasRepository.findByID(id);
		if (!universitas) {
			throw new APIError(`Waduh, universitas gak ditemukan, mas! 😭`, 404);
		}
		return {
			response: true,
			message: "Data universitas berhasil diambil! 😁",
			data: universitas,
		};
	}

	public static async post(
		nama: string,
		akronim: string,
		id_akun: string
	) {
		try {
			const universitas = await UniversitasRepository.create(
				nama,
				akronim,
				id_akun
			);
			if (!universitas) {
				throw new APIError(`Waduh, gagal menambahkan data universitas! 😭`, 400);
			}
			return {
				response: true,
				message: "Data universitas berhasil diubah! 😁",
				data: universitas,
			};
		} catch (error) {
			if (error instanceof Prisma.PrismaClientKnownRequestError) {
				if (error.code === "P2002") {
					const field = (error as any).meta?.target?.[0];
					throw new APIError(`Waduh, ${field} universitas ini sudah ada! 😭`, 409);
				}
			}
		}
	}

	public static async put(
		id: string,
		nama: string,
		akronim: string,
		updated_by: string
	) {
		try {
			const universitas = await UniversitasRepository.update(
				id,
				nama,
				akronim,
				updated_by
			);
			if (!universitas) {
				throw new APIError(`Waduh, update gagal, mas! 😭`, 400);
			}
			return {
				response: true,
				message: "Data universitas berhasil diperbarui! 😁",
				data: universitas,
			};
		} catch (error) {
			if (error instanceof Prisma.PrismaClientKnownRequestError) {
				if (error.code === "P2002") {
					const field = (error as any).meta?.target?.[0];
					throw new APIError(`Waduh, ${field} universitas ini sudah ada! 😭`, 409);
				}
				if (error.code === "P2025") {
					throw new APIError(
						`Waduh, Gagal update, Data universitas dengan ID ${id} tidak ditemukan! 😭`,
						404
					);
				}
			}
		}
	}
	public static async delete(id: string) {
		try {
            const universitas = await UniversitasRepository.destroy(id);
            if (!universitas) {
                throw new APIError(`Waduh, kamu siapa sih? 😭`, 404);
            }
            return {
                response: true,
                message: "Data universitas berhasil dihapus! 😁",
                data: universitas,
            };
        } catch (error) {
			if (error instanceof Prisma.PrismaClientKnownRequestError) {
				if (error.code === "P2025") {
					throw new APIError(
						`Waduh, Gagal hapus, Data universitas dengan ID ${id} tidak ditemukan! 😭`,
						404
					);
				}
			}
		}
	}
}
