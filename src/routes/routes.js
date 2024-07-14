import { Router } from 'express'
import * as controller from '../controllers/usuarios.js'
import { authMiddleware } from '../middleware/middleware_verify.js'
import { userValidator } from '../middleware/user_validator.js'

const router = Router()
router.route('/usuario').get(authMiddleware, controller.getDatosCredencial)
router.route('/login').post(userValidator, controller.getCredenciales)
router.route('/informes').put(controller.putInforme)
export default router
