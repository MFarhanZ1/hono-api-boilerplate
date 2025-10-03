import {z} from 'zod'

export const postFakultasSchema = z.object({
    kode: z.string(),
    nama: z.string(),
    id_universitas: z.string().uuid({
        message: "Waduh, ID universitas tidak valid, mas! 😅"
    }),
})

export const putFakultasSchema = z.object({
    kode: z.string(),
    nama: z.string(),
    id_universitas: z.string().uuid({
        message: "Waduh, ID universitas tidak valid, mas! 😅"
    }),
})