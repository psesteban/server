import express from 'express'
import Router from '../routes/routes.js'
import dotenv from 'dotenv'
import cors from 'cors'
import { serverLog } from '../middleware/middleware_log.js'

dotenv.config()
const PORT = process.env.PORT ?? 3000

const app = express()
app.use(cors())
app.use(express.json())
app.use(serverLog)
app.use('/', Router)

app.listen(PORT, () => {
  console.log(`Server corriendo en el port ${PORT}`)
})

export default app
