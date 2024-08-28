import data from './querys.js'
import jwt from 'jsonwebtoken'
const { JWT_SECRET, JWT_ADMIN } = process.env

export const verificarPertenencia = async (email) => {
  const consulta = 'SELECT rol_id FROM profesional WHERE email = $1;'
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
  return { idPsico: ps, rol, nombre, nombreDupla, id }
}
export const buscarDatosProfesional = async (email) => {
  const { idPsico, rol, nombre, nombreDupla, id } = await consultaNombre(email)
  const values = [idPsico]
  let consulta = 'SELECT nna.id, nna.nombre, nna.ingreso, nna.prorroga, nna.larga_permanencia AS extends, informes.numero, informes.informe_ps, informes.informe_ts FROM nna RIGHT JOIN informes ON informes.nna_id = nna.id WHERE psico_id = $1;'
  let resultados = await data(consulta, values)
  if (rol === 3) {
    const valueId = [id]
    consulta = 'SELECT nna.id, nna.analisis, nna.fecha_analisis AS analizado, nna.url_analisis AS url, nna.nombre, nna.ingreso, nna.prorroga, nna.larga_permanencia AS extends, informes.numero, informes.informe_ps, informes.informe_ts, profesional.nombre AS tratante, profesional.asesoria AS asesor FROM nna RIGHT JOIN informes ON informes.nna_id = nna.id JOIN profesional ON nna.psico_id = profesional.id WHERE profesional.asesoria = $1;'
    resultados = await data(consulta, valueId)
    const casos = resultados.map((resultado) => ({
      nombre: `${resultado.nombre}`,
      id: resultado.id,
      informe: resultado.numero,
      fecha: resultado.ingreso,
      profesional: resultado.tratante,
      ps: resultado.informe_ps,
      ts: resultado.informe_ps,
      prorroga: resultado.prorroga,
      hasta: resultado.extends,
      resumen: resultado.analisis,
      url: resultado.url,
      ultima: resultado.analizado
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

export const getTablas = async () => {
  let consultaTabla = 'SELECT * FROM gen;'
  const arrayGen = await data(consultaTabla)
  consultaTabla = 'SELECT * FROM nacionalidad;'
  const arrayNacionalidad = await data(consultaTabla)
  consultaTabla = 'SELECT * FROM curso;'
  const arrayCurso = await data(consultaTabla)
  consultaTabla = 'SELECT * FROM comuna;'
  const arrayComuna = await data(consultaTabla)
  consultaTabla = 'SELECT * FROM parentesco;'
  const arrayParentesco = await data(consultaTabla)
  consultaTabla = 'SELECT * FROM juzgado;'
  const arrayJuzgado = await data(consultaTabla)
  consultaTabla = 'SELECT * FROM motivo;'
  const arrayMotivo = await data(consultaTabla)
  consultaTabla = 'SELECT * FROM educacional;'
  const arrayEducacional = await data(consultaTabla)
  consultaTabla = 'SELECT * FROM salud;'
  const arraySalud = await data(consultaTabla)
  consultaTabla = 'SELECT id, nombre FROM profesional WHERE rol_id = 1;'
  const arrayTratantes = await data(consultaTabla)
  consultaTabla = 'SELECT id, nombre FROM profesional WHERE rol_id = 2;'
  const arrayTs = await data(consultaTabla)
  consultaTabla = 'SELECT id, responsable FROM adulto;'
  const arrayAdultos = await data(consultaTabla)
  consultaTabla = 'SELECT id, nombre FROM nna;'
  const arrayNna = await data(consultaTabla)
  const tablas = {
    arrayGen,
    arrayNacionalidad,
    arrayCurso,
    arrayComuna,
    arrayParentesco,
    arrayJuzgado,
    arrayMotivo,
    arrayEducacional,
    arraySalud,
    arrayTratantes,
    arrayTs,
    arrayAdultos,
    arrayNna
  }
  return tablas
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
    const adulto = 'SELECT adulto_id FROM nna WHERE id = $1;'
    const borradoInforme = 'DELETE FROM informes WHERE nna_id = $1;'
    const values = [id]
    await data(borradoInforme, values)
    const adultoResponsable = await data(adulto, values)
    const { adulto_id: idAdulto } = adultoResponsable[0]
    const consulta = 'DELETE FROM nna WHERE id = $1;'
    const consultaAdulto = 'SELECT COUNT(*) FROM nna where adulto_id = $1;'
    const borrarAdulto = 'DELETE FROM adulto WHERE id = $1;'
    const idValue = [idAdulto]
    const consultaotrosNna = await data(consultaAdulto, idValue)
    const { count } = consultaotrosNna[0]
    if (count === 1) {
      await data(consulta, values)
      await data(borrarAdulto, idValue)
    } else if (count < 1) {
      await data(consulta, values)
    }
  } catch (error) {
    return error
  }
  return true
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

export const insertNnj = async (datos) => {
  console.log(datos)
  const id = datos.id
  const nombre = datos.nombre
  const nacimiento = datos.nacimiento
  const rut = datos.rut
  const genero = datos.genero
  const nacion = datos.nacion
  const domicilio = datos.domicilio
  const comuna = datos.comuna
  const tratante = datos.tratante
  const causa = datos.causa
  const juzgado = datos.juzgado
  const ingreso = datos.ingreso
  const adulto = datos.adulto
  const motivo = datos.motivo
  const salud = datos.salud
  const educacion = datos.educacion
  const curso = datos.curso
  const parentesco = datos.curso
  try {
    const datosNna = 'INSERT INTO nna (id, nombre, nac, rut, domicilio, ingreso, rit, adulto_id, psico_id, salud_id, educacional_id, motivo_id, juzgado_id, parentesco_id, comuna_id, nacionalidad_id, curso_id, gen_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18);'
    const values = [id, nombre, nacimiento, rut, domicilio, ingreso, causa, adulto, tratante, salud, educacion, motivo, juzgado, parentesco, comuna, nacion, curso, genero]
    await data(datosNna, values)
    const informe = 'INSERT INTO informes (nna_id, numero, informe_ps, informe_ts) VALUES ($1, $2, $3, $4);'
    const valores = [id, 1, false, false]
    return await data(informe, valores)
  } catch (error) {
    console.log(error)
    return error
  }
}
export const insertAdulto = async (e) => {
  const id = e.id
  const responsable = e.responsable
  const nacimiento = e.nacimiento
  const run = e.run
  const fono = e.fono
  const labores = e.labores
  const tsId = e.tsId

  try {
    const datosAdulto = 'INSERT INTO adulto (id, responsable, nacimiento, run, fono, labores, ts_id) VALUES ($1, $2, $3, $4, $5, $6, $7);'
    const values = [id, responsable, nacimiento, run, fono, labores, tsId]
    await data(datosAdulto, values)
    return true
  } catch (error) {
    console.log(error)
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

export const changeAdult = async (datos) => {
  const idAdulto = datos.responsable
  const parentesco = datos.parentesco
  const idNna = datos.id
  try {
    const consulta = 'UPDATE nna SET adulto_id = $1 WHERE id = $2;'
    const values = [idAdulto, idNna]
    await data(consulta, values)
    const consultaPar = 'UPDATE nna SET parentesco_id = $1 WHERE id = $2;'
    const valorPar = [parentesco, idNna]
    const resultados = await data(consultaPar, valorPar)
    return resultados
  } catch (error) {
    return error
  }
}

export const addAnalisis = async (id, fecha, resumen, url) => {
  try {
    const consulta = 'UPDATE nna SET analisis = $1, fecha_analisis = $2, url_analisis = $3  WHERE id = $4;'
    const values = [resumen, fecha, url, id]
    await data(consulta, values)
    return true
  } catch (error) {
    console.log(error)
    return error
  }
}
