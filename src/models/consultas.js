import data from './querys.js'
/* import bcrypt from 'bcryptjs'
import jwt from 'jsonwebtoken'
const { JWT_SECRET } = process.env */

/* export const verificarCredenciales = async ({ email, password }) => {
  const consulta = 'SELECT * FROM usuarios WHERE email = $1;'
  const values = [email]
  const usuario = await data(consulta, values)

  try {
    const { password: passwordEncriptada, email: userEmail } = usuario[0]
    const passwordEsCorrecta = bcrypt.compareSync(password, passwordEncriptada)
    if (!passwordEsCorrecta || usuario.length === 0) throw console.error('Email o contraseña incorrecta')
    return jwt.sign(userEmail, JWT_SECRET)
  } catch (error) {
    return error
  }
}

export const registrarUsuario = async (usuario) => {
  let { email, password, rol, lenguage } = usuario
  const passwordEncriptada = bcrypt.hashSync(password)
  password = passwordEncriptada
  const values = [email, password, rol, lenguage]
  const consulta = 'INSERT INTO usuarios (id, email, password, rol, lenguage) values (DEFAULT, $1, $2, $3, $4);'
  return await data(consulta, values)
}

export const entregarDatos = async (email) => {
  const consulta = 'SELECT * FROM usuarios WHERE email = $1;'
  const values = [email]
  const datos = await data(consulta, values)
  const { rol, lenguage } = datos[0]
  const user = [
    {
      email,
      rol,
      lenguage
    }
  ]
  return user
} */

export const informes = async (rol, ps) => {
  const values = [ps]
  let consulta = 'SELECT nna.id, nna.nombre, nna.ingreso, informes.numero, informes.informe_ps, informes.informe_ts FROM nna RIGHT JOIN informes ON informes.nna_id = nna.id WHERE psico_id = $1;'
  let resultados = await data(consulta, values)

  if (rol === '3') {
    consulta = 'SELECT nna.id, nna.nombre, nna.ingreso, nna.psico_id, informes.numero, informes.informe_ps, informes.informe_ts, profesional.nombre AS tratante FROM nna RIGHT JOIN informes ON informes.nna_id = nna.id JOIN profesional ON nna.psico_id = profesional.id;'
    resultados = await data(consulta)
  }
  try {
    if (rol === '1') {
      return resultados.map((resultado) => ({
        nombre: `${resultado.nombre}`,
        id: resultado.id,
        informe: resultado.numero,
        fecha: resultado.ingreso,
        estado: resultado.informe_ps
      }))
    } else if (rol === '2') {
      return resultados.map((resultado) => ({
        nombre: `${resultado.nombre}`,
        id: resultado.id,
        informe: resultado.numero,
        fecha: resultado.ingreso,
        estado: resultado.informe_ts
      }))
    } else if (rol === '3') {
      return resultados.map((resultado) => ({
        nombre: `${resultado.nombre}`,
        id: resultado.id,
        informe: resultado.numero,
        fecha: resultado.ingreso,
        tratante: resultado.tratante,
        psico: resultado.informe_ps,
        ts: resultado.informe_ts
      }))
    }
  } catch (error) {
    return error
  }
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

export const buscarProfesional = async (user) => {
  const consulta = 'SELECT id, rol_id, dupla_id FROM profesional WHERE id = $1;'
  const idParams = [user]
  const profesional = await data(consulta, idParams)
  const { id, rol_id: rol, dupla_id: dupla } = profesional[0]
  let ps = id
  if (rol === 2) {
    ps = dupla
  }
  return { rol, ps }
}
