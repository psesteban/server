import data from './querys.js'
import jwt from 'jsonwebtoken'
const { JWT_SECRET, JWT_ADMIN } = process.env

export const verificarCredenciales = async (nombre, password) => {
  const consulta = 'SELECT password, rol_id FROM profesional WHERE nombre = $1;'
  const values = [nombre]
  const usuario = await data(consulta, values)
  if (usuario.length === 0) {
    throw new Error('Usuario no encontrado')
  }
  const { password: passwordCorrecta, rol_id: rol } = usuario[0]
  if (passwordCorrecta !== password) {
    throw new Error('Usuario o contraseña incorrecta')
  } else if (passwordCorrecta === password && rol === 3) {
    throw new Error('No tienes la autorización, ingresa como admin')
  }
  const token = jwt.sign({ nombre }, JWT_SECRET)
  return token
}

export const verificarAdmin = async (nombre, password) => {
  const consulta = 'SELECT password, rol_id FROM profesional WHERE nombre = $1;'
  const values = [nombre]
  const usuario = await data(consulta, values)
  if (usuario.length === 0) {
    throw new Error('Usuario no encontrado')
  }
  const { password: passwordCorrecta, rol_id: rol } = usuario[0]
  if (passwordCorrecta !== password) {
    throw new Error('Usuario o contraseña incorrecta')
  } else if (passwordCorrecta === password && rol !== 3) {
    throw new Error('No tienes la autorización, ingresa como usuario')
  }
  const token = jwt.sign({ nombre }, JWT_ADMIN)
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
  let consulta = 'SELECT nna.id, nna.nombre, nna.ingreso, nna.prorroga, nna.larga_permanencia AS extends, informes.numero, informes.informe_ps, informes.informe_ts FROM nna RIGHT JOIN informes ON informes.nna_id = nna.id WHERE psico_id = $1;'
  let resultados = await data(consulta, values)
  if (rol === 3) {
    consulta = 'SELECT nna.id, nna.nombre, nna.ingreso, nna.prorroga, nna.larga_permanencia AS extends, informes.numero, informes.informe_ps, informes.informe_ts, profesional.nombre AS tratante FROM nna RIGHT JOIN informes ON informes.nna_id = nna.id JOIN profesional ON nna.psico_id = profesional.id;'
    resultados = await data(consulta)
    const casos = resultados.map((resultado) => ({
      nombre: `${resultado.nombre}`,
      id: resultado.id,
      informe: resultado.numero,
      fecha: resultado.ingreso,
      profesional: resultado.tratante,
      ps: resultado.informe_ps,
      ts: resultado.informe_ps,
      prorroga: resultado.prorroga,
      hasta: resultado.extends
    }))
    return { nombre, rol, casos }
  }
  const profesional = {
    nombre,
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
    estado: resultado.informe_ps,
    prorroga: resultado.prorroga,
    hasta: resultado.extends
  }))

  const datosTs = resultados.map((resultado) => ({
    nombre: `${resultado.nombre}`,
    id: resultado.id,
    informe: resultado.numero,
    fecha: resultado.ingreso,
    estado: resultado.informe_ts,
    prorroga: resultado.prorroga,
    hasta: resultado.extends
  }))
  if (rol === 1) return { profesional, casos: datosPs }
  else if (rol === 2) return { profesional, casos: datosTs }
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

export const deleteNna = async (id) => {
  try {
    console.log(id)
    const consulta = 'DELETE FROM nna WHERE id = $1 CASCADE;'
    const values = [id]
    return await data(consulta, values)
  } catch (error) {
    return error
  }
}

const cambiarEstadoProrroga = async (id) => {
  const consulta = 'UPDATE nna SET larga_permanencia = true WHERE id = $1;'
  const values = [id]
  await data(consulta, values)
}

export const insertProrroga = async (date, id) => {
  try {
    const consulta = 'UPDATE nna SET prorroga = $1 WHERE id = $2;'
    const values = [date, id]
    cambiarEstadoProrroga(id)
    return await data(consulta, values)
  } catch (error) {
    return error
  }
}
