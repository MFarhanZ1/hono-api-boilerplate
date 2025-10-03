import prisma from "../infrastructures/db.infrastructure";

export default class UniversitasRepository {
	public static async findAll() {
		return prisma.universitas.findMany();
	}

	public static async findByID(id: string) {
		return prisma.universitas.findUnique({
			where: { id },			
		});
	}

	public static async create(
		nama: string,
		akronim: string,
		created_by: string
	) {
		return prisma.universitas.create({
			data: {
				nama,
				akronim,
				created_by,
			},
		});
	}

	public static async update(
		id: string,
		nama: string,
		akronim: string,
		updated_by: string
	) {
		return prisma.universitas.update({
			where: { id },
			data: { nama, akronim, updated_by, updated_at: new Date() },
		});
	}

	public static async destroy(id: string) {
		return prisma.universitas.delete({
			where: { id },
		});
	}
}
