import * as sql from '../models/consultas.js'

// POST ingreso
export const getCredenciales = (req, res) => sql.verificarCredenciales(req.body.name, req.body.password)
  .then((token) => res.status(200).json({ token }))
  .catch((error) => res.status(500).json({ error: error.message })
  )
export const getAdmin = (req, res) => sql.verificarAdmin(req.body.name, req.body.password)
  .then((token) => res.status(200).json({ token }))
  .catch((error) => res.status(500).json({ error: error.message })
  )

// GET
export const getDatosCredencial = async (req, res) => await sql.buscarDatosProfesional(req.user.nombre)
  .then((result) => res.status(200).json(result))
  .catch((error) => res.status(500).json(error)
  )

// PUT
export const putInforme = (req, res) => sql.checkInforme(req.body.id, req.body.rol)
  .then((result) => res.status(200).json(result))
  .catch((error) => res.status(500).json(error)
  )
export const putProrroga = (req, res) => sql.insertProrroga(req.body.date, req.body.id)
  .then((result) => res.status(200).json(result))
  .catch((error) => res.status(500).json(error)
  )

// DELETE
export const deleteNna = (req, res) => sql.deleteNna(req.body.id)
  .then((result) => res.status(200).json(result))
  .catch((error) => res.status(500).json(error)
  )
