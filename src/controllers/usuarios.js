import * as sql from '../models/consultas.js'

// GET

export const getCredenciales = (req, res) => sql.verificarCredenciales(req.body.name, req.body.password)
  .then((token) => res.status(200).json({ token }))
  .catch((error) => res.status(500).json({ error: error.message })
  )

export const getDatosCredencial = async (req, res) => await sql.buscarDatosProfesional(req.user.nombre)
  .then((result) => res.status(200).json(result))
  .catch((error) => res.status(500).json(error)
  )

// POST
export const postInforme = (req, res) => sql.checkInforme(req.params.id, req.query.rol)
  .then((result) => res.status(200).json(result))
  .catch((error) => res.status(500).json(error)
  )
