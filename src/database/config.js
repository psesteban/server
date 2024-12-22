import pkg from 'pg'
import dotenv from 'dotenv'
dotenv.config()
const { Pool } = pkg

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
