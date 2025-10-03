import {z} from 'zod'

export const postUniversitasSchema = z.object({
    nama: z.string(),    
    akronim: z.string(),    
})

export const putUniversitasSchema = z.object({
    nama: z.string(),
    akronim: z.string(),
})