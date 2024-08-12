import data from './querys.js'
import jwt from 'jsonwebtoken'
const { JWT_SECRET, JWT_ADMIN } = process.env

export const verificarPertenencia = async (email) => {
  const consulta = 'SELECT rol_id FROM profesional WHERE email = $1;'
  console.log(email)
  const values = [email]
  const usuario = await data(consulta, values)
  let token = null
  if (usuario.length === 0) {
    throw new Error('Usuario no encontrado')
  } else {
    const { rol_id: rol } = usuario[0]
    if (rol === 3) {
      token = jwt.sign({ email }, JWT_ADMIN)
    } else if (rol === 2 || rol === 1) {
      token = jwt.sign({ email }, JWT_SECRET)
    }
  }
  if (token) {
    const { rol_id: rol } = usuario[0]
    const data = { token, rol }
    return data
  }
}

const consultaNombre = async (emailProfesional) => {
  const consulta = 'SELECT id, nombre, rol_id, dupla_id FROM profesional WHERE email = $1;'
  const userParams = [emailProfesional]
  const profesional = await data(consulta, userParams)
  const { id, rol_id: rol, dupla_id: dupla, nombre } = profesional[0]
  let ps = id
  if (rol === 2) {
    ps = dupla
  }
  const consultaDupla = 'SELECT nombre FROM profesional WHERE id = $1;'
  const idDupla = [dupla]
  const datoDupla = await data(consultaDupla, idDupla)
  const { nombre: nombreDupla } = datoDupla[0]
  console.log(nombreDupla)
  return { idPsico: ps, rol, nombre, nombreDupla }
}
export const buscarDatosProfesional = async (email) => {
  const { idPsico, rol, nombre, nombreDupla } = await consultaNombre(email)
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
    dupla: nombreDupla,
    idRol: rol
  }
  const datosPs = resultados.map((resultado) => ({
    nombre: `${resultado.nombre}`,
    id: resultado.id,
    informe: resultado.numero,
    fecha: resultado.ingreso,
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
      await data(consulta, values)
      return true
    }
  } catch (error) {
    return error
  }
}

export const deleteNna = async (id) => {
  try {
    const borradoInforme = 'DELETE FROM informes WHERE nna_id = $1;'
    const values = [id]
    await data(borradoInforme, values)
    const consulta = 'DELETE FROM nna WHERE id = $1 CASCADE;'
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

export const insertNna = async (cod, nna, date, rut, domicilio, ingreso, rit, adulto, psicoId, saludId, educacionalId, motivoId, juzgadoId, parentescoId, comunaId, nacionalidadId, cursoId, genId) => {
  try {
    const datosNna = 'INSERT INTO nna (id, nombre, nac, rut, domicilio, ingreso, rit, adulto_id, psico_id, salud_id, educacional_id, motivo_id, juzgado_id, parentesco_id, comuna_id, nacionalidad_id, curso_id, gen_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18);'
    const values = [cod, nna, date, rut, domicilio, ingreso, rit, adulto, psicoId, saludId, educacionalId, motivoId, juzgadoId, parentescoId, comunaId, nacionalidadId, cursoId, genId]
    await data(datosNna, values)
    return await data(datosNna, values)
  } catch (error) {
    return error
  }
}

export const getDataNna = async (id) => {
  try {
    const consulta = 'SELECT nna.nombre, nna.nac, nna.rut, nna.domicilio, nna.ingreso, nna.rit, adulto.responsable, adulto.nacimiento, adulto.run, adulto.fono, adulto.labores, informes.numero, salud.salud, educacional.ed, motivo.motivo, juzgado.juzgado, comuna.comuna, parentesco.parentesco, nacionalidad.nacion, curso.curso, gen.gen FROM nna RIGHT JOIN informes ON informes.nna_id = nna.id RIGHT JOIN adulto ON adulto.id = nna.adulto_id RIGHT JOIN salud ON salud.id = nna.salud_id RIGHT JOIN educacional ON educacional.id = nna.educacional_id RIGHT JOIN motivo ON motivo.id = nna.motivo_id RIGHT JOIN juzgado ON juzgado.id = nna.juzgado_id RIGHT JOIN parentesco ON parentesco.id = nna.parentesco_id RIGHT JOIN comuna ON comuna.id = nna.comuna_id RIGHT JOIN nacionalidad ON nacionalidad.id = nna.nacionalidad_id RIGHT JOIN curso ON curso.id = nna.curso_id RIGHT JOIN gen ON  gen.id = nna. gen_id WHERE nna.id = $1;'
    const values = [id]
    const resultados = await data(consulta, values)
    return resultados
  } catch (error) {
    return error
  }
}
