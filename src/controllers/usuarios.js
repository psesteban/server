import * as sql from '../models/consultas.js'

// POST ingreso
export const getCredencialesGoogle = (req, res) => sql.verificarPertenencia(req.body.email)
  .then((data) => res.status(200).json(data))
  .catch((error) => res.status(500).json({ error: error.message })
  )

// GET
export const getDatosCredencial = async (req, res) => await sql.buscarDatosProfesional(req.user.email)
  .then((result) => res.status(200).json(result))
  .catch((error) => res.status(500).json(error)
  )

export const getInforme = async (req, res) => await sql.getDataNna(req.query.id)
  .then((data) => res.status(200).json(data))
  .catch((error) => res.status(500).json(error)
  )
export const getListas = async (req, res) => await sql.getTablas()
  .then((data) => res.status(200).json(data))
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

export const putInListas = (req, res) => sql.insertNnj(req.body.id, req.body.data)
  .then((result) => res.status(200).json(result))
  .catch((error) => res.status(500).json(error)
  )

// DELETE
export const deleteNna = (req, res) => sql.deleteNna(req.body.selectId)
  .then((result) => res.status(200).json(result))
  .catch((error) => res.status(500).json(error)
  )
