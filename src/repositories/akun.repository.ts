import prisma from "../infrastructures/db.infrastructure";

export default class AkunRepository {
	public static async findAll() {
		return prisma.akun.findMany();
	}

	public static async findByID(id: string) {
		return prisma.akun.findUnique({
			where: { id },
		});
	}

	public static async create(
		id: string,
		nama: string,
		email: string,
        id_prodi: string
	) {
		return prisma.akun.create({
			data: {
				id,
				nama,
                email,
                id_prodi,
			},
		});
	}

	public static async update(
		id: string,
		nama: string,
        email: string,
        id_prodi: string
	) {
		return prisma.akun.update({
			where: { id },
			data: { nama, email, id_prodi, updated_at: new Date() },
		});
	}

	public static async destroy(id: string) {
		return prisma.akun.delete({
			where: { id },
		});
	}
}
