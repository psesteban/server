import { Router } from 'express'
import * as controller from '../controllers/usuarios.js'
/* import { authMiddleware } from '../middleware/middleware_verify.js'
import { registerValidator } from '../middleware/register_validator.js'
import { userValidator } from '../middleware/user_validator.js' */

const router = Router()
/* router.route('/usuarios').get(authMiddleware, controller.getDatos).post(registerValidator, controller.postNuevoUsuario)
router.route('/login').post(userValidator, controller.getCredenciales) */

router.route('/informes/:id').get(controller.getInformes).post(controller.postInforme)
export default router
