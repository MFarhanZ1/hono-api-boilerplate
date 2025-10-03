import prisma from "../infrastructures/db.infrastructure";

export default class FakultasRepository {
	public static async findAll() {
		return prisma.fakultas.findMany({
			include: {
				universitas: true,
			},
		});
	}

	public static async findByID(id: string) {
		return prisma.fakultas.findUnique({
			where: { id },
			include: {
				universitas: true,
			}
		});
	}

	public static async create(
		kode: string,
		nama: string,
		id_universitas: string,
		created_by: string
	) {
		return prisma.fakultas.create({
			data: {
				kode,
				nama,
				id_universitas,
				created_by,
			},
		});
	}

	public static async update(
		id: string,
		id_universitas: string,
		kode: string,
		nama: string,
		updated_by: string
	) {
		return prisma.fakultas.update({
			where: { id },
			data: { id_universitas, kode, nama, updated_by, updated_at: new Date() },
		});
	}

	public static async destroy(id: string) {
		return prisma.fakultas.delete({
			where: { id },
		});
	}
}
