import prisma from "../src/infrastructures/db.infrastructure";

console.log("[INFO] Seeding database...");

async function main() {
	console.log("[DEBUG] Running createMany...");

	const resultUniversitas = await prisma.universitas.createMany({
		data: [
			{	
				id: "18fd16f1-6860-4481-80d1-795e17f8e602",		
				nama: "Universitas Islam Negeri Sultan Syarif Kasim Riau",
				akronim: "UIN Suska Riau",
			},
		],
		skipDuplicates: true,
	});

	console.log(
		"[DEBUG] Result of inserted universitas createMany:",
		resultUniversitas.count > 0
			? resultUniversitas
			: "Data was inserted previously, no new data inserted."
	);

	const resultFakultas = await prisma.fakultas.createMany({
		data: [
			{	
				id: "50c9da56-4ee5-4eea-b148-0b3b96c92311",
				kode: "FST",
				nama: "Fakultas Sains dan Teknologi",
				id_universitas: "18fd16f1-6860-4481-80d1-795e17f8e602",
			},
		],
		skipDuplicates: true,
	});

	console.log(
		"[DEBUG] Result of inserted fakultas createMany:",
		resultFakultas.count > 0
			? resultFakultas
			: "Data was inserted previously, no new data inserted."
	);

	const resultProgramStudi = await prisma.program_studi.createMany({
		data: [
			{	
				id: "7e177c60-d3bd-4386-8428-2e735bccef89",
				kode: "TIF",
				nama: "Teknik Informatika",
				id_fakultas: "50c9da56-4ee5-4eea-b148-0b3b96c92311",
			},
		],
		skipDuplicates: true,
	});

	console.log(
		"[DEBUG] Result of inserted program_studi createMany:",
		resultProgramStudi.count > 0
			? resultProgramStudi
			: "Data was inserted previously, no new data inserted."
	);
}

main()
	.catch((e) => {
		console.error(`[ERROR] ${e.message}`);
		console.error(e);
		process.exit(1);
	})
	.finally(async () => {
		console.log("[INFO] Seeding finished, disconnecting...");
		await prisma.$disconnect();
		process.exit(0);
	});
