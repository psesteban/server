import data from './querys.js'
import jwt from 'jsonwebtoken'
const { JWT_SECRET } = process.env

export const verificarCredenciales = async (nombre, password) => {
  const consulta = 'SELECT password FROM profesional WHERE nombre = $1;'
  const values = [nombre]
  const usuario = await data(consulta, values)
  if (usuario.length === 0) {
    throw new Error('Usuario no encontrado')
  }
  const { password: passwordCorrecta } = usuario[0]
  if (passwordCorrecta !== password) {
    throw new Error('Usuario o contraseña incorrecta')
  }
  const token = jwt.sign({ nombre }, JWT_SECRET)
  return token
}
const consultaNombre = async (nombreProfesional) => { 
  const consulta = 'SELECT id, rol_id, dupla_id FROM profesional WHERE nombre = $1;'
  const userParams = [nombreProfesional]
  const profesional = await data(consulta, userParams)
  const { id, rol_id: rol, dupla_id: dupla } = profesional[0]
  let ps = id
  if (rol === 2) {
    ps = dupla
  }
  return { idProfesional: id, idPsico: ps, rol }
}
export const buscarDatosProfesional = async (nombre) => {
  const { idProfesional, idPsico, rol } = await consultaNombre(nombre)
  const values = [idPsico]
  let consulta = 'SELECT nna.id, nna.nombre, nna.ingreso, informes.numero, informes.informe_ps, informes.informe_ts FROM nna RIGHT JOIN informes ON informes.nna_id = nna.id WHERE psico_id = $1;'
  let resultados = await data(consulta, values)
  if (rol === '3') {
    consulta = 'SELECT nna.id, nna.nombre, nna.ingreso, nna.psico_id, informes.numero, informes.informe_ps, informes.informe_ts, profesional.nombre AS tratante FROM nna RIGHT JOIN informes ON informes.nna_id = nna.id JOIN profesional ON nna.psico_id = profesional.id;'
    resultados = await data(consulta)
  }
const profesional = {
  nombre: nombre, 
  id: idProfesional,
  idRol: rol,
  tratante: idPsico
}
  const datosPs = resultados.map((resultado) => ({
    nombre: `${resultado.nombre}`,
    id: resultado.id,
    informe: resultado.numero,
    fecha: resultado.ingreso,
    profesional: idProfesional,
    estado: resultado.informe_ps
  }))

  const datosTs = resultados.map((resultado) => ({
    nombre: `${resultado.nombre}`,
    id: resultado.id,
    informe: resultado.numero,
    fecha: resultado.ingreso,
    estado: resultado.informe_ts
  }))
    if (rol === 1) return {profesional, casos: datosPs}
       else if (rol === 2) return {profesional, casos: datosTs}
       
}

export const checkInforme = async (nna, rol) => {
  try {
    if (rol === 1) {
      const consulta = 'UPDATE informes SET informe_ps = true WHERE nna_id = $1;'
      const values = [nna]
      return await data(consulta, values)
    } else if (rol === 2) {
      const consulta = 'UPDATE informes SET informe_ts = true WHERE nna_id = $1;'
      const values = [nna]
      return await data(consulta, values)
    } else if (rol === 3) {
      const consulta = 'UPDATE informes SET numero = numero + 1 WHERE nna_id = $1;'
      const values = [nna]
      return await data(consulta, values)
    }
  } catch (error) {
    return error
  }
}

