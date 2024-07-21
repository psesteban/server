import pkg from 'pg'
import dotenv from 'dotenv'
dotenv.config()
const { Pool } = pkg

/* const { DB_USER, DB_HOST, DB_DATABASE, DB_PASSWORD, DB_PORT } = process.env

const pool = new Pool({
  user: DB_USER,
  host: DB_HOST,
  database: DB_DATABASE,
  password: DB_PASSWORD,
  port: DB_PORT,
  allowExitOnIdle: true
})

pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.log('Error al conectarse a DB:', err)
  } else {
    console.log('DB conectada con éxito', res.rows[0].now)
  }
}) */

const connectionString = process.env.PG_STRING_URL
export const pool = connectionString
  ? new Pool({
    connectionString,
    ssl: {
      rejectUnauthorized: false
    },
    allowExitOnIdle: true
  })
  : new Pool({
    allowExitOnIdle: true
  })
try {
  await pool.query('SELECT NOW()')
  console.log('Database connected')
} catch (error) {
  console.log(error)
}

export default pool
